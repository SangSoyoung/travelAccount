package com.travel.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.travel.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RequestMapping("/fileUpload/*")
@Controller
@Log4j
public class UploadController {

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	@PostMapping("/uploadFormAction") // uploadFile은 변수명 바꾸면 안됨. input file name과 동일해야함!!
	public void uploadFormPost(MultipartFile[] uploadFile, Model model, HttpServletRequest request) {
		
		//String uploadFolder = "C:\\upload";
		String root_path = request.getSession().getServletContext().getRealPath("/");
		log.info(root_path);
		String attach_path = "resources\\upload\\";
		String uploadFolder = root_path + attach_path;
		log.info(uploadFolder);
		

		List<String> files = new ArrayList<>();
		for(MultipartFile multipartFile : uploadFile) {
			log.info("---------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename()); // 파일명
			log.info("Upload File Size : " + multipartFile.getSize()); // 파일크기
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename()); 
			//업로드 폴더에 요소의 진짜이름으로 저장
			
			try {
				multipartFile.transferTo(saveFile); // 파일업로드
				files.add(saveFile.getName()); // 파일명만 문자열로 저장
			} catch(Exception e) {
				log.error(e.getMessage());
			}
		}
		model.addAttribute("uploadFiles", files);
	}
	
	
	
	@GetMapping("/fileUpload")
	public void fileUpload() {
		//파일업로드
	}
	
	@PostMapping("/fileSaveOut")
	public void fileSaveOut(MultipartFile[] uploadFile, Model model, HttpServletRequest request) {
		//업로드파일 저장+출력
		String root_path = request.getSession().getServletContext().getRealPath("/");
		log.info(root_path);
		String attach_path = "resourses\\upload\\";
		String uploadFolder = root_path + attach_path;
		log.info(uploadFolder);
		
		List<String> files = new ArrayList<>();
		for(MultipartFile multipartFile : uploadFile) {
			log.info("---------------------");
			log.info("업로드 파일명 : " + multipartFile.getOriginalFilename());
			log.info("업로드 파일 크기 : " + multipartFile.getSize());
			// 파일 저장
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
				files.add(saveFile.getName());
			} catch(Exception e) {
				log.error(e.getMessage());
			}
		}
		model.addAttribute("uploadFiles", files);
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

