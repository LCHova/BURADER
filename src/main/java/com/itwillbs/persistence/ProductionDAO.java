package com.itwillbs.persistence;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.domain.ProductionVO;


@Repository

public interface ProductionDAO {
	
	// 생산목록
		public List<ProductionVO> getProductionList() throws Exception;
		
	// 작업지시 등록
	public void insertProducion(ProductionVO vo) throws Exception;
		
	// 작업지시 등록-수주번호 조회
	public ProductionVO getInsertSearch(String production_id) throws Exception;
	
}
