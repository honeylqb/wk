package com.itheima.main.Socket;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

/**
 * @Title: ClientTcp
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/8 0008 19:29
 */
public class ClientTcp implements Runnable{

        public static void main(String[] args) throws Exception {
        ClientTcp tcp = new ClientTcp();
//        for(int i = 0;i<10;i++){
//            new Thread(tcp,"client1").start();
//            Thread.sleep(1000);
//        }
            new Thread(tcp,"client1").start();



}

    @Override
    public void run() {
        System.out.println("客户端 发送数据");
        // 1.创建 Socket ( ip , port ) , 确定连接到哪里.
        Socket client = null;
        OutputStream os= null;
        try {
            client = new Socket("localhost", 6666);
            // 2.获取流对象 . 输出流
            while (true){


             os = client.getOutputStream();
            // 3.写出数据.
            Scanner scanner = new Scanner(System.in);
            new Thread(new Runnable() {

                @Override
                public void run() {

                }
            }).start();
            System.out.print("请输入：");
            String a = scanner.nextLine();
            os.write(a.getBytes());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            // 4. 关闭资源 .

                try {
                    os.close();
                    client.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }



        }


    }
}
