package com.itheima.utils;



/**
 * 封装符合Layui要求的数据
 */
public class LayuiResult {
	/**响应编码*/
	private int code;
	/**响应消息*/
	private String msg;
	/**数据总量*/
	private long count;
	/**数据*/
	private Object data;

	public String toJson(){
		return JsonUtils.toJson(this);
	}
	
	public LayuiResult() {
	}
	
	public static LayuiResult ok(){
		return ok(0,null);
	}
	public static LayuiResult ok(long count, Object data){
		return new LayuiResult(0, "操作成功!", count, data);
	}
	public static LayuiResult ok(long count, String msg , Object data){
		return new LayuiResult(0, msg, count, data);
	}
	public static LayuiResult ok(String msg){
		return new LayuiResult(0,msg, 0,null);
	}
	
	public static LayuiResult error(long count, Object data){
		return new LayuiResult(1, "操作失败!", count, data);
	}
	public static LayuiResult error(){
		return error(0,null);
	}
	public static LayuiResult error(String msg){
		return new LayuiResult(1, msg,0,null);
	}
	

	public LayuiResult(int code, String msg, long count, Object data) {
		super();
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}

	@Override
	public String toString() {
		return "LayuiResult [code=" + code + ", msg=" + msg + ", count=" + count + ", data=" + data + "]";
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

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
}