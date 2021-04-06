package com.ssmmerge.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssmmerge.crud.bean.Employee;
import com.ssmmerge.crud.bean.Msg;
import com.ssmmerge.crud.service.EmployeeService;

/**
 * 处理Employee的CRUD
 * @author WLP-PC
 *
 */
@Controller
public class EmployeController {

	@Autowired
	private EmployeeService employeeService;
	
	/**
	 * 删除员工：批量删除和单一删除
	 * @param arr
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg removeEmpById(@PathVariable("ids")String arr){

		if(arr.contains("-")){
			//批量删除
			List<Integer> list = new ArrayList<>();
			String[] strArr = arr.split("-");
			
			for (String str : strArr) {
				list.add(Integer.parseInt(str));
			}
			employeeService.deleteEmpForBatch(list);
		}else{
			//单一删除
			int id = Integer.parseInt(arr);
			employeeService.deleteEmpById(id);
		}
		
		
		
		return Msg.success();
	}
	
	/**
	 * 根据编辑模态框的数据更新员工的信息
	 * @param employee
	 * @return
	 * 
	 * /emp/{xxx}中的xxx字段要和Employee的empId字段名对应
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	public Msg changeEmp(Employee employee){
		
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 根据url中的id获取员工信息，保存到Msg中回发给客户端
	 * @param id	
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	public Msg getEmp(@PathVariable("id")Integer id){
		Employee employee = employeeService.getEmpById(id);
		
		return Msg.success().add("emp", employee);
	}
	
	/**
	 * 校验用户名是否合法 | 用户名是否存在
	 * @param name
	 * @return	true:empname不可用；	false：empname可用
	 */
	@ResponseBody
	@RequestMapping(value="/checkout",method=RequestMethod.POST)
	public Msg queryEmpsByName(@RequestParam("empName")String name){
		
		//后端，正则校验empName是否合法
		String pattern="(^[a-z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]+$)";
		if(!name.matches(pattern)){
			return Msg.fails().add("tips", "用户名必须是5-16的英文、数字、下划线的组合或者是中文！");
		}
		
		
		Boolean isExist= employeeService.getEmpsByName(name);
		
		if(isExist){
			return Msg.fails().add("tips", "用户名已存在");
		}else{
			return Msg.success().add("tips", "用户名可用");
		}

	}
	

	/**
	 * 保存员工
	 * 符合rest风格： post--保存， get--查询，put--增加，delete--删除
	 * @param employee
	 * @param result	封装校验结果信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	public Msg saveEmps(@Valid Employee employee,BindingResult result){
		if(result.hasErrors()){
			//校验失败，返回失败结果信息，在模态框中显示错误信息
			
			//获取所有的错误信息
			List<FieldError> errors = result.getFieldErrors();
			Map<String,Object> map = new HashMap<>();
			
			for (FieldError fieldError : errors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fails().add("error", map);
		}else{
			//校验成功，保存信息到数据库
			employeeService.saveEmpInfo(employee);
			return Msg.success();
		}

	}
	
	/**
	 * 方法二：将用户请求的数据封装在Msg中，以json字符串的形式返回给客户端
	 * .@ResponseBody标签：会自动将数据转化为json格式，并将数据放入响应体中回传给用户
	 * 
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emps")
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn){
		
		//每页显示5条数据
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		
		//分页栏显示5条
		PageInfo page = new PageInfo(emps,5);
		
		//将请求的数据封装在Msg中返回
		return new Msg().success().add("pageInfo", page);
		
	}
	
	
	
	/**
	 * 方法一：
	 * 处理请/emps求：有局限性；对于B/S模型而言，对浏览器与服务器较为友好；对安卓、IOS/服务器不够友好
	 * 
	 * @param pn	当前页码
	 * @return	转发到list.jsp页面显示
	 */
/*	@RequestMapping(value="/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		
		//每页显示5条数据
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		
		//分页栏显示5条
		PageInfo page = new PageInfo(emps,5);
		
		model.addAttribute("pageInfo",page);

		return "list";
	}*/
	
}
