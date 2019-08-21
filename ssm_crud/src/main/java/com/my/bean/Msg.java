package com.my.bean;
/**
 * 通用的返回类
 * @author Vijay
 *
 */

import java.util.HashMap;
import java.util.Map;

import com.github.pagehelper.PageInfo;

public class Msg {
	//100 ok  200 fail
	private int code;
	//提示信息
	private String msg;
	//用户返回的数据
	private Map<String, Object> returnData= new HashMap<String, Object>();
	
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("处理成功");
		return result;
	}
	
	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("处理失败");
		return result;
	}
	
	public Msg add(String key, Object value) {
		this.getReturnData().put(key, value);
		return this;
	}
	
	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getReturnData() {
		return returnData;
	}
	public void setReturnData(Map<String, Object> returnData) {
		this.returnData = returnData;
	}

	
	
}
