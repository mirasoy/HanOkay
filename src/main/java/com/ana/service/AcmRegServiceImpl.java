package com.ana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ana.domain.AcmOptionVO;
import com.ana.domain.AcmVO;
import com.ana.domain.RomOptVO;
import com.ana.domain.RomVO;
import com.ana.mapper.AcmOptionMapper;
import com.ana.mapper.AcmRegMapper;
import com.ana.mapper.RomOptMapper;
import com.ana.mapper.RomRegMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AcmRegServiceImpl implements AcmRegService{
	@Setter(onMethod_= {@Autowired})
	private AcmRegMapper amapper;
	@Setter(onMethod_= {@Autowired})
	private AcmOptionMapper omapper;
	
	

	@Transactional
	@Override
	public int register(AcmVO acm) {
		
		amapper.insertSelectKey(acm);//acmNum 반환값으로 안가지고나와도 완성되어있다!
		
//		AcmOptionVO vo = new AcmOptionVO();//타입을 지정하는가?
	
		
		return 1;//우선은 무조껀 성공이라 하자 070903
	}


	@Transactional
	@Override
	public boolean update(String acmNum, List<String> acmOptcode,String acmDesc) {
		
		for(int i=0;i<acmOptcode.size();i++) {
			omapper.updateNew(acmNum,acmOptcode.get(i)); //순차적으로 옵션디비에 저장
		}
		
		return amapper.updateDesc(acmNum,acmDesc)*acmOptcode.size()==acmOptcode.size();
	}


	
	
	
	

	

}
