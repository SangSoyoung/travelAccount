package com.travel.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.travel.domain.AttachFileDTO;
import com.travel.domain.BoardAttachVO;
import com.travel.domain.BoardVO;
import com.travel.domain.Criteria;
import com.travel.domain.PageDTO;
import com.travel.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;


@Controller
@RequestMapping("/board/*")
@Log4j
//@AllArgsConstructor
public class BoardController {
	
	@Setter(onMethod_= @Autowired)
	private BoardService service;
	
	// 목록
//	@GetMapping("/reviewInfoBoard")
//	public void list(Model model) {
//		log.info("정보&후기 목록 페이지");
//		String category = "'여행후기', '여행정보'";
//		//Criteria cri = new Criteria();
//		
//		model.addAttribute("list", service.getList(category));
//	}
	
	@GetMapping("/map3")
	public void loadMap() {
		// 지도 출력
	}
	
	@GetMapping("/map4")
	public void saveMap() {
		//+ 위도/경도 출력
	}
	

	
	@GetMapping("/reviewInfoBoard") // 게시물 목록
	public void list(Criteria cri, Model model, BoardVO vo) {
		
		log.info("정보&후기 목록 페이지" + cri);
		String category = "'여행후기', '여행정보'";
		
		List<BoardVO> list = service.getList(category, cri);

		// 게시물 썸네일 이미지(첨부파일)
		for(int i=0; i < list.size(); i++) {
			
			List<BoardAttachVO> files = service.getAttachList(list.get(i).getBoardNo());
			
			for(int j=0; j < files.size(); j++) {
				
				String uploadPath = files.get(j).getUploadPath();
				String uuid = files.get(j).getUuid();
				String fileName = files.get(j).getFileName();
				
				try {
					String fileCallPath = URLEncoder.encode(uploadPath+"/"+uuid+"_"+fileName, "utf-8");
					log.info(fileCallPath); 
					// Photo에 넣기
					list.get(i).setPhoto(fileCallPath);
					log.info(list.get(i).getPhoto());
					
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}	
				
			}
			
		} // end 게시물 썸네일 이미지
		
		model.addAttribute("list", list);
		
		
		int total = service.getTotal(category, cri);
		log.info("total:" + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	// 상세 페이지 + 수정 페이지로 이동
	@GetMapping({"/getReviewInfo", "/updateReviewInfo"})
	public void get(@RequestParam("boardNo") Long boardNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("정보&후기 상세/수정 페이지" + boardNo);
		
		model.addAttribute("board", service.get(boardNo));
	}
		
	// 상세 페이지 : 첨부파일 보기
	@GetMapping(value="/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<BoardAttachVO> getAttachList(Long boardNo){
		log.info("첨부파일 조회" + boardNo);
		return service.getAttachList(boardNo);
	}
	
	
	
	// 등록
	@GetMapping("/insertReviewInfo")
	public void register() {
	
	}
	// 등록 프로세스
	@PostMapping("/insertReviewInfo")
	public String insert(BoardVO board, RedirectAttributes rttr) {
		log.info("=================================");
		log.info("정보&후기 등록 페이지" + board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("=================================");
		
		service.insertSelectKey(board);
		rttr.addFlashAttribute("result", board.getBoardNo());
		
		return "redirect:/board/reviewInfoBoard";
	}
	

	// 수정
	@PostMapping("/updateReviewInfo")
	public String update(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("정보&후기 수정" + board);

//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		if(service.update(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/reviewInfoBoard" + cri.getListLink();
	}
	
	
	
	// 첨부파일 삭제
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("첨부파일 삭제.........");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				// deleteFiles 메소드 인수 수를 맞춰주기 위해 직접 객체 생성
				HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

				String root_path = request.getSession().getServletContext().getRealPath("/");
				log.info(root_path);
				String attach_path = "resources\\upload\\";
				String uploadFolder = root_path + attach_path;
				log.info(uploadFolder);
				
				Path file = Paths.get(uploadFolder+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get(uploadFolder+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
				
			} catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		}); // end foreach
	}
	
	// 삭제
	@PostMapping("/deleteReviewInfo")
	public String delete(@RequestParam("boardNo") Long boardNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("정보&후기 삭제" + boardNo);
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		List<BoardAttachVO> attachList = service.getAttachList(boardNo);
		
		if(service.delete(boardNo)) {
			
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/reviewInfoBoard" + cri.getListLink();
	}


	/************************************************************/
	// Ajax를 이용하는 파일 업로드
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
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
