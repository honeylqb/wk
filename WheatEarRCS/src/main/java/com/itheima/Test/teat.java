package com.itheima.Test;

import XMSB.WheatEatEcs;

/**
 * @Title: teat
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/5/8 0008 9:54
 */
public class teat {

    public static void main(String[] args) {
        System.err.println("-----------1------------");
        try {

            String ss="E:\\C\\2\\";

            String bb="2.jpg";

            WheatEatEcs eatEcs = new WheatEatEcs();
            eatEcs.XMSB(ss, bb);
            Object[] result = eatEcs.XMSB(ss,bb);
            System.err.println("-------------2----------");
//			System.out.println(result[0].toString());
//			System.out.println(result[1].toString());
//			System.out.println(result[2].toString());

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        System.err.println("------------3-----------");
    }
}
