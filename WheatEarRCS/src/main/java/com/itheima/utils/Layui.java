package com.itheima.utils;

import java.util.HashMap;
import java.util.List;

/**
 * @Title: Layui
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/2/25 0025 20:52
 */
public class Layui extends HashMap<String , Object> {

    public static Layui data(Integer count, List<?> data){
        Layui r = new Layui();
        r.put("code", 0);
        r.put("msg", "");
        r.put("count", count);
        r.put("data", data);
        return r;
    }
}
