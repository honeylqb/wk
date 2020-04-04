package com.itheima.Dao.Impl;
/*
 * calassName :UserDaoImpl
 * package    :com.itheima.Dao.Impl
 * @date      :2019/11/28 0028 10:28
 * @Author    :emptyCloud
 */

import com.itheima.Dao.UserDao;
import com.itheima.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class UserDaoImpl implements UserDao {
    private SqlSessionFactory factory;

    public UserDaoImpl(SqlSessionFactory factory) {
        this.factory = factory;
    }

    public List<User> findAll() {
        //1.使用工厂创建SqlSession对象
        SqlSession session = factory.openSession();
        //2.使用session执行查询所有方法
        List<User> users = session.selectList("com.itheima.dao.UserDao.findAll");
        session.close();
        //3.返回查询结果
        
        return users;
    }
}
