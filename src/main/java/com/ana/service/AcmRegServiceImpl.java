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
		System.out.println("서비스단 acmNum:"+acmNum);
		
		AcmOptionVO vo = new AcmOptionVO();
		vo.setAcmNum(acmNum);
		for(int i=0;i<acmOptcode.size();i++) {
			System.out.println(acmOptcode.get(i));
			vo.setAcmOptcode(acmOptcode.get(i));
			omapper.insert(vo); //순차적으로 옵션디비에 저장
		}
		
		System.out.println("한옥acmNum:"+acmNum);
		System.out.println("한옥에 대한 설명:"+acmDesc);
		System.out.println(acmNum);
		acmNum=acmNum.trim();
		System.out.println("트림한 acmNum:"+acmNum);
//		AcmVO acm = new AcmVO();
//		acm.setAcmNum(acmNum);
//		acm.setAcmDesc(acmDesc);
//		System.out.println("acm리스트"+acm.toString());
		
		//int rs=amapper.updateDesc(acm);//작동안함1200
		int rs=amapper.updateDesc(acmNum, acmDesc);
		
		
		
		System.out.println("결과:"+rs);
		
		return rs==1;
	}


	
	
	
	

	

}
