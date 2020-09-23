package com.teambee.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teambee.dto.OrderVO;
import com.teambee.dto.ProductVO;
import com.teambee.utils.SearchCriteria;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession session;

	@Override
	public List<ProductVO> showProduct() throws Exception {
		return session.selectList("productMapper.showProduct");
	}
	
	@Override
	public List<ProductVO> showProductByPage(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("productMapper.showProductByPage",scri);
	}

	@Override
	public List<ProductVO> showProductByDate() throws Exception {
		return session.selectList("productMapper.showProductByDate");
	}
	
	@Override
	public List<ProductVO> showProductByType(String PRODUCT_TYPE) throws Exception {
		return session.selectList("productMapper.showProductByType", PRODUCT_TYPE);
	}

	@Override
	public ProductVO detail(int PRODUCT_BNO) throws Exception {
		return session.selectOne("productMapper.showProductDetail", PRODUCT_BNO);
	}

	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		session.insert("productMapper.insertProduct", vo);

	}

	@Override
	public void increaseHit(int PRODUCT_BNO) throws Exception {
		session.update("productMapper.increaseHit", PRODUCT_BNO);

	}

	@Override
	public void decreaseAmount(OrderVO vo) throws Exception {
		session.update("productMapper.decreaseAmount", vo);

	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return session.selectOne("productMapper.listCount",scri);
	}

	

	

}