package com.ana.service;

import java.util.List;

import com.ana.domain.AcmOptionVO;

public interface AcmOptionService {

	public int register(AcmOptionVO option);

	public AcmOptionVO get(String acmNum);

	public boolean modify(AcmOptionVO acm);

	public boolean remove(String acmNum, String acmOptcode);

	public List<AcmOptionVO> getList(String acmNum);

}