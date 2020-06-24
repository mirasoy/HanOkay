package com.ana.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.AcmVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AcmMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private AcmMapper mapper;
	
	@Test
    public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testRead() {
		AcmVO acm = mapper.read("A5");
		log.info(acm);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("A3"));
	}
	
    @Test
	public void testUpdate() {
		AcmVO acm = new AcmVO();
		
		acm.setAcm_Num("A5");
		acm.setAcm_Name("수정된 숙소이름");
		acm.setAcm_City("수정된 숙소도시");
		acm.setAcm_Distr("수정된 숙소 동");
		acm.setAcm_Detailaddr("수정된 숙소 상세주소");
		acm.setRep_Phone(8200000000L);
		acm.setBiz_Regnum(11000000L);
		acm.setCheckin_Time("pm12");
		acm.setCheckout_Time("pm06");
		
		int count = mapper.update(acm);
		log.info("UPDATE COUNT: " + count);
		
    }
	
	
	@Test
	public void testInsert() {
		AcmVO acm = new AcmVO();
		acm.setAcm_Name("새로 추가한 숙소");
		acm.setAcm_City("새로운 숙소 시");
		acm.setAcm_Distr("새로운 숙소 동");
		acm.setAcm_Detailaddr("새로운 숙소 상세주소");
		acm.setRep_Phone(8212341234L);
		acm.setBiz_Regnum(56785678L);
		acm.setCheckin_Time("AM11");
		acm.setCheckout_Time("PM04");
		
		mapper.insert(acm);
		
		log.info(acm);
	}
	
	@Test
	public void testInsertSelectKey() {
		AcmVO acm = new AcmVO();
		acm.setAcm_Name("새로 추가한 숙소 select key");
		acm.setAcm_City("새로운 숙소 시selectkey");
		acm.setAcm_Distr("새로운 숙소 동");
		acm.setAcm_Detailaddr("새로운 숙소 상세주소");
		acm.setRep_Phone(8212341234L);
		acm.setBiz_Regnum(56785678L);
		acm.setCheckin_Time("AM11");
		acm.setCheckout_Time("PM04");
		
		mapper.insertSelectKey(acm);
		
		log.info(acm);
	}
	
	/*acmname      |acmcity |acmdistr |acmdetailaddr |repphone    |
	bizregnum  |checkintime |checkouttime |acmregdate            |
	acmupdatedate         |phone2     |acmfax      |acmemail     |acmdesc*/

}
