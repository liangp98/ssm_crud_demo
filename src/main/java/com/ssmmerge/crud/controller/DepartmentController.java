package com.ssmmerge.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssmmerge.crud.bean.Department;
import com.ssmmerge.crud.bean.Msg;
import com.ssmmerge.crud.service.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	
	/**
	 * 获取部门信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/depts")
	public Msg getDepts(){
		List<Department> dept = departmentService.getAllDepts();
		
		return Msg.success().add("dept", dept);
	}
}
