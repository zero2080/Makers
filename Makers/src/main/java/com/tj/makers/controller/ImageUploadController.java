package com.tj.makers.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUploadController {
	private static final Logger logger = LoggerFactory.getLogger(ImageUploadController.class);
	
	@RequestMapping(value="imageUpload")
	public void imageUpload(HttpServletRequest request,HttpServletResponse response, MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String fileName=upload.getOriginalFilename();
		byte[] bytes = upload.getBytes();
		String uploadPath = "D:\\mega_IT\\source\\8_Spring\\Makers\\src\\main\\webapp\\mOrderImage\\";
		OutputStream out = new FileOutputStream(new File(uploadPath+fileName));
		out.write(bytes);
		String callback=request.getParameter("CKEditorFuncNum");
		PrintWriter printWriter = response.getWriter();
		String fileUrl = request.getContextPath()+"/mOrderImage/"+fileName;
		
		System.out.println(fileUrl);
		
		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("
						+callback+",'"
						+fileUrl+"','이미지가 업로드 되었습니다.')</script>");
		printWriter.flush();
	}
}
