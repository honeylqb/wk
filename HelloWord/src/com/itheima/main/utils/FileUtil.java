package com.itheima.main.utils;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * @Title: FileUtil
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/24 0024 15:31
 */
public class FileUtil {

    public   static int count = 0;
    public   static Map<String,Integer> strNameMap = new HashMap<>();
    public   static void printDir(File dir){
        File[] files = dir.listFiles();

        for(File file :files){
            if(file.isFile()){
                System.out.println(file.getAbsolutePath());
                System.out.println(file.getName());
                String fileName =  file.getName();
                String name = "";
                if(fileName.contains(".")){
                    name = fileName.substring(fileName.lastIndexOf("."));
                }
                    if(strNameMap.containsKey(name)){
                        Integer c = strNameMap.get(name);
                        strNameMap.put(name,++c);
                    }else {
                        strNameMap.put(name, 1);
                    }




                    count++;
            }else{
                printDir(file);
            }
        }

    }
    public static  void test(){
        String name = "414xls";
        System.out.println(name.contains("."));
        System.out.println(name.indexOf("."));
        System.out.println(name.lastIndexOf("."));
        System.out.println(name.substring(3));
        System.out.println(name.lastIndexOf("."));


    }
    public static void main(String[] args) {
        File dir = new File("E:\\工作");
        printDir(dir);
        System.out.println(FileUtil.count);
        System.out.println(FileUtil.strNameMap.toString());


    }
}
