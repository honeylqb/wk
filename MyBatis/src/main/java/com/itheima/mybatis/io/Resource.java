package com.itheima.mybatis.io;

import java.io.InputStream;

/**
 * @Title: Resource
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/3 0003 15:25
 * 使用类加载器读取配置文件
 */
public class Resource {
    /**
     *
     * @param filePath
     * @return
     */
    public static InputStream getResourceAsStream(String filePath){

        return Resource.class.getClassLoader().getResourceAsStream(filePath);
    }
}
