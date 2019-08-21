package com.my.test;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
/**
 * 测试dao
 * @author Vijay
 *
 */

import com.my.bean.Department;
import com.my.bean.Employee;
import com.my.dao.DepartmentMapper;
import com.my.dao.EmployeeMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSession;
	/**
	 * 测试DepartmentMapper
	 */
	@Test
	public void testCRUD() {
		//
		System.out.println(employeeMapper);
		//insert
//		departmentMapper.insertSelective(new Department(null,"开发部"));
//		departmentMapper.insertSelective(new Department(null,"测试部"));
//		System.out.println("hhh");
		//employeeMapper.insertSelective(new Employee(null, "zs", "M", "zs@qq.com", 1));
//		for (int i = 0; i < 1000; i++) {
//			employeeMapper.insertSelective(new Employee(null, "", "M", "zs@qq.com", 1));
//		}
		EmployeeMapper Mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 500; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5)+i;
			Mapper.insertSelective(new Employee(null, uid, "M", uid+"@qq.com", 1));
		}
		System.out.println("ok");
	}
}
