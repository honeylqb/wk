package com.itheima.Test;

import com.itheima.domain.Account;
import com.itheima.service.AccountService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.InputStream;
import java.util.List;

/**
 * @Title: TestSping
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/17 0017 10:30
 */
public class TestSpring {
//    @Test
//    public void run1(){
//        //加载配置文件
//        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
//        //获取对象
//        AccountService as = (AccountService) ac.getBean("accountService");
//
//        as.findAll();
//    }
//    @Test
//    public void run2() throws Exception {
//        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
//        //创建SqlsessionFactory对象
//        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
//        //创建SqlSession对象
//        SqlSession sqlSession = factory.openSession();
//        //获取到代理对象
//        AccountDao dao = sqlSession.getMapper(AccountDao.class);
//
//        List<Account> list = dao.findAll();
//        for (Account account :list){
//            System.out.println(account);
//        }
//        sqlSession.close();
//        in.close();
//
//    }
}
