package com.itheima.dao;

import com.itheima.domain.Account;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Title: MenuManageDao
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/17 0017 10:01
 */
@Repository
public interface MenuManageDao {


    public List<Map<String,Object>> findAllMenu();


}
