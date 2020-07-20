package com.ana.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class RevPostMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private RevPostMapper mapper;
	
	/*
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("RV1"));
	}
	
	
@Test
	public void testUpdate() {
		RevVO post = new RevVO();
		post.setBrdCode("rev");
		post.setTitle("수정한 제목제목");
		post.setUserNum("추가된작성자");
		post.setPstNum("RV1");
		post.setAcmNum("a18");
		post.setBookNum("B18");
		post.setContent("181818");
		post.setRevPurl("/a.jpg");
		post.setStisf(3);
		
		int count = mapper.update(post);
		log.info("UPDATE COUNT: " + count);
		
    }
	
	
	
	
	@Test
	public void testInsert() {
		RevVO post = new RevVO();
		post.setBrdCode("REV");
		post.setTitle("추가제목");
		post.setUserNum("U18");
		post.setAcmNum("A18");
		post.setBookNum("B18");
		post.setContent("181818");
		post.setStisf(4);
		
		
		mapper.insert(post);
		
		log.info(post);
	}
	
	 @Test
	public void testReadByBookNum() {
		RevVO post = mapper.readByBookNum("B5");
		log.info(post);
	}
	

    @Test
public void testGetMyList() {
	mapper.getUserBookingACList("U1").forEach(post -> log.info(post));
}


 
  @Test
	public void testRead() {
		RevVO post = mapper.read("RV5");
			log.info(post);
   }
	 
	

	*/
	
	
	//@Test
	public void testGetList2() {
		mapper.getAcmList("A2").forEach(post -> log.info(post));
	}
	
	
	@Test
    public void testGetList() {
		mapper.getList().forEach(post -> log.info(post));
	}
	





	
	

	
	

}
