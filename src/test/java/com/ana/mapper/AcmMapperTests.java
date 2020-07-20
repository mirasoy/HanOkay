package com.ana.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.AcmVO;
import com.ana.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AcmMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private AcmMapper mapper;
	
	//@Test
    public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	

	//@Test
	public void testRead() {
		AcmVO acm = mapper.read("A5");
		log.info(acm);
	}
	
	//@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("A3"));
	}
	
    //@Test
	public void testUpdate() {
		AcmVO acm = new AcmVO();
		
		acm.setAcmNum("A5");
		acm.setAcmName("수정된 숙소이름");
		acm.setAcmCity("수정된 숙소도시");
		acm.setAcmDistr("수정된 숙소 동");
		acm.setAcmDetailaddr("수정된 숙소 상세주소");
		acm.setCheckinTime("pm12");
		acm.setCheckoutTime("pm06");
		
		int count = mapper.update(acm);
		log.info("UPDATE COUNT: " + count);
		
    }
	
	
	//@Test
	public void testInsert() {
		AcmVO acm = new AcmVO();
		acm.setAcmName("새로 추가한 숙소");
		acm.setAcmCity("새로운 숙소 시");
		acm.setAcmDistr("새로운 숙소 동");
		acm.setAcmDetailaddr("새로운 숙소 상세주소");
		acm.setCheckinTime("AM11");
		acm.setCheckoutTime("PM04");
		
		mapper.insert(acm);
		
		log.info(acm);
	}
	
	
	//@Test
	public void testInsertSelectKey() {
		AcmVO acm = new AcmVO();
		acm.setAcmName("새로 추가한 숙소 select key");
		acm.setAcmCity("새로운 숙소 시selectkey");
		acm.setAcmDistr("새로운 숙소 동");
		acm.setAcmDetailaddr("새로운 숙소 상세주소");
		acm.setCheckinTime("AM11");
		acm.setCheckoutTime("PM04");
		
		mapper.insertSelectKey(acm);
		
		log.info(acm);
	}
	
	//@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		//10개씩 3페이지
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<AcmVO> list = mapper.getListWithPaging(cri);
		list.forEach(acm -> log.info(acm.getAcmNum()));
	}
	
	//@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("북촌");
		cri.setType("TC");
		List<AcmVO> list = mapper.getListWithPaging(cri);
		list.forEach(acm -> log.info(acm));
	}
	
	
	//@Test
	public void testGetRomNum() {
		Criteria cri = new Criteria();
		cri.setIn("2019-04-20");
		cri.setOut("2019-04-22");
		List<String> romNumList = mapper.getRomNum(cri.getIn(),cri.getOut());
	
		romNumList.forEach(acm -> log.info(acm));
	}
	//@Test
	public void testGetAcmNum() {
		Criteria cri = new Criteria();
		cri.setIn("2019-04-20");
		cri.setOut("2019-04-22");
		cri.setPerson("2");
		List<String> romNumList = mapper.getRomNum(cri.getIn(),cri.getOut());
		List<String> acmNumList = mapper.getAcmNum(cri.getPerson(),romNumList);
		acmNumList.forEach(acm -> log.info(acm));
	}
	
	//@Test
		public void testGetListPaging() {
			Criteria cri = new Criteria();
			cri.setKeyword("대구");
			cri.setPerson("8");
			cri.setIn("2019-04-20");
			cri.setOut("2019-04-22");
			List<String> romNumList = mapper.getRomNum(cri.getIn(),cri.getOut());
			List<String> acmNumList = mapper.getAcmNum(cri.getPerson(),romNumList);
			acmNumList.forEach(acm -> log.info(acm));
			List<AcmVO> list = new ArrayList<>();
		
			list = mapper.getListPaging(cri, acmNumList);
			
			list.forEach(acm -> log.info(acm));
		}
	

}
