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
public class SoleImageDownController {

	//---------------------------------------------------------------------------------
	// 업로드된 폴더와 위치가 같아야 한다.
	//---------------------------------------------------------------------------------
	private static final String ARTICLE_IMAGE_REPO = "C:\\data\\team\\pick\\src\\main\\webapp\\resources\\recipe_images";
	
	//---------------------------------------------------------------------------------
	// 이미지 파일 다운로드
	//---------------------------------------------------------------------------------
	@RequestMapping("/download")
	protected void download(@RequestParam("recipe_image") String recipe_image, HttpServletResponse response) throws Exception {
		
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO  + "\\" + recipe_image;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachement; fileName=" + recipe_image);
		
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
