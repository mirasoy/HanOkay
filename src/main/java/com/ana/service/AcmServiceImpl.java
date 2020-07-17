package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.AcmVO;
import com.ana.domain.Criteria;
import com.ana.mapper.AcmMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AcmServiceImpl implements AcmService{
	
	private AcmMapper mapper;
	
	@Override
	public void register(AcmVO acm) {
		log.info("register......" + acm);
		
		mapper.insertSelectKey(acm);
	}

	// 숙소 상세페이지: 숙소 정보와 사진을 불러온다
	// 예약 확인 페이지: 객실정보 확인을 위해 숙소 정보를 불러온다
	@Override
	public AcmVO get(String acmNum) {
		log.info("get......"+acmNum);
		return mapper.read(acmNum);
	}

	@Override
	public boolean modify(AcmVO acm) {
		log.info("modify......" + acm);
		return mapper.update(acm)==1;
	}

	@Override
	public boolean remove(String acmNum) {
		log.info("remove......" + acmNum);
		return mapper.delete(acmNum)==1;
	}

//	@Override
//	public List<AcmVO> getList() {
//		log.info("getList...........");
//		return mapper.getList();
//	}

	@Override
	public List<AcmVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		List<String> romNumList = mapper.getRomNum(cri.getIn(),cri.getOut());
		List<String> acmNumList = mapper.getAcmNum(cri.getPerson(),romNumList);
		return mapper.getListPaging(cri, acmNumList);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		List<String> romNumList = mapper.getRomNum(cri.getIn(),cri.getOut());
		List<String> acmNumList = mapper.getAcmNum(cri.getPerson(),romNumList);
		return mapper.getTotalCount(cri, acmNumList);
	}

}
