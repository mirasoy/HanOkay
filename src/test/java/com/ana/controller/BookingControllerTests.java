package com.ana.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

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

//Test for Controller
@WebAppConfiguration

@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })

@Log4j

public class BookingControllerTests {

	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	

	//취소된 예약에 대한 테스트
	@Test
	public void testCancelList() throws Exception{
		log.info(
		
		mockMvc.perform(MockMvcRequestBuilders.get("/MyPage/cancelled"))
		.andReturn()
		.getModelAndView()
		.getModelMap());
		
	}
	
	
	
	
	
	
	
//	@Test
	public void testRemove()throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/MyPage/remove")
				.param("bookNum", "B14")
				).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
				
				
	}

	@Test
	public void testList() throws Exception{
		
		log.info(
		mockMvc.perform(MockMvcRequestBuilders.get("/MyPage/bookList"))
		.andReturn()
		.getModelAndView()
		.getModelMap());

	}
	
	

	
//	@Test
	public void testGet() throws Exception {

		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/MyPage/info")
				.param("bookNum", "B1"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	

	
	
	
//	@Test
	public void testModify() throws Exception {
				
		
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/MyPage/modify")
						.param("bookNum", "B2")
						.param("userNum", "수정된 회원번호")
						.param("romNum", "수정된 방번호")						
						.param("staydays", "1")
						.param("guest", "1")
						.param("bookPrice", "123")
						.param("deposit", "1")
						.param("canceled", "1")
						.param("expectedArr", "수정")
						.param("smoking", "1")
						.param("request", "수정")
						.param("realArr", "수정된 도착시간")														
						.param("bookDate", "2020/02/02")
						.param("checkinDate", "2020/02/02")

						.param("checkoutDate", "2020/02/02")						
						

						)
				.andReturn().getModelAndView().getViewName();
		
	

		log.info(resultPage);

	}
	
 }
