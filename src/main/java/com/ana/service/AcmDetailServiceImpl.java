package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ana.domain.AcmDetailPicVO;
import com.ana.domain.AcmDetailRevVO;
import com.ana.domain.AcmDetailRomVO;
import com.ana.domain.AcmDetailVO;
import com.ana.mapper.AcmDetailMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AcmDetailServiceImpl implements AcmDetailService{
	
	private AcmDetailMapper mapper;
	
	@Override
	public AcmDetailVO getAcm(String acmNum) {
		log.info("■■■■■■■■■■■■▶ getAcm: "+ acmNum);
		return mapper.getAcm(acmNum);
	}

	@Override
	public List<AcmDetailPicVO> getPicList(String acmNum) {
		log.info("■■■■■■■■■■■■▶ getPicList: "+ acmNum);
		return mapper.getPicList(acmNum);
	}

	@Override
	public List<AcmDetailRomVO> getRomAll(String acmNum) {
		log.info("■■■■■■■■■■■■▶ getRomAll: "+ acmNum);
		return mapper.getRomAll(acmNum);
	}
	
	@Override
	public List<AcmDetailRomVO> getRomList(String acmNum, String person) {
		log.info("■■■■■■■■■■■■▶ getRomList: "+ acmNum + "/" + person);
		return mapper.getRomList(acmNum, person);
	}

	@Override
	public List<AcmDetailRevVO> getRevList(String acmNum) {
		log.info("■■■■■■■■■■■■▶ getRevList: "+ acmNum);
		return mapper.getRevList(acmNum);
	}

	@Override
	public double getStisf(String acmNum) {
		log.info("■■■■■■■■■■■■▶ getStisf: "+ acmNum);
		return mapper.getStisf(acmNum);
	}

}
