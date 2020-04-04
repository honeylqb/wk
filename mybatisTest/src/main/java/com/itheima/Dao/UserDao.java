package com.itheima.Dao;/*
 * calassName :UserDao
 * package    :com.itheima.Dao
 * @date      :2019/11/28 0028 10:27
 * @Author    :emptyCloud
 */

import com.itheima.domain.User;

import java.util.List;
import java.util.Map;
import java.util.Objects;

public interface UserDao {
    List<User> findAll();

    List<Map<String, Objects>> find();

    int findCount();

    int   saveUser(User user);

    void updateUser(User user);

    void deleteUser(Integer id);

    List<User> likeUser(String username);

}
