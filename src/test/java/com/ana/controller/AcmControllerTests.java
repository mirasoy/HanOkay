package com.ana.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class AcmControllerTests {
	
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/acm/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}

	//@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/acm/register")
				.param("acmName", "테스트 숙소 새 이름" )
				.param("acmCity", "테스트 숙소 새 도시")
				.param("AcmDistr", "테스트 숙소 새 구")
				.param("AcmDetailaddr", "테스트 숙소 새 상세")
				.param("RepPhone", "8233333333")
				.param("BizRegnum", "12345678")
				.param("CheckinTime", "AM10")
				.param("CheckoutTime", "PM05")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testGet() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/acm/get")
				.param("acmNum", "A32"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
	//@Test
	public void testModify() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/acm/modify")
						.param("acmNum", "A32")
						.param("acmName", "수정된 숙소 새 이름" )
						.param("acmCity", "수정된 숙소 새 도시")
						.param("AcmDistr", "수정된 숙소 새 구")
						.param("AcmDetailaddr", "수정된 숙소 새 상세")
						.param("RepPhone", "8255555555")
						.param("BizRegnum", "66667777")
						.param("CheckinTime", "AM09")
						.param("CheckoutTime", "PM02"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/acm/remove")
				.param("acmNum", "A33")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}

}
