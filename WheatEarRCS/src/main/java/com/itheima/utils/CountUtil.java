package com.itheima.utils;

/**
 * @Title: countUtil
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/4/6 0006 20:34
 */
public class CountUtil {
    public static long onlineTotal = 0;
    public static long loginTotal = 0;

    public synchronized static long addOnlineTotal(){
        onlineTotal++;
        return onlineTotal;
    }

    public synchronized static long subOnlineTotal(){
        onlineTotal--;
        return (onlineTotal<0)?0:onlineTotal;
    }

    public synchronized static long addLoginTotal(){
        loginTotal++;
        return loginTotal;
}

    public synchronized static long subLoginTotal(){
        loginTotal--;
        return (loginTotal<0)?0:loginTotal;
    }




}
