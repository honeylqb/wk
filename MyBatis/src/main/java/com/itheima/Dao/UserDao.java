package com.itheima.Dao;/*
 * calassName :UserDao
 * package    :com.itheima.Dao
 * @date      :2019/11/28 0028 10:27
 * @Author    :emptyCloud
 */

import com.itheima.domain.User;

import java.util.List;

public interface UserDao {
    List<User> findAll();
}
