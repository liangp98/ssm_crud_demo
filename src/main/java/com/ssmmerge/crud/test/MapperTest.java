package com.ssmmerge.crud.test;


/**
 * 测试dao层
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1.导入SpringTest模块
 * 2.使用@ContextConfiguration指定Spring配置文件的位置
 * 3.直接使用@autowired自动注入要用 的组件即可
 */
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ssmmerge.crud.bean.Department;
import com.ssmmerge.crud.bean.Employee;
import com.ssmmerge.crud.dao.DepartmentMapper;
import com.ssmmerge.crud.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {

	@Autowired
	DepartmentMapper dept;
	
	@Autowired
	EmployeeMapper emp;
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void test() {
		
//		Department d = new Department(1, "人力资源部");
//		dept.insertSelective(d);
//		Department d1 = new Department(null, "java开发部");
//		Department d2 = new Department(null, "网络安全部");
//		
//		System.out.println(dept.selectByPrimaryKey(3));
//		dept.insertSelective(d1);
//		dept.insertSelective(d2);
//		emp_id  emp_name  gender  email     d_id  departmen
		System.out.println(emp.selectByPrimaryKeyWithDept(2));
		
//		emp.insertSelective(new Employee(null,"mary","f","mary@qq.com",2,null));
//		emp.insertSelective(new Employee(null,"marine","f","marine@qq.com",1,null));
//		emp.insertSelective(new Employee(null,"john","m","john@qq.com",1,null));
//		
//		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//		for (int i = 0; i < 1000; i++) {
//			String str = UUID.randomUUID().toString().substring(0, 5)+i;
//			mapper.insertSelective(new Employee(null,str,"m",str+"@qq.com",2,null));
//		}
//		System.out.println("操作成功！");
		
		
//		System.out.println(dept);
//		System.out.println(emp);
	}

}
