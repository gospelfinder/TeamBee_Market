package com.teambee.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teambee.dao.ProductDAO;
import com.teambee.dto.OrderVO;
import com.teambee.dto.ProductVO;
import com.teambee.utils.SearchCriteria;
@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO dao;

	@Override
	public List<ProductVO> showProduct() throws Exception {
		return dao.showProduct();
	}
	
	@Override
	public List<ProductVO> showProductByPage(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.showProductByPage(scri);
	}

	@Override
	public List<ProductVO> showProductByDate() throws Exception {
		return dao.showProductByDate();
	}
	
	@Override
	public List<ProductVO> showProductByType(String PRODUCT_TYPE) throws Exception {
		return dao.showProductByType(PRODUCT_TYPE);
	}
	
	@Override
	public ProductVO detail(int PRODUCT_BNO) throws Exception {
		return dao.detail(PRODUCT_BNO);
	}

	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		dao.insertProduct(vo);
	}

	@Override
	public void increaseHit(int PRODUCT_BNO) throws Exception {
		dao.increaseHit(PRODUCT_BNO);
	}

	@Override
	public void decreaseAmount(OrderVO vo) throws Exception {	
		dao.decreaseAmount(vo);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	

	

	


}
