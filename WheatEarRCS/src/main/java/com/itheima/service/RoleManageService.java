package com.itheima.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Title: AccountService
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/17 0017 10:02
 */
public interface RoleManageService {

    public Object findAll(Map<String,Object> map);


    public Object addRole(Map<String,Object> map);


    public Set<String> findRoleMenuById(Map<String,Object> map);

    public Object updateRole(Map<String,Object> map);

    public List<Map<String,Object>> findRoleInfo(Map<String,Object> map);

  //  public void saveAccount(Account account);

    //public List<Map<String,Object>> find();
}
