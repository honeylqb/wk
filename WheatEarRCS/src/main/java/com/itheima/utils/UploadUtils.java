package com.itheima.utils;

import java.util.Random;
import java.util.UUID;

public class UploadUtils {
	/**
	 * 获取随机名称
	 * @param realName 真实名称
	 * @return uuid
	 */
	public static String getUUIDName(String realName){
		//realname  可能是  1.jpg   也可能是  1
		//获取后缀名
		int index = realName.lastIndexOf(".");
		if(index==-1){
			return UUID.randomUUID().toString().replace("-", "").toUpperCase();
		}else{
			return UUIDUtils.getId()+realName.substring(index);
		}
	}
	
	/**
	 * 获取文件真实名称
	 * @param name
	 * @return
	 */
	public static String getRealName(String name){
		// c:/upload/1.jpg    1.jpg
		//获取最后一个"/"
		int index = name.lastIndexOf("\\");
		return name.substring(index+1);
	}

	/**
	 * 获取文件真实名称
	 * @param name
	 * @return
	 */
	public static String getRealPath(String name){
		// c:/upload/1.jpg    1.jpg
		//获取最后一个"/"
		int index = name.lastIndexOf("\\");
		return name.substring(0,index+1);
	}


	
	/**
	 * 获取文件目录
	 * @param name 文件名称
	 * @return 目录
	 */
	public static String getDir(String name){
		//任意一个对象都有一个hash码   131313213
		int i = name.hashCode();
		//将hash码转成16禁止的字符串
		String hex = Integer.toHexString(i);
		System.out.println("hex:"+hex);
		int j=hex.length();
		//System.out.println("---------------------"+j);
		for(int k=0;k<8-j;k++){
			Random random = new Random();
			//random.nextInt(10);
			hex=""+random.nextInt(10)+hex;
			//System.out.println("---------------------");
		}
		return "/"+hex.charAt(0)+"/"+hex.charAt(1)+"/"+hex.charAt(2)+"/"+hex.charAt(3)+"/"+hex.charAt(4)+"/"+hex.charAt(5)+"/"+hex.charAt(6)+"/"+hex.charAt(7);
	}
	
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		String s="E://C//BBB/2.jpg";
		//String s="1.jgp";
		//String realName = getRealName(s);
		//System.out.println(realName);
		
		//String uuidName = getUUIDName(realName);
		//System.out.println(uuidName);
		
		String dir = getDir("32332");
		// /b/b/5/6/3/b/a/1/  234234.jpg
		// /f/e/d/c/4/9/8/4/  2341242314321.bmp
		System.out.println(dir);


		System.out.println(getRealPath(s));



		System.out.println(s.substring(0,s.lastIndexOf("/")));
	}
}
