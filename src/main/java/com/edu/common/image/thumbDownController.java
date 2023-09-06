package com.edu.common.image;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//이미지 파일 다운로드
@Controller
public class thumbDownController {
	// 업로드된 폴더와 위치가 같아야 한다.
	private static final String ARTICLE_IMAGE_REPO = "C:\\data\\team\\pick\\src\\main\\webapp\\resources\\images";
	
	// 이미지 파일 다운로드
	@RequestMapping(value="/thumbdown")
	protected void download(@RequestParam("thumbnail") String imgfn,
							HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO + "\\" + "thumb" + "\\" + "t_" + imgfn;
		File file = new File(downFile);
		
		response.setHeader("Cache-control", "no-cache");
		response.addHeader("Content-disposion", "attachement; fileName=" + imgfn);
			
		FileInputStream in = new FileInputStream(file);
		byte buffer[] = new byte[1024 * 8];
		
		while(true) {
			int count = in.read(buffer);
			if(count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
