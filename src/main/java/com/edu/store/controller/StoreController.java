package com.edu.store.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.store.dto.ProductDisplayVO;
import com.edu.store.dto.ProductDTO;
import com.edu.store.service.StoreService;




/**
 * Handles requests for the application home page.
 */
@Controller
public class StoreController {

	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	
	
	@Autowired
	private StoreService storeService;
	//--------------------------------------------------------------------------------------------
	// 상품 리스트
	//--------------------------------------------------------------------------------------------
	@RequestMapping(value = "/store/productInfo", method = { RequestMethod.GET, RequestMethod.POST })
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
			@RequestParam("display_product_id") String product_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<ProductDisplayVO> product = storeService.productInfos(product_id);
		
		System.out.println(product_id + "됐음");
		String viewName = "/store/productInfos";
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("product", product);
		
		return mav;
	}
}
