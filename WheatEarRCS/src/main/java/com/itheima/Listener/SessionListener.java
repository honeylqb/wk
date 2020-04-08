package com.itheima.Listener;

import com.itheima.utils.CountUtil;
import com.itheima.utils.MySessionContext;
import org.apache.ibatis.reflection.SystemMetaObject;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * @Title: SessionListener
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/4/6 0006 18:24
 */
public class SessionListener implements HttpSessionListener {

    private MySessionContext myc = MySessionContext.getInstance();
    public static int number = 0;//建立连接数

    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        HttpSession session = httpSessionEvent.getSession();

        number ++;
        System.out.println("一个session创建了。。。。"+"number:"+number);
        System.out.println("现在连接数："+CountUtil.addOnlineTotal());

        myc.addSession(session);
    }

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        HttpSession session = httpSessionEvent.getSession();


        number --;
        System.out.println("一个session销毁了。。。。"+"number:"+number);
        System.out.println("现在连接数："+ CountUtil.subOnlineTotal());
        if(session.getAttribute("loginUserInfo")!=null){
            System.out.println("现在登录人数："+ CountUtil.subLoginTotal());
        }
        myc.delSession(session);
    }

}
