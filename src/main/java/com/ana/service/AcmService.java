package com.ana.service;

import java.util.List;

import com.ana.domain.AcmVO;
import com.ana.domain.Criteria;

public interface AcmService {
	
	public void register(AcmVO acm);
	
	public AcmVO get(String AcmNum);
	
	public boolean modify(AcmVO acm);
	
	public boolean remove(String AcmNum);
	
	//public List<AcmVO> getList();
	
	public List<AcmVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

}
