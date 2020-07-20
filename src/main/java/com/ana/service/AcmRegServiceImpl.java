package com.ana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ana.domain.AcmVO;
import com.ana.domain.RomVO;
import com.ana.mapper.AcmRegMapper;
import com.ana.mapper.RomRegMapper;
import com.ana.mapper.UserMapper;

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
	private UserMapper umapper;
	
	

	@Override
	public void register(AcmVO vo) {
//		vo.setAcmActi("PENDING");
//		vo.setAcmStatus("PENDING");
		vo.setAcmPurl("C:\\upload\\acm\\");
		vo.setAcmPname("amc_p_1.jpg");
		vo.setAcmDesc("-");
//		vo.setAcmOptcode(0);
		System.out.println("서비스단의 "+vo.toString());
		
		amapper.insertSelectKey(vo);//acmNum 반환값으로 안가지고나와도 완성되어있다!
		
	}


	@Transactional
	@Override
	public boolean update1_6(String acmNum, List<String> acmOptcode,String acmDesc) {
		System.out.println("서비스단 acmNum:"+acmNum);
		
		AcmVO vo = new AcmVO();
		vo.setAcmNum(acmNum.trim());
		int sumOpt=0;
		for(int i=0;i<acmOptcode.size();i++) {
			System.out.println(acmOptcode.get(i));
			sumOpt+=Integer.parseInt(acmOptcode.get(i));
		}
		
		System.out.println("다 더한 값:"+sumOpt);
		vo.setAcmOptcode(sumOpt);
		vo.setAcmDesc(acmDesc);
		
		return amapper.update1_6(vo)==1;
	}


	@Override
	public boolean chkaddr(String acmDetailaddr) {
		
		return amapper.chkaddr(acmDetailaddr)==0;
	}


	
	
	
	

	

}
