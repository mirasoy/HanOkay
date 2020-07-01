package com.ana.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.RevDetailVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RevDetailMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private RevDetailMapper mapper;
		
		
   // @Test
    public void testGetList() {
		mapper.getList().forEach(post -> log.info(post));
	}
	
    @Test
	public void testRead() {
		RevDetailVO post = mapper.read("5");
		RevDetailVO post2 = mapper.read("20");
		log.info(post);
		log.info(post2);
	}
	
	//@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("3"));
	}
	
// @Test
	public void testUpdate() {
		RevDetailVO post = mapper.read("7");
		post.setContent("chdddddddddddddddddu~~");
		int count = mapper.update(post);
		log.info("UPDATE COUNT<<<<<<<<<<<<<<<<<>>>>>>>: " + count);
		
    }
	
	
	
	
 //@Test
	public void testInsert() {
		RevDetailVO post = new RevDetailVO();
		post.setRevPurl("ar/1.jpg");
		post.setAcmNum("A1");
		post.setBookNum("b3");
		post.setContent("chu~~");
		post.setStisf(3);
		mapper.insert(post);
		
		
		log.info(post);
	}
	
	

	/*postname      |postcity |postdistr |postdetailaddr |repphone    |
	bizregnum  |checkintime |checkouttime |postregdate            |
	postupdatedate         |phone2     |postfax      |postemail     |postdesc*/

}
