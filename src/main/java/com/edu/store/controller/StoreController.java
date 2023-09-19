package com.edu.store.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.store.dto.ProductDisplayVO;
import com.edu.store.dto.ProductReviewCriteria;
import com.edu.store.dto.ProductReviewPageMaker;
import com.edu.store.dto.ReviewDTO;
import com.edu.member.dto.MemberDTO;
import com.edu.store.dto.ProductDTO;
import com.edu.store.service.StoreService;






/**
 * Handles requests for the application home page.
 */
@Controller
public class StoreController {

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	private static final String REVIEW_IMAGE_REPO = "C:\\data\\team\\pick\\src\\main\\webapp\\resources\\product_review_images";
	
	@Autowired
	private StoreService storeService;
	//--------------------------------------------------------------------------------------------
	// 상품 리스트
	//--------------------------------------------------------------------------------------------
	@RequestMapping(value = "/store/productInfo", method =RequestMethod.GET)
	public ModelAndView listProduct(
	        @RequestParam(value = "category", required = false) String category,
	        @RequestParam(value = "searchKeyword", required = false) String searchKeyword, 
	        @RequestParam(value = "page", defaultValue = "1") int page, // 현재 페이지 정보
	        @RequestParam(value = "select", required = false) String select,
	        HttpServletRequest request, HttpServletResponse response) throws Exception {

		    String viewName = "/store/productInfo";
		    List productList;
		    int itemsPerPage = 20; // 페이지당 아이템 수
	
		    if (searchKeyword != null && !searchKeyword.isEmpty()) {
		        // searchKeyword를 사용하여 검색 작업 수행
		        if (category != null && !category.isEmpty()) {
		            // category와 searchKeyword 둘 다 존재하는 경우
		            productList = storeService.searchProductByCategoryAndKeyword(category, searchKeyword, select);
		        } else {
		            productList = storeService.searchProductByKeyword(searchKeyword, select);
		        }
		    } else {
		        productList = storeService.listProduct(category, select);
		    }

	    // 페이징 관련 처리
	    int totalItems = productList.size();
	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
	    int startIndex = (page - 1) * itemsPerPage;
	    int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
	    
	    // 현재 페이지에 해당하는 아이템들만 추출
	    List<ProductDisplayVO> pagedProductList = productList.subList(startIndex, endIndex);

	    int maxPageLinks = 5; // 원하는 페이지 링크 수로 변경하세요
	    ModelAndView mav = new ModelAndView(viewName);
	    mav.addObject("productList", pagedProductList);
	    mav.addObject("currentPage", page);
	    mav.addObject("totalPages", totalPages);
	    mav.addObject("totalItems", totalItems);
	    mav.addObject("maxPageLinks", maxPageLinks); // maxPageLinks 추가

	    return mav;
	}

	//--------------------------------------------------------------------------------------------
	// 상품 상세 보기
	//--------------------------------------------------------------------------------------------
	@RequestMapping(value="/store/productInfos", method=RequestMethod.GET)
	public ModelAndView productInfos(
			@RequestParam("product_display_id") String product_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<ProductDisplayVO> productInfo = storeService.displayProductInfos(product_id);
		List<ProductDTO> product = storeService.productInfos(product_id);
		
		String viewName = "/store/productInfos";
		
		
		ProductReviewPageMaker prpgm = new ProductReviewPageMaker();
		ProductReviewCriteria  productreviewcri   = new ProductReviewCriteria();
		productreviewcri.setProduct_display_id(product_id);     // 레시피 코드를 설정한다.
		prpgm.setCri(productreviewcri);
		
		prpgm.setTotalCount(storeService.productReviewCount(productreviewcri));	
		List<ReviewDTO> selectReview = storeService.selectReview(productreviewcri);
		
		
		ModelAndView mav = new ModelAndView(viewName);
		logger.info(" " + product);
		logger.info(" " + productInfo);
		
		mav.addObject("prpgm", prpgm);
		mav.addObject("selectReview", selectReview);
		mav.addObject("product", product);
		mav.addObject("productInfo", productInfo);
		
		return mav;
	}
	
	//--------------------------------------------------------------------------------------------
	// 상품 장바구니 담기
	//--------------------------------------------------------------------------------------------
	@RequestMapping(value="/store/addToCart", method=RequestMethod.GET)
	public String productToCart(@RequestParam("product_display_id") String product_id,
								@RequestParam("quantity") String quantity,
								@RequestParam("cartOrStore") String cartOrStore,
								@RequestParam(value="image", required = false) String image,
								@RequestParam(value="name", required = false) String name,
								@RequestParam(value="total", required = false) Integer total,
								@RequestParam(value="price", required = false) Integer price,
		HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		String memberId = (String)memberDTO.getM_id(); 
		int cai = getCartId();
	
		String cartId = Integer.toString(cai);
		
		logger.info("-----------------------------------------------------------------------------------" + product_id);
		
		storeService.productToCart(product_id, quantity, memberId, cartOrStore, cartId);
		
		String locate = "";
		int totalValue = 0; 
		int priceValue = 0;
		 
		if (total != null) {
			totalValue = total;
		} else {
			logger.info("total이 널임");
		}		
		
		if (price != null) {
		    priceValue = price;		   
		} else {
			logger.info("price가 널임");
		}
		
		 if ("cart".equals(cartOrStore)) {
		        return "redirect:/shopping/cart";
		    }else if("buyNow".equals(cartOrStore)) {	    	
		    	String encodedName = URLEncoder.encode(name, "UTF-8");
		    	locate   
		    	= "redirect:/shopping/order?cartId=" + cartId + "&imageFile=" + image + "&productName=" + encodedName + "&productPrice=" 
		    	+ priceValue + "&cnt=" + quantity + "&totalPrice=" + totalValue;

		    	return locate;
		    }
		    return "redirect:/store/productInfo";
	}
	
