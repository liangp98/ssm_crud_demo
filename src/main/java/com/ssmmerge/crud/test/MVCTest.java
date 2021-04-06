package com.ssmmerge.crud.test;


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

/**
 * 使用Spring测试模块提供的测试请求功能，测试crud请求的正确性
 * @author WLP-PC
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml","classpath:applicationContext-mvc.xml"})
public class MVCTest {
	
	//闯入springmvc的ioc容器；自动注入前要@WebAppConfiguration注解
	@Autowired	
	WebApplicationContext context;
	//虚拟的mvc请求，获取到处理结果
	MockMvc mockMvc;
	
	@Before
	public void intiMockMvc(){
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testPage() throws Exception {
		//模拟请求，拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
		
		MockHttpServletRequest request = result.getRequest();
		PageInfo pages = (PageInfo) request.getAttribute("pageInfo");
		
//	    //当前页
//	    private int pageNum;
//	    //每页的数量
//	    private int pageSize;
//	    //当前页的数量
//	    private int size;
//
//	    //由于startRow和endRow不常用，这里说个具体的用法
//	    //可以在页面中"显示startRow到endRow 共size条数据"
//
//	    //当前页面第一个元素在数据库中的行号
//	    private int startRow;
//	    //当前页面最后一个元素在数据库中的行号
//	    private int endRow;
//	    //总页数
//	    private int pages;
//
//	    //前一页
//	    private int prePage;
//	    //下一页
//	    private int nextPage;
		
		System.out.println("当前页码:"+pages.getPageNum());
		System.out.println("每页的数量:"+pages.getPageSize());
		System.out.println("当前页的数量:"+pages.getSize());
		System.out.println("当前页面第一个元素在数据库中的行号:"+pages.getStartRow());
		System.out.println("当前页面最后一个元素在数据库中的行号:"+pages.getEndRow());
		System.out.println("总页数:"+pages.getPages());
		System.out.println("前一页:"+pages.getPrePage());
		System.out.println("下一页:"+pages.getNextPage());
	}

}
