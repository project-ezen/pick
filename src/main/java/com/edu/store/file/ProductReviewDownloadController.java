package com.edu.store.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.store.controller.StoreController;

//-----------------------------------------------------------------------------------------------------------
// 이미지 파일 다운로드
//-----------------------------------------------------------------------------------------------------------
@Controller
public class ProductReviewDownloadController {

	//-----------------------------------------------------------------------------------------------------------
	// 업로드된 폴더와 위치가 같아야 한다.
	//-----------------------------------------------------------------------------------------------------------
	private static final String REVIEW_IMAGE_REPO = "C:\\data\\team\\pick\\src\\main\\webapp\\resources\\product_review_images";
	private static final Logger logger = LoggerFactory.getLogger(ProductReviewDownloadController.class);
	//-----------------------------------------------------------------------------------------------------------
	// 이미지 파일 다운로드
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping("/reviewDownload.do")
	protected void download(@RequestParam("imageFileName")	String imageFileName,
						    @RequestParam(value="reviewId") String reviewId,
							HttpServletResponse response)	throws Exception {
		logger.info("---------------------------------------------------------------------------------------------" + reviewId);
		String downFile	 = REVIEW_IMAGE_REPO + "\\" + reviewId +"\\" + imageFileName;
		
		logger.info("---------------------------------------------------------------------------------------" + downFile);
		
		
		OutputStream out = response.getOutputStream();
		File file = new File(downFile);
		
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachement; fileName=" + imageFileName);
	
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
		
	} // End - 이미지 파일 다운로드

} // End - public class FileDownloadController






