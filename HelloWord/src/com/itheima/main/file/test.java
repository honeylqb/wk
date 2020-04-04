package com.itheima.main.file;

import java.io.File;

/**
 * @Title: test
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/15 0015 20:16
 */
public class test {
    public   int num = 0;

    public static void main(String[] args) {
//        File file = new File("d:\\a\\a.txt");
//        if(!file.exists()){
//            System.out.println("创建了。。");
//            file.mkdir();
//        }
//        if(file.exists()){
//            System.out.println("delete..");
//            file.delete();
//        }
//
//        File file1 = new File("e:\\C");
//
//        String[] names = file1.list();
//        for(String name :names){
//            System.out.println(name);
//        }
        test test = new test();
        File file2 = new File("E:\\工作\\CMS配置");
       test.printDir(file2);
       System.out.print(test.num);

    }

    public   void printDir(File dir){
        File[] files = dir.listFiles();

        for(File file :files){
            if(file.isFile()){
                System.out.println(file.getAbsolutePath());
                this.num = this.num +1;
            }else{
                printDir(file);
            }
        }

    }
}
