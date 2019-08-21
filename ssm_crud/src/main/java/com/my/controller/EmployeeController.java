package com.my.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.my.bean.Employee;
import com.my.bean.Msg;
import com.my.service.EmployeeSercive;
/**
 * ����Ա��crud����
 * @author Vijay
 *
 */
@Controller
public class EmployeeController {
	@Autowired
	EmployeeSercive employeeSercive;
	
	//delete
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmpById(@PathVariable("id")Integer id) {
		employeeSercive.deleteEmp(id);
		return Msg.success();
	}
	
	
	//update
	@RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Employee employee) {
		employeeSercive.updateEmp(employee);
		return Msg.success();
	}
	
	//id查询员工
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee = employeeSercive.getEmp(id);
		
		return Msg.success().add("emp", employee);
	}
	
	//add
	@RequestMapping(value = "/emp", method =RequestMethod.POST)
	@ResponseBody
	public Msg addEmp(Employee employee) {
		employeeSercive.addEmp(employee);
		return Msg.success();
	}
	
	
	//@responseBody注解的作用是将controller的方法返回的对象通过适当的转换器转换为指定的格式之后，写入到response对象的body区，通常用来返回JSON数据或者是XML
	@RequestMapping("/emps")	
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn) {
		//PageHelper 从pn页开始查 每一页5条数据
				PageHelper.startPage(pn, 5);
				//startPage后更着的查询为 分页查询
				List<Employee> emps = employeeSercive.getAll();
				//包装所有员工
				PageInfo page = new PageInfo(emps,5);
				return Msg.success().add("pageInfo",page);
	}
	
//	@RequestMapping("/emps")
	public String getemps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model) {
		//PageHelper 从pn页开始查 每一页5条数据
		PageHelper.startPage(pn, 5);
		//startPage后更着的查询为 分页查询
		List<Employee> emps = employeeSercive.getAll();
		//包装所有员工
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		return "list";
	}
}
