package com.travel.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.travel.common.DateOutputUtil;
import com.travel.domain.AccountExpenseDTO;
import com.travel.domain.AccountVO;
import com.travel.domain.AttachFileDTO;
import com.travel.domain.BoardAttachVO;
import com.travel.domain.TravelDateDTO;
import com.travel.service.AccountService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RequestMapping("/account/*")
@Controller
@Log4j
@AllArgsConstructor
public class AccountController {

	private AccountService service;
	
	
	@GetMapping("/getTravelAccountList") // 날짜 목록 출력(paging) 
	public void dateList(@RequestParam("travelNo") Long travelNo, Model model, HttpSession session) {

		session.setAttribute("travelNo", travelNo);
		
		TravelDateDTO td = service.getTravelDate(travelNo);
		//log.info(td.getTravelNo());
		
		Date startDate = td.getStartDate();
		Date endDate = td.getEndDate();
		
		// 날짜 포맷 변경(2022-04-06 00:00:00)
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		String startDateF = dtFormat.format(startDate);
		String endDateF = dtFormat.format(endDate);
		//log.info("시작일 : " + startDateF + " 종료일 : " + endDateF);

		// 여행날짜들 얻기 ********************************
		DateOutputUtil dateop = new DateOutputUtil();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-d");

		LocalDate startDateP = LocalDate.parse(startDateF, formatter);
		LocalDate endDateP = LocalDate.parse(endDateF, formatter);

		List<LocalDate> dates = dateop.getDatesBetweenTwoDates(startDateP, endDateP);
		//log.info("여행일정 : " + dates);
		//dates.forEach(i -> log.info("여행일 : " + i));
		

		// 여행정보 출력 : 날짜/연/월/일/요일 ********************************
		List<Map<String, String>> dateInfo = new ArrayList<>();
		for(int i = 0; i < dates.size(); i++) {
			//log.info("여행일자 : " + i);
			String date = dates.get(i).toString();
			String year = dates.get(i).getYear() + "년";
			String month = dates.get(i).getMonth().getDisplayName(TextStyle.SHORT, Locale.KOREAN);
			String day = dates.get(i).getDayOfMonth() + "일";
			String dow = dates.get(i).getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREAN);
			//log.info(i +"번" + date + " : " + year +" "+ month +" "+  day +" "+ dow);
	
			Map<String, String> map = new HashMap<String, String>();
			map.put("date", date);
			map.put("year", year);
			map.put("month", month);
			map.put("day", day);
			map.put("dow", dow);
			
			dateInfo.add(map);
			//log.info("map : " + map);
		}
		
		// 마지막날 정보 넣기
		Map<String, String> mapEd = new HashMap<String, String>();
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(endDate);
		cal.add(Calendar.MONTH, 1);
		
		String dateEd = new SimpleDateFormat("yyyy-MM-dd").format(endDate);
		String yearEd = new SimpleDateFormat("yyyy년").format(endDate);
		String monthEd = new SimpleDateFormat("M월").format(endDate);		
		String dayEd = 	new SimpleDateFormat("dd일").format(endDate);
		
