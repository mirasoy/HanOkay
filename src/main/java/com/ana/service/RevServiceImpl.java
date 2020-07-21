package com.ana.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.RevDetailVO;
import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;
import com.ana.mapper.RevDetailMapper;
import com.ana.mapper.RevPostMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RevServiceImpl implements RevService {

	private RevPostMapper mapper;
	private RevDetailMapper mapper2;

	
	//등록하기
	@Override
	public void register(RevVO post) {
		log.info("register......" + post);
		mapper.insert(post);
	}
	
	
	//리뷰가져오기
	@Override
	public RevVO get(String postNum) {
		log.info("get......" );
		return mapper.read(postNum);
	}

	
	//리뷰수정하기
	@Override
	public boolean modify(RevVO post) {

		RevVO revPost = new RevVO();
		

		//매퍼마다 넣기위해서 RevVO > post/detail로 변경하기
		revPost.setPstNum(post.getPstNum());
		revPost.setUserNum(post.getUserNum());
		revPost.setBrdCode(post.getBrdCode());
		revPost.setTitle(post.getTitle());

		revPost.setAcmNum(post.getAcmNum());
		revPost.setBookNum(post.getBookNum());
		revPost.setContent(post.getContent());
		revPost.setPstNum(post.getPstNum());
		revPost.setStisf(post.getStisf());

		log.info("modify......" + post);
		//각각 업데이트 메퍼돌리기
		return mapper.update(revPost) == 1;
	}

	
	//리뷰삭제하기
	@Override
	public boolean remove(String postNum) {
		log.info("remove......" + postNum);
		return mapper.delete(postNum) == 1;
	}
	
	
	//모든 리뷰 가져오기 (모든 유저)	
	@Override
	public List<RevVO> getList() {
		List<RevVO> list = mapper.getList();

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat fm2 = new SimpleDateFormat("yyyy-MM-dd");

		//날짜 포멧 수정
		for (RevVO rev : list) {
			try {
				Date checkIn = fm.parse(rev.getCheckInDay());
				Date checkOut = fm.parse(rev.getCheckOutDay());
				rev.setCheckInDay(fm2.format(checkIn));
				rev.setCheckOutDay(fm2.format(checkOut));

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return list;
	}
	
	//완료된 나의 예약가져오기
	@Override
	public List<RevVO> getUserList(String loginUser) {
		
		List<RevVO> list = mapper.getUserBookingACList(loginUser);

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat fm2 = new SimpleDateFormat("yyyy-MM-dd");
		
		//날짜 포멧 수정
		for (RevVO rev : list) {
			try {
				Date checkIn = fm.parse(rev.getCheckInDay());
				Date checkOut = fm.parse(rev.getCheckOutDay());
				rev.setCheckInDay(fm2.format(checkIn));
				rev.setCheckOutDay(fm2.format(checkOut));

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}


	//예약번호로 리뷰가져오기
	@Override
	public RevVO getByBooknum(String bookNum) {
		return mapper.readByBookNum(bookNum);
	}


	@Override
	public List<RevPostVO> getPhoto(String pstNum) {
		
		return mapper.getPhoto(pstNum);
	}

}
