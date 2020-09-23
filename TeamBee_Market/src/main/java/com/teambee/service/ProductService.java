package com.teambee.service;

import java.util.List;

import com.teambee.dto.OrderVO;
import com.teambee.dto.ProductVO;
import com.teambee.utils.SearchCriteria;

public interface ProductService {

	// 상품 전체 보여주기(조회순)
	public List<ProductVO> showProduct() throws Exception;

	// 상품 전체 보여주기(페이징처리)
	public List<ProductVO> showProductByPage(SearchCriteria scri) throws Exception;

	// 상품 전체 보여주기(등록순)
	public List<ProductVO> showProductByDate() throws Exception;

	// 상품 전체 보여주기(종류순)
	public List<ProductVO> showProductByType(String PRODUCT_TYPE) throws Exception;

	// 상품 상세 페이지
	public ProductVO detail(int PRODUCT_BNO) throws Exception;

	// 상품 업로드
	public void insertProduct(ProductVO vo) throws Exception;

	// 조회시 조회수 증가
	public void increaseHit(int PRODUCT_BNO) throws Exception;

	// 구매시 수량 감소
	public void decreaseAmount(OrderVO vo) throws Exception;

	// 게시물 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
}
