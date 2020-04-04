package com.itheima.main.Socket;

import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * @Title: testSocket
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/8 0008 19:22
 */
public class testSocket {


    public  ServerSocket serverSocket = new ServerSocket(6666);

    public testSocket() throws Exception {
    }
    public  void start(){
        System.out.println("服务器启动，等待连接。。。。");
        Socket socket = null;
        InputStream in =null;
        try {
            while (true){
                socket = this.serverSocket.accept();
                if(socket !=null){
                    System.out.println("有人连接了。。。。");
                    runSocket runSocket = new runSocket(socket);
                    new Thread(runSocket).start();
                }


            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {

        }
    }
    public static void main(String[] args) throws Exception {
        testSocket testSocket = new testSocket();
        testSocket.start();

    }

}
