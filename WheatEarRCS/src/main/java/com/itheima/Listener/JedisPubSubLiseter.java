package com.itheima.Listener;

import redis.clients.jedis.Client;
import redis.clients.jedis.JedisPubSub;

/**
 * @Title: JedisPubSubLiseter
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/4/18 0018 17:18
 */
public class JedisPubSubLiseter extends JedisPubSub {

    @Override
    public void onMessage(String s, String s1) {
        System.out.println("onMessage  s:"+s+"s1"+s1);

    }

    @Override
    public void onPMessage(String s, String s1, String s2) {
        System.out.println(" onPMessage  s:"+s+"s1:"+s1+"s2:"+s2);
    }

    @Override
    public void onSubscribe(String s, int i) {
        System.out.println("onSubscribe s:"+s+"i:"+i);
    }

    @Override
    public void onUnsubscribe(String s, int i) {
        System.out.println("onUnsubscribe s:"+s+"i:"+i);
    }

    @Override
    public void onPUnsubscribe(String s, int i) {
        System.out.println("onPUnsubscribe s:"+s+"i:"+i);
    }

    @Override
    public void onPSubscribe(String s, int i) {
        System.out.println("onPSubscribe s:"+s+"i:"+i);
    }
}
