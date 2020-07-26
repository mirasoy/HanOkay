package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.CodeVO;
import com.ana.mapper.CodeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CodeServiceImpl implements CodeService{
	
	private CodeMapper mapper;

	@Override
	public List<CodeVO> getAcmCode() {
		log.info("■■■■■■■■■■■■▶ getAcmCode: ");
		return mapper.getAcmCode();
	}

	@Override
	public List<CodeVO> getRomCode() {
		log.info("■■■■■■■■■■■■▶ getRomCode: ");
		return mapper.getRomCode();
	}

}
