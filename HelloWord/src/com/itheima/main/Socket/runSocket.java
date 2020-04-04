package com.itheima.main.Socket;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

/**
 * @Title: runSocket
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/8 0008 20:29
 */
public class runSocket implements  Runnable {
    Socket socket = null;
    InputStream in =null;
    OutputStream out = null;
    @Override
    public void run() {
        try {
            while (true){


            in = socket.getInputStream();
            byte[] b = new byte[1024];
            int len = in.read(b);
            if(len >0){
                System.out.println("接受了一条消息：");
                String msg = new String(b, 0, len);
                System.out.println(msg);
            }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                socket.close();
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public runSocket(Socket socket) {
        System.out.println(Thread.currentThread().getName()+":"+Thread.currentThread().getId());
        this.socket = socket;
    }
}