	//--------------------------------------------------------------------------------------------
	// 리뷰 쓰기
	//--------------------------------------------------------------------------------------------
	@RequestMapping(value="/store/reviewWrite", method=RequestMethod.POST)
	public String addNewArticle(
			@RequestParam("product_display_id") String product_id,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
	
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");

		
		String member = (String)memberDTO.getM_id(); 
		
		logger.info("333333333333333333333333333333333333333333333333333333333333333333333333333333333333" + member);
		
		multipartRequest.setCharacterEncoding("UTF-8");
		
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		

		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String	name	= (String)enu.nextElement();
			String	value	= multipartRequest.getParameter(name);

			System.out.println("name : "  + name);
			System.out.println("value : " + value);
			reviewMap.put(name, value);
		}
		
		String imageFileName = upload(multipartRequest);

		reviewMap.put("image", imageFileName);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html;charset=UTF-8");
		
		System.out.println("-----------------------------------------------------------------------------------------------------------------------------------" + imageFileName);
		
		try {
			int reivewNO = storeService.addNewReview(reviewMap, product_id, member); //서비스 넣어야함
			if(imageFileName != null && imageFileName.length() != 0) {
				File srcDir  = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(REVIEW_IMAGE_REPO + "\\" + reivewNO);
				FileUtils.moveToDirectory(srcDir, destDir, true);
			}
		} catch (Exception e) {
			File srcFile = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			e.printStackTrace();
		}
		String sad = "redirect:/store/productInfos?product_display_id=" + product_id;
		return sad;
		
	} // End - 게시글 쓰기 처리
	
	
	//----------------------------------------------------------------------------------------------------------------------------------
	// 사진 올리기
	//----------------------------------------------------------------------------------------------------------------------------------
		private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
				
				String imageFileName = null;
				Iterator<String> fileNames = multipartRequest.getFileNames();
				
				while(fileNames.hasNext()) {
					String fileName = fileNames.next();
					MultipartFile mFile	= multipartRequest.getFile(fileName);
					imageFileName = mFile.getOriginalFilename();
					
					System.out.println("------------------------------------------------------------");
					System.out.println("fileName ==> " + fileName);
					System.out.println("imageFileName ==> " + imageFileName);
		
					// File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
					File file = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					if(mFile.getSize() != 0) {
						if(!file.exists()) { // 파일을 올릴 경로에 파일이 존재하지 않는다면
							file.getParentFile().mkdirs();	// 경로에 해당하는 디렉토리를 생성한다.
							mFile.transferTo(new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));
						}
					}
				}
				
				return imageFileName;
				
			} // End - private String upload(MultipartHttpServletRequest multiparRequest) throws Exception
		
	//----------------------------------------------------------------------------------------------------------------------------------
	// 리뷰 삭제하기
	//----------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping("/store/reviewRemove")
	public String reviewRemove(
			@RequestParam("product_display_id") String product_id,
			@RequestParam("reviewId") String reviewId,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		storeService.reviewRemove(reviewId);

		
		String sad = "redirect:/store/productInfos?product_display_id=" + product_id;
		return sad; 
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------
	// 리뷰 Ajax
	//----------------------------------------------------------------------------------------------------------------------------------	
	@ResponseBody
	@RequestMapping(value="/store/reviewDetailAjax", method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public Map reviewDetailAjax(@RequestParam("product_display_id") String product_id, 
								@RequestParam("page") int page) throws Exception {

		Map productAjaxMap = new HashMap();
		
		ProductReviewPageMaker prpgm = new ProductReviewPageMaker();
		ProductReviewCriteria productreviewcri	=	new ProductReviewCriteria();
		productreviewcri.setProduct_display_id(product_id);
		
		productreviewcri.setPage(page);
		
		prpgm.setCri(productreviewcri);
		prpgm.setTotalCount(storeService.productReviewCount(productreviewcri));
		
		List<ReviewDTO> selectReview = storeService.selectReview(productreviewcri);
		
		productAjaxMap.put("ProductReviewList", selectReview);
		productAjaxMap.put("prpgm", prpgm);
		
		return productAjaxMap;
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------
	// 랜덤 노중복
	//----------------------------------------------------------------------------------------------------------------------------------		
	public int getCartId() throws Exception {
		int random_id = (int)(Math.random() * 100000);
		List<String> check_cart_id = storeService.checkCartId();
		for(int i = 0; i < check_cart_id.size(); i++) {
			if(random_id == Integer.parseInt(check_cart_id.get(i))) {
				break;
			}
			else {
				random_id = (int)(Math.random() * 100000);
				break;
			}
		}
		return random_id;
	}
	
	
}

