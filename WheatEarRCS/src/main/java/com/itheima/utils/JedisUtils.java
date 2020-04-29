package com.itheima.utils;

import com.itheima.Listener.JedisPubSubLiseter;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @Title: JedisUtil
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/4/18 0018 17:14
 */
public class JedisUtils {
    //创建连接池
    private static JedisPoolConfig config;
    private static JedisPool pool;

    static{
        config=new JedisPoolConfig();
        config.setMaxTotal(30);
        config.setMaxIdle(2);

        pool=new JedisPool(config, "127.0.0.1", 6379);
    }

    //获取连接的方法
    public static Jedis getJedis(){
        return pool.getResource();
    }


    //释放连接
    public static void closeJedis(Jedis j){
        j.close();
    }

    public static void main(String[] args) {
        Jedis jedis =  JedisUtils.getJedis();

        jedis.set("11", "223323");
        JedisUtils.closeJedis(jedis);
        System.err.println("ssssssssssss");
        System.err.println(jedis.get("11"));


    }

}
