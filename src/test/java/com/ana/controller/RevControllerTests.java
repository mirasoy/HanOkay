package com.ana.controller;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
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
public class RevControllerTests {
	
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	private MockHttpSession session;
	private MockHttpServletRequest request;
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		this.request = new MockHttpServletRequest();
		
	}
	
	@Test
	public void testList() throws Exception {
	
		session.setAttribute("userNum", "U1");
		log.info(
				
				mockMvc.perform(MockMvcRequestBuilders.get("/review/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}

	
	
	
	//@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/review/register")
				.param("brdCode", "rev" )
				.param("pTitle", "여기 개추천")
				.param("userNum", "u1919")
				.param("revPurl", "/1234.png")
				.param("stisf", "4")
				.param("acmNum", "a17")
				.param("bookNum", "b123")
				.param("content", "젋뒙옺쥡맙")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	//	@Test
	public void testGet() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/review/get")
				.param("pstNum", ""))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
// @Test
	public void testModify() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/review/modify")
						.param("pstNum", "39")
						.param("brdCode", "rev" )
						.param("pTitle", "여기 개추천")
						.param("pRegDate", "20/05/12")
						.param("userNum", "u1919")
						.param("revPurl", "/1234.png")
						.param("stisf", "4")
						.param("acmNum", "a17")
						.param("bookNum", "b123")
						.param("content", "젋뒙옺쥡맙"))
				.andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
//	@Test
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/review/remove")
				.param("pstNum", "39")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}

}
