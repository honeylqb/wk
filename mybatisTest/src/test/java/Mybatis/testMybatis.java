package Mybatis;/*
 * calassName :testMybatis
 * package    :Mybatis
 * @date      :2019/11/30 0030 20:23
 * @Author    :emptyCloud
 */





import com.itheima.Dao.UserDao;
import com.itheima.domain.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

public class testMybatis {
    private InputStream in;
    private SqlSession sqlSession;
    private UserDao userDao;


    @Before
    public void init() throws Exception{
        in = Resources.getResourceAsStream("SqlMapConfig.xml");
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory factory = builder.build(in);
        sqlSession = factory.openSession();
        userDao = sqlSession.getMapper(UserDao.class);
    }
    @After
    public void destroy() throws Exception{
        sqlSession.commit();
        sqlSession.close();
        in.close();
    }
    @Test
   public void testFindAll() throws Exception{

      //  List<User> list = userDao.findAll();
        List<User> list = userDao.likeUser("小");
        for(User user:list){
            System.out.println(user);
        }
        int count = userDao.findCount();

   }
   @Test
   public void testSave() throws  Exception{
        User user = new User();
       user.setUsername("⑥的暗示");
       user.setAddress("addres收到收到撒s");
       user.setBirthday(new Date());
       user.setSex("男");

      int temp =  userDao.saveUser(user);
        System.out.println(temp);

   }
   @Test
   public void testDelete() throws  Exception{
        userDao.deleteUser(51);
   }
   @Test
   public void testUpdate(){
       User user = new User();
       user.setId(50);
       user.setUsername("刘");
       user.setAddress("成");
       user.setBirthday(new Date());
       user.setSex("男");
        userDao.updateUser(user);
   }
   public static void main(String args[]) throws IOException {
        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        userDao.findAll();

   }
}
