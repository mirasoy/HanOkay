
package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ana.domain.Criteria;
import com.ana.domain.QnaVO;
import com.ana.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService{

	private QnaMapper mapper;
	
	@Override
	public void register(QnaVO qna) {
		
		log.info("register......" + qna);
		
		mapper.insertSelectKey(qna);
	}
	
	//@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public QnaVO get(Long bno, String goHit) {
		log.info("get......" + bno);
		if(goHit.equals("Y")) {
			mapper.boardHit(bno);
		}
		return mapper.read(bno);
	}

	@Override
	public boolean modify(QnaVO qna) {
		log.info("modify......" + qna);
		return mapper.update(qna)==1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove....." + bno);
		return mapper.delete(bno)==1;
	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		
		log.info("get List with criteria: " +  cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}
