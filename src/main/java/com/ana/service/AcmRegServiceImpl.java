package com.ana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ana.domain.AcmVO;
import com.ana.domain.PicVO;
import com.ana.domain.RomVO;
import com.ana.domain.UserHisVO;
import com.ana.domain.UserVO;
import com.ana.mapper.AcmRegMapper;
import com.ana.mapper.RomRegMapper;
import com.ana.mapper.UserHisMapper;
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
	@Setter(onMethod_= {@Autowired})
	private UserHisMapper hmapper;
	@Setter(onMethod_= {@Autowired})
	private RomRegMapper rmapper;
	
	@Override
	public void newAcmReg(AcmVO vo,String userNum) {//회원당 1.숙소추가가 되면서 2.회원상태코드와 회원권한 변경 3.회원히스토리정보가 추가  
		System.out.println("===== newAcmReg =====");
		System.out.println("서비스단의 "+vo.toString());
		System.out.println(vo.getLatitude()+","+vo.getLongitude());
		vo.setOwnerUserNum(userNum);
		
		System.out.println(vo.toString());

		amapper.newAcmReg(vo);//acmNum 반환값으로 안가지고나와도 완성되어있다! 
		
		
		UserVO u=umapper.isHost(userNum);
		System.out.println(u.getUserStatusCode());
		System.out.println(u.getUserStatusCode().trim().equals("ACTIVE"));
		if(u.getUserStatusCode().trim().equals("ACTIVE")) {//이미 호스트면 그냥 넘어가게끔
			UserVO uu=new UserVO();
			uu.setUserNum(userNum);
			uu.setBizRegisterNumber(vo.getBizRegnum());//사업자 등록을 추가해준다
			uu.setUserStatusCode("HO_PENDING"); //priv는 계속 guest다
			System.out.println("지난다");
			umapper.becomeHost(uu);//이미 HO_ACTIVE면 바꾸지말고-- 21일 이후에 수정하자

		}
		
		
		
		//사진 존재시 사진 넣는 부분
		if(vo.getPicList()!=null) {
			for(PicVO picVO : vo.getPicList()){	
				picVO.setNum(vo.getAcmNum());
				if(picVO.getPicDesc()==null) {
					picVO.setPicDesc(vo.getAcmName()+"의 사진");
				}
				amapper.insertPhoto(picVO);
			}
		}
		
	}


	@Transactional
	@Override
	public boolean update1_6(String acmNum, List<String> acmOptcode,String acmDesc) {
		
		AcmVO vo = new AcmVO();
		System.out.println("트림전:"+acmNum);
		acmNum=acmNum.trim();
		System.out.println("트림후:"+acmNum);
		
		vo.setAcmNum(acmNum);//

		int sumOpt=0;
		for(int i=0;i<acmOptcode.size();i++) {
			System.out.println(acmOptcode.get(i));
			sumOpt+=Integer.parseInt(acmOptcode.get(i));
		}
		
		System.out.println("다 더한 값:"+sumOpt);
		System.out.println("숙소설명:"+acmDesc);
		vo.setAcmOptcode(sumOpt);//
		vo.setAcmDesc(acmDesc);//
		
		int rn=amapper.update1_6(vo);
		
		return rn==1;
	}


	@Override
	public boolean chkaddr(String acmDetailaddr) {
		
		return amapper.chkaddr(acmDetailaddr)==0;
	}


	@Override
	public List<AcmVO> getListAcms(String ownerUserNum,String acmActi) {
		
		//호스트이면 사업자등록증에 있는것들을 다 가꾸와
		return amapper.getListAcms(ownerUserNum,acmActi);
	}


	@Override
	public String getAcm(String acmNum) {
		System.out.println("getAcm의:"+acmNum);
		return amapper.getAcm(acmNum);
	}


	@Override
	public AcmVO getnewAcm(String acmNum) {
		if(acmNum==null)return null;
		AcmVO vo=amapper.getnewAcm(acmNum);
		return vo;
	}


	@Override
	public AcmVO getpendingacm(String bizRegisterNumber) {
		System.out.println("서비스단:"+bizRegisterNumber);
		
		AcmVO vo=amapper.getpendingacm(bizRegisterNumber);

		if(vo==null)return null;
		System.out.println(vo.toString());
		
		return vo;
	}


	@Override
	public boolean chkbizused(String bizRegnum, String userNum) {
		UserVO owner=umapper.getAcmOwner(bizRegnum);
		
		if(owner==null)return true;//주인이 없는 번호다
		else return false; //등록중인 bizRegnum
	}

	@Transactional(rollbackFor={Exception.class})
	@Override
	public int removeAcm(String acmNum, String userNum, String userPriv) {
		//해당 숙소외 active나 inactive숙소가 여러개 남아있는 사람이면 host/ho_active
		//해당 숙소외 active나 inactive숙소가 없는 사람은 guest/active로
		//ho_pending이었던 사람은 guest/active로
		System.out.println(acmNum);
		System.out.println(userNum);
		System.out.println(userPriv);
		//acmNum에 관련된 숙소와 객실은 모두 삭제
		
		//1.ho_pending하나밖에 없던 guest
		if(userPriv.equals("GUEST")) {
			System.out.println("1");
			UserVO vo= new UserVO();
			vo.setBizRegisterNumber("");//다시 디폴트시켜놓음
			vo.setUserPriv("GUEST");
			vo.setUserStatusCode("ACTIVE");
			vo.setUserNum(userNum);
			
			umapper.moditoGuest(vo);
			
		} else {//2.host였던 사람
			String acmActi="PENDING";
			//해당 userNum의 acmNum,pending 숙소를 제외한 숙소들이 몇개인지 가져온다
			String ownerUserNum=userNum;
			int cnt=amapper.getNotPendingAcms(acmNum,ownerUserNum,acmActi);
			System.out.println("해당 userNum의 acmNum,pending 숙소를 제외한 숙소들이 몇개인지 가져온다"+cnt);
			
			if(cnt==0) {//2-1하나밖에없던 숙소를 지운다
				System.out.println("2");
				UserVO vo= new UserVO();
				vo.setBizRegisterNumber("");//다시 디폴트시켜놓음
				vo.setUserPriv("GUEST");
				
				acmActi="ACTIVE";
				int cnt2=amapper.getNotPendingAcms(acmNum,ownerUserNum,acmActi);
				
				if(cnt2!=0) {
					vo.setUserStatusCode("HO_PENDING");
				}else {
					vo.setUserStatusCode("ACTIVE");
				}
				vo.setUserNum(userNum);
				umapper.moditoGuest(vo);

			//2-2숙소가 더있다. 그냥 넘어간다 회원권한 변경없음
			} else System.out.println("3");
		}
		
		//숙소, 객실 삭제
		return amapper.removeAcmPic(acmNum)*amapper.removeAcmso(acmNum)*amapper.removeAcm(acmNum);//몇개의 방이 지워졌나
	}

	@Override
	public boolean reregAcm(String acmNum) {
		return amapper.reregAcm(acmNum)==1;
	}


	@Override
	public boolean modiAcm(AcmVO vo) {
		// TODO Auto-generated method stub
		return amapper.modiAcm(vo)==1;
	}

	
	
	
	

	

}
