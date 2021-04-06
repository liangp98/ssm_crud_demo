package com.ssmmerge.crud.bean;

import java.util.HashMap;
import java.util.Map;


public class Msg {
	
	//状态码：100--成功，200--失败
	private int statusCode;
	//提示信息
	private  String msg;
	
	//返回给浏览器的信息
	private Map<String,Object> extend = new HashMap<String,Object>();

	public Msg() {
		super();
	}

	public Msg(int statusCode, String msg, Map<String, Object> extend) {
		super();
		this.statusCode = statusCode;
		this.msg = msg;
		this.extend = extend;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
	/**
	 * 处理成功100，封装一个Msg对象返回
	 * @return
	 */
	public static Msg success(){
		Msg result = new Msg();
		result.setStatusCode(100);
		result.setMsg("操作成功！");
		
		return result;
	}
	
	/**
	 * 处理失败200，封装一个Msg对象返回
	 * @return
	 */
	public static Msg fails(){
		Msg result = new Msg();
		result.setStatusCode(200);
		result.setMsg("操作失败！");
		
		return result;
	}
	
	/**
	 * 用于封装用户请求的数据
	 * 支持链式添加
	 * @param key
	 * @param obj
	 * @return
	 */
	public Msg add(String key,Object obj){

		this.getExtend().put(key, obj);
		return this;
	}
}
