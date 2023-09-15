package com.edu.sole.controller;


import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.member.controller.MemberController;
import com.edu.member.dto.MemberDTO;
import com.edu.sole.dto.RecipedSoleDTO;
import com.edu.sole.dto.SolePageMaker;
import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.base.BaseSoleDTO;
import com.edu.sole.dto.base.BaseSolePageMaker;
import com.edu.sole.dto.base.BaseSoleSearchCriteria;
import com.edu.sole.dto.LiveSoleDTO;
import com.edu.sole.dto.recipe.LikedDTO;
import com.edu.sole.dto.recipe.LikedSelectDTO;
import com.edu.sole.dto.recipe.RecipeDTO;
import com.edu.sole.service.SoleService;
import com.edu.sole.dto.recipe.RecipeReviewDTO;
import com.edu.sole.dto.recipe.ReviewCriteria;
import com.edu.sole.dto.recipe.ReviewPageMaker;
import com.edu.sole.dto.recipe.RecipeDTO;
import org.apache.commons.lang3.ObjectUtils;

@Controller
@RequestMapping("/sole")
public class SoleController {

	@Inject
	SoleService soleservice;
	
	private static final Logger logger = LoggerFactory.getLogger(SoleController.class);
	
	//------------------------------------------------------------------------------------------
	// 술 메인
			@RequestMapping(value="/Main", method=RequestMethod.GET)
			public String MainPage() {
				return "/sole/Main";
			}
			
