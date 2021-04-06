package com.ssmmerge.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssmmerge.crud.bean.Department;
import com.ssmmerge.crud.dao.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	public List<Department> getAllDepts() {
		
		return departmentMapper.selectByExample(null);
	}

}
