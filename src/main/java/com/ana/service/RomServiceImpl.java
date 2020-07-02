package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.RomVO;
import com.ana.mapper.RomMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RomServiceImpl implements RomService{
	
	private RomMapper mapper;

	@Override
	public List<RomVO> getList(String acmNum) {
		log.info("getList...........");
		return mapper.getList(acmNum);
	}
	
	@Override
	public int register(RomVO rom) {
		log.info("register......" + rom);
		return mapper.insert(rom);
	}

	@Override
	public RomVO get(String romNum) {
		log.info("get......"+romNum);
		return mapper.read(romNum);
	}

	@Override
	public boolean modify(RomVO rom) {
		log.info("modify......" + rom);
		return mapper.update(rom)==1;
	}

	@Override
	public boolean remove(String romNum) {
		log.info("remove......" + romNum);
		return mapper.delete(romNum)==1;
	}

}
