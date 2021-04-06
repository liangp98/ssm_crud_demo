package com.ssmmerge.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssmmerge.crud.bean.Employee;
import com.ssmmerge.crud.bean.EmployeeExample;
import com.ssmmerge.crud.bean.EmployeeExample.Criteria;
import com.ssmmerge.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	/**
	 * 查询所有员工
	 * @return
	 */
	public List<Employee> getAll(){	
		return employeeMapper.selectByExampleWithDept(null);
	}

	/**
	 * 保存员工信息
	 * @param employee
	 */
	public void saveEmpInfo(Employee employee) {
		
		employeeMapper.insertSelective(employee);
	}

	/**
	 * 根据name查询员工
	 * @param name
	 * @return
	 */
	public boolean getEmpsByName(String name) {
		
/*		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(name);
		
		long count = employeeMapper.countByExample(example);*/
		Employee employee = new Employee();
		employee.setEmpName(name);
		List<Employee> list = employeeMapper.selectByExample(null);
		for (Employee e : list) {
			if(e.getEmpName().equals(name)){
				//用户名存在
				return true;
			}
		}
		
		return false;
	}

	/**
	 * 根据ID获取员工信息
	 * @param id
	 * @return
	 */
	public Employee getEmpById(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	/**
	 * 更新员工的数据
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	/**
	 * 单一删除员工信息
	 * @param id
	 */
	public void deleteEmpById(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 批量删除员工
	 * @param list
	 */
	public void deleteEmpForBatch(List<Integer> list) {
		// TODO Auto-generated method stub
		
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		//sql:delete from xxx where emp_id in(1,2,....,n)
		criteria.andEmpIdIn(list);
		employeeMapper.deleteByExample(example);
	}

}
