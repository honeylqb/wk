package com.itheima.utils;


import jdk.internal.dynalink.beans.StaticClass;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * 返回客户端信息工具类
 * by netwild
 */
public class ClientInfo {


    /*
     * 构造函数
     * 参数：String request.getHeader("user-agent")
     *
     * IE7:Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C)
     * IE8:Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C)
     * Maxthon:Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; Maxthon 2.0)
     * firefox:Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.11) Gecko/20101012 Firefox/3.6.11
     * Chrome:Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7
     * Opera:Opera/9.80 (Windows NT 6.1; U; zh-cn) Presto/2.6.30 Version/10.63
     *
     * 操作系统：
     * Win7 : Windows NT 6.1
     * WinXP : Windows NT 5.1
     */

    /*
     * 获取核心浏览器名称
     */
    public static String  getExplorerName(String  info){
        String str = "未知";
        String explorerVer = "";
        Pattern pattern = Pattern.compile("");
        Matcher matcher;
        if(info.indexOf("MSIE") != -1){
            str = "MSIE"; //微软IE
            pattern = Pattern.compile(str + "\\s([0-9.]+)");
        }else if(info.indexOf("Firefox") != -1){
            str = "Firefox"; //火狐
            pattern = Pattern.compile(str + "\\/([0-9.]+)");
        }else if(info.indexOf("Chrome") != -1){
            str = "Chrome"; //Google
            pattern = Pattern.compile(str + "\\/([0-9.]+)");
        }else if(info.indexOf("Opera") != -1){
            str = "Opera"; //Opera
            pattern = Pattern.compile("Version\\/([0-9.]+)");
        }
        matcher = pattern.matcher(info);
        if(matcher.find())  explorerVer = matcher.group(1);
        return str;
    }

    /*
     * 获取核心浏览器版本
     */
    public static String getExplorerVer(String  info){
        String str = "未知";
        String explorerVer = "";

        Pattern pattern = Pattern.compile("");
        Matcher matcher;
        if(info.indexOf("MSIE") != -1){
            str = "MSIE"; //微软IE
            pattern = Pattern.compile(str + "\\s([0-9.]+)");
        }else if(info.indexOf("Firefox") != -1){
            str = "Firefox"; //火狐
            pattern = Pattern.compile(str + "\\/([0-9.]+)");
        }else if(info.indexOf("Chrome") != -1){
            str = "Chrome"; //Google
            pattern = Pattern.compile(str + "\\/([0-9.]+)");
        }else if(info.indexOf("Opera") != -1){
            str = "Opera"; //Opera
            pattern = Pattern.compile("Version\\/([0-9.]+)");
        }
        matcher = pattern.matcher(info);
        if(matcher.find())  explorerVer = matcher.group(1);

        return explorerVer;
    }

    /*
     * 获取浏览器插件名称（例如：遨游、世界之窗等）
     */
    public static  String getExplorerPlug(String  info){
        String str = "无";
        if(info.indexOf("Maxthon") != -1)
            str = "Maxthon"; //遨游
        return str;
    }

    /*
     * 获取操作系统名称
     */
    public static String getOSName(String  info){
        String str = "未知";
        String OSVer = "";
        Pattern pattern = Pattern.compile("");
        Matcher matcher;
        if(info.indexOf("Windows") != -1){
            str = "Windows"; //Windows NT 6.1
            pattern = Pattern.compile(str + "\\s([a-zA-Z0-9]+\\s[0-9.]+)");
        }
        matcher = pattern.matcher(info);
        if(matcher.find())  OSVer = matcher.group(1);
        return str;
    }

    /*
     * 获取操作系统版本
     */
    public static String getOSVer(String  info){
        String str = "未知";
        String OSVer = "";
        Pattern pattern = Pattern.compile("");
        Matcher matcher;
        if(info.indexOf("Windows") != -1){
            str = "Windows"; //Windows NT 6.1
            pattern = Pattern.compile(str + "\\s([a-zA-Z0-9]+\\s[0-9.]+)");
        }
        matcher = pattern.matcher(info);
        if(matcher.find())  OSVer = matcher.group(1);
        return OSVer;
    }
    public static Map<String,Object> getClientInfo(String  info){
            Map<String,Object> map = new HashMap<>();

            map.put("explorerName",getExplorerName(info));
            map.put("explorerVer",getExplorerVer(info));
            map.put("OSName",getOSName(info));
            map.put("OSVer",getOSVer(info));

            return map;
    }

}