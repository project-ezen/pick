package com.edu.sole.fileDown;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//--------------------------------------------------------------------------------------------
// 이미지 파일 다운로드
//--------------------------------------------------------------------------------------------
@Controller
public class ReviewDownloadController {

	//---------------------------------------------------------------------------------
	// 업로드된 폴더와 위치가 같아야 한다.
	//---------------------------------------------------------------------------------
	private static final String ARTICLE_IMAGE_REPO = "C:\\data\\board\\review_image";
	
	//---------------------------------------------------------------------------------
	// 이미지 파일 다운로드
	//---------------------------------------------------------------------------------
	@RequestMapping("/ReviewDownload")
	protected void download(@RequestParam("review_image") String review_image,@RequestParam("review_id") String review_id, HttpServletResponse response) throws Exception {
		
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO  + "\\" + review_id+ "\\" + review_image;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachement; fileName=" + review_image);
		
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
		
	}
	
}// end class
