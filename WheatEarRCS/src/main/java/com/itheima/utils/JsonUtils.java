package com.itheima.utils;

import java.io.*;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Json序列化工具类
 *
 */
public class JsonUtils {
	/**
	 * 序列化成json
	 * */
	public static String toJson(Object obj) {
		// 对象映射器
		ObjectMapper mapper = new ObjectMapper();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd HH:mm:ss");
		mapper.setDateFormat(sdf);
		
		String result = null;
		// 序列化user对象为json字符串
		try {
			result = mapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 反序列化成对象
	 * */
	public static <T> T toObject(String json,Class<T> valueType) {
		//对象映射器
		ObjectMapper mapper=new ObjectMapper();
		T result=null;
		try {
			result=mapper.readValue(json,valueType);

		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static String readJsonFile(String fileName) {
		String jsonStr = "";
		try {
			File jsonFile = new File(fileName);
			FileReader fileReader = new FileReader(jsonFile);

			Reader reader = new InputStreamReader(new FileInputStream(jsonFile),"utf-8");
			int ch = 0;
			StringBuffer sb = new StringBuffer();
			while ((ch = reader.read()) != -1) {
				sb.append((char) ch);
			}
			fileReader.close();
			reader.close();
			jsonStr = sb.toString();
			return jsonStr;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
}
