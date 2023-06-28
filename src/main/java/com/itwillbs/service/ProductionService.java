package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ProductionVO;

public interface ProductionService {

	// 생산목록
		public List<ProductionVO> getProductionList() throws Exception;
		
	// 생산등록
	public void insertProducion(ProductionVO vo) throws Exception;
	
	// 생산등록 (작업지시번호 조회)
	public ProductionVO getInsertSearch(String production_id) throws Exception;
	
}

