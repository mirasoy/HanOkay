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

	@Override
	public void register(RevVO post) {
		log.info("register......" + post);

		mapper.insert(post);

	}

	@Override
	public RevVO get(String postNum) {
		log.info("get......" );

		return mapper.read(postNum);
	}

	@Override
	public boolean modify(RevVO post) {

		RevPostVO revPost = new RevPostVO();
		RevDetailVO detailPost = new RevDetailVO();

		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");

		revPost.setPstNum(post.getPstNum());
		revPost.setUserNum(post.getUserNum());
		revPost.setBrdCode(post.getBrdCode());
		revPost.setTitle(post.getTitle());
		revPost.setRegDate(beforeFormat.format(post.getRegDate()));

		detailPost.setAcmNum(post.getAcmNum());
		detailPost.setBookNum(post.getBookNum());
		detailPost.setContent(post.getContent());
		detailPost.setPstNum(post.getPstNum());
		detailPost.setRevPurl(post.getRevPurl());
		detailPost.setStisf(post.getStisf());

		log.info("modify......" + post);

		return mapper.update(revPost) == 1 && mapper2.update(detailPost) == 1;
	}

	@Override
	public boolean remove(String postNum) {
		log.info("remove......" + postNum);
		return mapper.delete(postNum) == 1;
	}

	@Override
	public List<RevVO> getList() {
		List<RevVO> list = mapper.getList();

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat fm2 = new SimpleDateFormat("yyyy-MM-dd");

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

	@Override
	public List<RevVO> getUserList(String loginUser) {
		
		List<RevVO> list = mapper.getMyList(loginUser);

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat fm2 = new SimpleDateFormat("yyyy-MM-dd");

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

//	@Override
//	public List<RevVO> getBookingList(String loginUser) {
//		List<RevVO> list = mapper.getBookingList(loginUser);
//
//		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		SimpleDateFormat fm2 = new SimpleDateFormat("yyyy-MM-dd");
//
//		for (RevVO rev : list) {
//			try {
//				Date checkIn = fm.parse(rev.getCheckInDay());
//				Date checkOut = fm.parse(rev.getCheckOutDay());
//				rev.setCheckInDay(fm2.format(checkIn));
//				rev.setCheckOutDay(fm2.format(checkOut));
//
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//		}
//
//		return list;
//	}

	@Override
	public RevVO getByBooknum(String bookNum) {
		return mapper.readByBookNum(bookNum);
	}

}
