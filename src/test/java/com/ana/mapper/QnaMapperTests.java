package com.ana.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.Criteria;
import com.ana.domain.QnaVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private QnaMapper mapper;
	
	//@Test
	public void testGetList() {
		mapper.getList().forEach(qna->log.info(qna));
	}
	
	//@Test
	public void testInsert() {
		QnaVO qna = new QnaVO();
		qna.setTitle("새로 작성하는 글");
		qna.setContent("새로 작성하는 내용");
		qna.setWriter("U51");
		
		mapper.insert(qna);
		
		log.info(qna);
	}
	
	//@Test
	public void testInsertSelectKey() {
		QnaVO qna = new QnaVO();
		qna.setTitle("새로 작성하는 글 SelectKey");
		qna.setContent("새로 작성하는 내용 SelectKey");
		qna.setWriter("U51");
		
		mapper.insertSelectKey(qna);
		
		log.info(qna);
	}
	
	//@Test
	public void testRead() {
		QnaVO qna = mapper.read(5L);
		
		log.info(qna);
	}
	
	//@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(3L));
	}
	
	//@Test
	public void testUpdate() {
		QnaVO qna = new QnaVO();
		qna.setBno(5L);
		qna.setTitle("수정된 제목");
		qna.setContent("수정된 내용");
		qna.setWriter("U51");
		
		int count = mapper.update(qna);
		log.info("UPDATE COUNT: " + count);
		
	}
	
	//@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		List<QnaVO> list = mapper.getListWithPaging(cri);
		list.forEach(qna -> log.info(qna));
	}
	
	//@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("새로");
		cri.setType("TC");
		
		List<QnaVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testBoardHit() {
		
		mapper.boardHit(5L);
		QnaVO qna = mapper.read(5L);
		
		log.info(qna);
	}

}
