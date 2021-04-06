package com.ssmmerge.crud.bean;

import javax.validation.constraints.Pattern;


public class Employee {
	
	
    private Integer empId;

    @Pattern(regexp="(^[a-z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]+$)",
    		message="用户名必须是5-16的英文、数字、下划线的组合或者是中文！")
    private String empName;

    private String gender;

//    单斜杆在java中是转义字符的意思，需要双斜杆
    @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
    		message="邮箱格式非法!")
    private String email;

    private Integer dId;
    
    //
    private Department dept;

    
    
	public Employee(Integer empId, String empName, String gender, String email,
			Integer dId, Department dept) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.gender = gender;
		this.email = email;
		this.dId = dId;
		this.dept = dept;
	}

	public Employee() {
		super();
	}

	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empName=" + empName
				+ ", gender=" + gender + ", email=" + email + ", dId=" + dId
				+ ", dept=" + dept + "]";
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}