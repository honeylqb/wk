package com.itheima.service;

import com.itheima.domain.Account;

import java.util.List;
import java.util.Map;

/**
 * @Title: AccountService
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/17 0017 10:02
 */
public interface MenuManageService {

    public Object findAllMenu();

    public Object showMenuTree();

    public Object showNavigation();

  //  public void saveAccount(Account account);

    //public List<Map<String,Object>> find();
}
