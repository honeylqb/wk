package com.itheima.main.Thread;/*
 * calassName :MyRunnable
 * package    :com.itheima.main.Thread
 * @date      :2019/11/30 0030 19:39
 * @Author    :emptyCloud
 */

public class MyRunnable implements Runnable {
    private int ticket = 100;

    /*
     * 执行卖票操作
     */
    @Override
    public void run() {
        //每个窗口卖票的操作
        //窗口 永远开启
        while (true) {
            synchronized (this){
            if (ticket > 0) {//有票 可以卖
            //出票操作
            //使用sleep模拟一下出票时间
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    // TODO Auto‐generated catch block
                    e.printStackTrace();
                }
                    //获取当前线程对象的名字
                String name = Thread.currentThread().getName();

                    System.out.println(name + "正在卖:" +ticket--);
                }

            }
        }
    }



    public static void main(String args[]) {
        MyRunnable myRunnable = new MyRunnable();
        new Thread(myRunnable,"窗口1").start();
        new Thread(myRunnable,"窗口2").start();
        new Thread(myRunnable,"窗口3").start();

        new Thread(new Runnable() {
            @Override
            public void run() {
                for (int i = 0; i < 10; i++) {
                    System.out.println(i);
                }
            }
        }).start();

    }

}
