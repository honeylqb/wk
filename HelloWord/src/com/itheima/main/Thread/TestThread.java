package com.itheima.main.Thread;/*
 * calassName :testThread
 * package    :com.itheima.main.Thread
 * @date      :2019/11/29 0029 17:46
 * @Author    :emptyCloud
 */

public class TestThread extends Thread{
    public  static int count = 1000;
    @Override
    public void run() {
        while (count>0){
            synchronized (this){
                this.count = this.count -1;
            }

            System.out.println(Thread.currentThread().getName()+":"+count+"-----");
//            try {
//                Thread.sleep(1000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
        }
    }
    public  static  void main(String args[]){
        TestThread testThread = new TestThread();
        TestThread testThread2 = new TestThread();
        TestThread testThread3 = new TestThread();
        testThread.start();
        testThread2.start();
        testThread3.start();

    }
}
