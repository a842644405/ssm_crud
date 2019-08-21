package com.my.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.bean.Employee;
import com.my.dao.EmployeeMapper;

@Service
public class EmployeeSercive {
	@Autowired
	EmployeeMapper employeeMapper;
	//查询所有
	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}
	
	//save employee
	public void addEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}
	
	//查询单个员工
	public Employee getEmp(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}
	
	//更新单个员工
	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKeySelective(employee);
		
	}
	
	//删除单个员工
	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
	}

	

	

}