			//------------------------------------------------------------------------------------------
			// 레시피 술 보여주는
			@RequestMapping(value="/sole" , method=RequestMethod.GET)
			public ModelAndView soleMain(HttpServletRequest request, HttpServletResponse response, SoleSearchCriteria solesearchcriteria) {
				
				ModelAndView mav = new ModelAndView();
				
				
				logger.info("solesearchcriteria " + solesearchcriteria.toString());
				SolePageMaker pgm = new SolePageMaker();
				//logger.info("alcohole_category: "+ alcohole_category);
				
				//category.setCategory_code(alcohole_category);
				
				pgm.setCri(solesearchcriteria);
				logger.info("2");
				pgm.setTotalCount(soleservice.solecount(solesearchcriteria));   // cri로 검색한 총 건수를 totalCount 변수에 저장한다.
				logger.info("3");
				List<LiveSoleDTO> soleMain = soleservice.soleMain(solesearchcriteria);
				logger.info("4");
				mav.addObject("sole", soleMain);
				logger.info("5");
				mav.addObject("pagemaker", pgm);	
				logger.info("6");
				mav.addObject("cri",solesearchcriteria);
				logger.info("7");
				
				System.out.println("pgm" + " "+ pgm);
				
				return mav;
				
			}/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//------------------------------------------------------------------------------------------------------
	// sole detail
	@RequestMapping(value="/soleDetail", method=RequestMethod.GET)
	public ModelAndView soleDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam("recipe_code") String recipe_code, @RequestParam(name="page", required = false, defaultValue = "1") int page) throws Exception{	
		
		ModelAndView mav = new ModelAndView();
		
		logger.info("recipe_code : " + recipe_code);
		
		List<RecipeDTO> recipeDetailDTO = soleservice.solerecipeDetail(recipe_code);   // 술 상세한 레시피 보여주는
		
		RecipedSoleDTO recipeDTO = new RecipedSoleDTO();
		
		recipeDTO = soleservice.solerecipe(recipe_code);        // 술 정보를 보여주는
		
		// 리뷰정보 끌어오는 부분
		ReviewPageMaker rpgm = new ReviewPageMaker();
		ReviewCriteria  reviewcri   = new ReviewCriteria();
		reviewcri.setRecipe_code(recipe_code);     // 레시피 코드를 설정한다.
		rpgm.setCri(reviewcri);
		
		
		reviewcri.setPage(page);
		rpgm.setTotalCount(soleservice.reviewcount(reviewcri));
		
		List<RecipeReviewDTO> selectReview = soleservice.selectReview(reviewcri);
		
		
		////////////////////////// 세션
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		if(member != null) {    // 로그인을 했을 때
			String m_id = member.getM_id();
			LikedSelectDTO Wla = new LikedSelectDTO();
			Wla.setM_id(m_id);
			Wla.setRecipe_code(recipe_code);
			LikedDTO jjimselect = soleservice.jjimSelect(Wla);
			
			if(Objects.isNull(jjimselect)) { // 로그인을 하고 찜을 안했을 때
				mav.addObject("rpgm", rpgm);
				mav.addObject("selectReview", selectReview);
				mav.addObject("recipeDetail", recipeDetailDTO);
				mav.addObject("recipe", recipeDTO);
			}else if((jjimselect.getLiked_id() != null) && (!jjimselect.getLiked_id().isEmpty())) {  // 로그인을 하고 찜을 했을때
				mav.addObject("jjimselect", jjimselect);
				mav.addObject("rpgm", rpgm);
				mav.addObject("selectReview", selectReview);
				mav.addObject("recipeDetail", recipeDetailDTO);
				mav.addObject("recipe", recipeDTO);
			}
			
		} else if(member == null) { // 로그인을 안했을 때
			mav.addObject("rpgm", rpgm);
			mav.addObject("selectReview", selectReview);
			mav.addObject("recipeDetail", recipeDetailDTO);
			mav.addObject("recipe", recipeDTO);
		} // end if
		
		return mav;
		
	}
	
	//---------------------------------------------------------------------------------------------------------------
	// sole detail / review
	@RequestMapping(value="/soleReview", method=RequestMethod.GET)
	public ModelAndView soleReview(HttpServletRequest request, HttpServletResponse response, @RequestParam("recipe_code") String recipe_code, @RequestParam("m_id") String m_id) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		logger.info("recipe_code :" + recipe_code);
		
		String category = soleservice.getCategory(recipe_code);
		
		mav.addObject("category", category);
		mav.addObject("recipe_code", recipe_code);
		mav.addObject("m_id", m_id);
		
		return mav;
		
	}
	
	//------------------------------------------------------------------------------------------------------------------
	// sole detail / reviewInsert
	@RequestMapping(value="/soleReviewInsert", method=RequestMethod.POST)
	public ModelAndView soleReviewInsert(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		
		logger.info("컨트롤러 입장");
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			
			System.out.println("name : " + name);
			System.out.println("value : " + value);
			
			articleMap.put(name, value);
		}
		
		String image = upload(multipartRequest);
		articleMap.put("image", image);
		soleservice.soleReviewInsert(articleMap);
		
		if(image != null && image.length() != 0) {
			File srcDir = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + image);
			File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleMap.get("review_id"));
			FileUtils.moveToDirectory(srcDir, destDir, true);     // moveToDirectory(이동할 파일 또는 디렉토리, 대상 디렉토리, true이면 대상 디렉토리를 만들고 그렇지 않으면 false이면 IOException을 발생시킵니다.)
		}
		
		mav.setViewName("redirect:/sole/soleDetail?recipe_code=" + articleMap.get("recipe_code") + "&page=1");
		
		return mav;
		
	}
	private static final String ARTICLE_IMAGE_REPO = "C:\\data\\board\\review_image";
	////////////////////////////////////////////////////////////////////////////////////////////
	// review image 등록
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		String image = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			
			MultipartFile mFile = multipartRequest.getFile(fileName);
			
			image = mFile.getOriginalFilename();
			
			File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + image);
			if(mFile.getSize() != 0) {
				if(!file.exists()) {   // 파일을 올릴 경로에 파일이 존재하지 않는다면
					file.getParentFile().mkdirs();  // 경로에 해당하는 디렉토리를 생성한다.
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + image)); 
				}
			}
		}
		
		return image;
	} 
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	// ajax
	@RequestMapping(value="/soleDetailAjax", method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map soleDetailAjax(@RequestParam("recipe_code") String recipe_code, @RequestParam("page") int page) throws Exception{
		
		logger.info("recipe_codeddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd : " + recipe_code);
		
		Map ajaxMap = new HashMap();
		
		ReviewPageMaker rpgm = new ReviewPageMaker();
		ReviewCriteria  reviewcri   = new ReviewCriteria();
		reviewcri.setRecipe_code(recipe_code);     // 레시피 코드를 설정한다.
		
		reviewcri.setPage(page);
		
		rpgm.setCri(reviewcri);
		rpgm.setTotalCount(soleservice.reviewcount(reviewcri));
		
		List<RecipeReviewDTO> selectReview = soleservice.selectReview(reviewcri);
		
		ajaxMap.put("reviewList", selectReview);
		ajaxMap.put("rpgm", rpgm);
		
		return ajaxMap;
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// jjimInsert ajax
	@RequestMapping(value="/jjimInsert", method=RequestMethod.GET)
	@ResponseBody
	public void jjimInsert(@RequestParam("recipe_code") String recipe_code, @RequestParam("m_id") String m_id) throws Exception {
		
		logger.info("code : " + recipe_code);
		logger.info("id : " + m_id);
		
		LikedDTO jjimInsert = new LikedDTO();
		jjimInsert.setM_id(m_id);
		jjimInsert.setRecipe_code(recipe_code);
		
		soleservice.jjimInsert(jjimInsert);
	}
	//jjimDelete ajax
	@ResponseBody
	@RequestMapping(value="/jjimDelete", method=RequestMethod.GET)
	public void jjimDelete(@RequestParam("recipe_code") String recipe_code, @RequestParam("m_id") String m_id) throws Exception {
		LikedDTO jjimDelete = new LikedDTO();
		jjimDelete.setM_id(m_id);
		jjimDelete.setRecipe_code(recipe_code);
		
		soleservice.jjimDelete(jjimDelete);
	}
	

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// base sole
	@RequestMapping(value="baseSole", method=RequestMethod.GET)
	public ModelAndView baseSole(HttpServletRequest request, HttpServletResponse response, BaseSoleSearchCriteria cri) {
		
		ModelAndView mav = new ModelAndView();
		
		BaseSolePageMaker bpgm = new BaseSolePageMaker();
		
		bpgm.setCri(cri);
		bpgm.setTotalCount(soleservice.basecount(cri));
		List<BaseSoleDTO> basesole = soleservice.selectbase(cri);
		
		mav.addObject("basesole", basesole);
		mav.addObject("pagemaker", bpgm);
		mav.addObject("cri", cri);
		
		return mav;
	}

} // end class