		mapEd.put("date", dateEd);
		mapEd.put("year", yearEd);
		mapEd.put("month", monthEd);
		mapEd.put("day", dayEd);
		mapEd.put("dow", cal.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, Locale.KOREAN));
		
		dateInfo.add(mapEd);
		
		model.addAttribute("dateInfo", dateInfo);

		// 여행일 페이징 ********************************
		// 종료일 ~ 시작일 사이 일수
		long diffSec = (endDate.getTime() - startDate.getTime()) / 1000;
		int diffDays = (int)diffSec / (24*60*60); //일자수 차이

		int endPage = (int)(Math.ceil(diffDays / 5.0)) * 5;
		int startPage = endPage - (endPage-1);

		int realEnd = diffDays;
		//log.info("사이일수 : " + realEnd);
		//log.info("시작번호" + startPage);
		//log.info("끝번호" + endPage);
		
		if(realEnd < endPage) {
			endPage = realEnd;
		}
		boolean prev = startPage > 1;
		boolean next = endPage < realEnd;
		
		td.setStartPage(startPage);
		td.setEndPage(endPage);
		td.setPrev(prev);
		td.setNext(next);
		
		model.addAttribute("td", td); //시작일, 종료일, 페이징, 여행번호
	}
	
	
	// 지출 등록
	@ResponseBody
	@RequestMapping("/regExpense")
	public void regExpense(AccountVO account, HttpServletRequest request, RedirectAttributes rttr) {

		if(account.getAttachList() != null) {
			account.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("=================================");
		
		
		String dateTime = request.getParameter("date") + " " + request.getParameter("time");
		account.setDateTime(dateTime);
		log.info(dateTime);
		log.info(account);

		rttr.addFlashAttribute("result", account.getAccountNo());
		
		
		int type = Integer.parseInt(request.getParameter("type"));
		log.info(type);
		
		
			log.info("지출 등록...........");
			service.regExp(account);
		
	}
	
	// 예산 등록
	@ResponseBody
	@RequestMapping("/regBudget")
	public void regBudget(AccountVO account, HttpServletRequest request, RedirectAttributes rttr) {

		
		String dateTime = request.getParameter("date") + " " + request.getParameter("time");
		account.setDateTime(dateTime);
		log.info(dateTime);
		log.info(account);

		rttr.addFlashAttribute("result", account.getAccountNo());
		
		
			log.info("예산 등록...........");
			service.regBdg(account);
		
	}
	

	// 예산/지출 조회
	@ResponseBody
	@RequestMapping(value="/getExpense")
	public AccountVO getExpense(@RequestParam("accountNo") Long accountNo) {
		log.info("지출 내역 상세 조회...........");
		log.info("내역번호" + accountNo);
		AccountVO account = service.getExp(accountNo);
		log.info("상세정보" + account);
		
		return account;
	}
	// 상세 페이지 : 첨부파일 보기
	@GetMapping(value="/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<BoardAttachVO> getAttachList(@RequestParam("accountNo") Long accountNo){
		log.info("첨부파일 조회" + accountNo);
		return service.getAttachList(accountNo);
	}
	
	
	// 예산/지출 수정

	

	// 예산/지출 삭제
	

	
	// 예산/지출 목록 출력
	@ResponseBody // @RestController
	@GetMapping(value="/account") // 문자열은 @RequestParam으로 넘기기
	public List<AccountVO> getAccount(@RequestParam("travelNo") Long travelNo, @RequestParam("dateTime") String dateTime){

		
		//log.info(travelNo + "여행번호" + dateTime + "의 예산/지출 목록 출력");
		List<AccountVO> list = service.getAccount(travelNo, dateTime);

		return list;
	}
	
	
	
	// 지출 그래프
	@GetMapping("/getExpenseGraph")
	public void getGraph(@RequestParam("travelNo") Long travelNo, Model model) {
		
		List<AccountExpenseDTO> ae = service.totalByCategory(travelNo);
		int total = service.totalExpense(travelNo);
		
		model.addAttribute("total", total);
		model.addAttribute("ae", ae);
	}
	
	
	/************************************************************/
	// Ajax를 이용하는 파일 업로드
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		//log.info("upload ajax");
	}
	
	@PostMapping(value="/uploadAjaxAction")
	@ResponseBody // RestControll과 동일(중요!!)
	public List<AttachFileDTO> uploadAjaxPost(MultipartFile[] uploadFile, HttpServletRequest request) {
		log.info("update ajax post..............");
		
		List<AttachFileDTO> list = new ArrayList<>();
		
		String root_path = request.getSession().getServletContext().getRealPath("/");
		log.info(root_path);
		String attach_path = "resources\\upload\\";
		String uploadFolder = root_path + attach_path;
		log.info(uploadFolder);
		
		
		// 폴더 생성(폴더명 : getFolder메서드 이용)
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("업로드 경로: " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			log.info("--------------------------------------");
			log.info("업로드 파일명: " + multipartFile.getOriginalFilename());
			log.info("업로드 파일크기: " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			
			// 파일명 중복방지를 위한 UUID 적용
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			
			
			try {
				//File saveFile = new File(uploadFolder, uploadFileName);
				// 폴더가 새로 생성될 수 있기 때문에 경로로 설정
				File saveFile = new File(uploadPath, uploadFileName); 
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				// 업로드된 파일이 이미지 타입일 경우, 섬네일을 생성
				if(checkImageType(saveFile)) {
					
					attachDTO.setImage(true);
					
					// 이미지일 경우, 파일명 앞에 s_를 붙임
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					// 섬네일의 width와 height를 파라미터로 지정
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				} // end if
				list.add(attachDTO);
				
			} catch(Exception e) {
				log.error(e.getMessage());
			}// end catch
		} // end for
		
		return list;
	}
	
	// 폴더명 메서드 추가(오늘 날짜의 경로를 문자열로 생성 - yyyy/MM/dd 형식)
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	// 특정 파일이 이미지 타입인지 검사하는 메서드 추가
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// 섬네일 데이터 전송
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName, HttpServletRequest request) {
		
		String root_path = request.getSession().getServletContext().getRealPath("/");
		log.info(root_path);
		String attach_path = "resources\\upload\\";
		String uploadFolder = root_path + attach_path;
		log.info(uploadFolder);
		
		log.info("fileName: " + fileName);
		
		File file = new File(uploadFolder + fileName);
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}
