package com.itwillbs.controller;
import java.util.List;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.itwillbs.domain.MaterialVO;
import com.itwillbs.service.MaterialService;



@Controller
@RequestMapping(value = "/purchasing/material/*")
public class MaterialController {

	// http://localhost:8088/purchasing/material/list

	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(MaterialController.class);

	// 객체 주입 (DI)
	@Inject
	private MaterialService mService;

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// 1. 자재 목록 보기 & 자동넘버링
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void materialListGET(Model model) throws Exception {
		logger.debug("@@@@@@@@@@ materialListGET_호출");

		// serivce 객체 호출
		List<MaterialVO> materialList = mService.getMaterialList();
		
		// 자동넘버링
		String maxNumber = mService.getMaxNumber();
		logger.debug("@@@@@@@@@@@@@@ maxNumber = " + maxNumber);	

		// View 페이지 정보 전달
		model.addAttribute("materialList", materialList);
		model.addAttribute("maxNumber", maxNumber);
	}
	
	
	// 2. 자재 등록 - 행추가 & 데이터처리
	@RequestMapping(value="/maid", method=RequestMethod.GET)
	public String getMaIdGET(MaterialVO vo) throws Exception {
		logger.debug("@@@@@@@@@@ getMaIdGET() 호출");
		
		// 파라미터정보 자동 저장
		mService.insertMaterial(vo);
		logger.debug("@@@@@@@@@@@@@@ vo = " + vo);	
		
		// 페이지 이동
		return "redirect:/purchasing/material/list";
	}

	
	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 체크박스 선택해서 수정누르면 해당 행이 활성화 되어 수정 또는 삭제할 수 있게끔
//////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 3-1. 자재 수정 (조회)
	// 기존의 정보 출력 & 수정 정보 입력
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyMaterialGET(String ma_id, Model model) throws Exception {
		logger.debug("@@@@@@@@@@ modifyMaterialGET_호출");

		// 기존의 정보 출력
		MaterialVO resultVO = mService.getMaterialInfo(ma_id);
		logger.debug("@@@@@@@@@@ 기존 데이터 : " + resultVO);

		// Model 객체를 사용하여 데이터 저장
		// -> View페이지 (modify.jsp) 전달하기 위해
		model.addAttribute("resultVO", resultVO);
	}

	// 3-2. 자재 수정 (데이터처리)
	// 수정된 정보 DB에 저장 후 list.jsp 페이지 이동
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyMaterialPOST(MaterialVO mvo) throws Exception {
		logger.debug("@@@@@@@@@@ modifyMaterialPOST_호출");

		// 한글처리 (필터사용)

		// 전달된 정보 저장
		// -> 수정된 데이터 파라미터 자동 수집 기능
		logger.debug("@@@@@@@@@@ 수정된 데이터 : " + mvo);

		// 서비스 객체 사용으로 데이터 처리
		Integer result = mService.modifyMaterial(mvo);
		logger.debug("$$$$$$$$$$ 업데이트 된 행의 수  : " + result);

		// 페이지 이동
		return "redirect:/purchasing/material/list";
	}

	// 4-1. 자재 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteMaterialGET(String ma_id) throws Exception {
		logger.debug("@@@@@@@@@@ deleteMaterialGET_호출");
		logger.debug("@@@@@@@@@@ delete.jsp 페이지 이동");
	}

	// 4-2. 자재 삭제 (데이터처리)
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteMaterialPOST(String ma_id) throws Exception {
		logger.debug("@@@@@@@@@@ deleteMaterialPOST_호출");

		// 품목코드 데이터 저장
		MaterialVO dvo = new MaterialVO();
		dvo.setMa_id(ma_id);

		// 삭제하고자하는 품목코드에 해당하는 데이터 삭제
		int result = mService.deleteMaterial(dvo);
		logger.debug("$$$$$$$$$$ 삭제 된 행의 수 : " + result);

		// 페이지 이동
		return "redirect:/purchasing/material/list";
	}

}
