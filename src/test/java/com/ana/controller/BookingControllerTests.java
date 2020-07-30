package com.ana.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.BookingVO;

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
	

	//모든 예약에 대한 테스트
	@Test
	public void TestgetBookListAll() throws Exception{
		log.info(
		
		mockMvc.perform(MockMvcRequestBuilders.get("/mypage/bookListAll"))
		.andReturn()
		.getModelAndView()
		.getModelMap());
		
	}	

	//예약 완료에 대한 테스트
	@Test
	public void testCheckout() throws Exception{
		log.info(
		
		mockMvc.perform(MockMvcRequestBuilders.get("/mypage/checkout"))
		.andReturn()
		.getModelAndView()
		.getModelMap());
		
	}	
	
	
	
	
	//취소된 예약에 대한 테스트
	@Test
	public void testCancelList() throws Exception{
		log.info(
		
		mockMvc.perform(MockMvcRequestBuilders.get("/mypage/cancelled"))
		.andReturn()
		.getModelAndView()
		.getModelMap());
		
	}
	
	
	
	
	
	//예약취소를 위한 테스트
	
	@Test
	public void testRemove()throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/mypage/remove")
				.param("bookNum", "B1")
				).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
				
				
	}

	@Test
	public void testList() throws Exception{
		
		log.info(
		mockMvc.perform(MockMvcRequestBuilders.get("/mypage/bookList"))
		.andReturn()
		.getModelAndView()
		.getModelMap());

	}
	
	

	
	@Test
	public void testGet() throws Exception {

		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/mypage/info")
				.param("bookNum", "B1"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	

	
	
	
//	@Test
	public void testModify() throws Exception {
				
		
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/mypage/modify")
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
	
	
	@Test
	public void test() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/booking/new")
				.param("bookNum", "B9999")
				.param("userNum", "U9999")
				.param("romNum", "R9999")
				.param("bookDate", "2020-01-01")
				.param("checkinDate", "2020-01-01")
				.param("checkoutDate", "2020-01-02")
				.param("staydays", "1")
				.param("guest", "1")
				.param("bookPrice", "1004")
				.param("expectedArr", "1")
				.param("smoking", "1")
				.param("request", "1")
				.param("bookerLastname", "TEST")
				.param("bookerFirstname", "TEST")
				.param("bookerEmail", "TEST@NAVER.COM")
				.param("bookerPhone", "112")
				.param("bookStatus", "1")
		
				.param("payNum", "P1")
				.param("payMethod", "1")
				.param("payTime", "2020-01-01")
				.param("acmNum", "A9999")
				.param("price", "1004")
				.param("vat", "1004")
				.param("subtotal", "1004")
				.param("coupon", "1004")
				.param("mileage", "1004")
				.param("discount", "1004")
				.param("total", "1004")
				.param("payStatus", "1")
				).andReturn().getModelAndView().getModelMap());
	}

}
