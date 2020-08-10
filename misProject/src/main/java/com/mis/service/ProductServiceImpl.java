package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.mis.domain.ProductVO;
import com.mis.domain.SearchCriteria;
import com.mis.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Inject
	private ProductDAO dao;

	@Override
	public void register(ProductVO vo) throws Exception {
		dao.create(vo);
		
	}

	@Override
	public ProductVO read(int pno) throws Exception {
		dao.updateViewCnt(pno);
		return dao.read(pno);
	}

	@Override
	public void modify(ProductVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public void remove(int pno) throws Exception {
		dao.delete(pno);
		
	}


	@Override
	public List<ProductVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}



}
