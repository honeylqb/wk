package com.itheima.service;

import com.itheima.domain.Account;

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
public interface UserManageService {

    public Object findAll(Map<String,Object> map);

    public List<Map<String,Object>> findUserByPassword(Map<String,Object> map) throws Exception;

    public Object updateState(Map<String,Object> map);

    public Object userRigister(Map<String,Object> map);

    public Object reSetPassword(Map<String,Object> map);

    public Object addloginLog(Map<String,Object> map);
    public Object findUserLoginLog(Map<String,Object> map);

    public Object addUser(Map<String,Object> map);

    public Set<String> findUserRoleById(Map<String,Object> map);
    public Object updateUser(Map<String,Object> map);
    public Object updateUserInfo(Map<String,Object> map);



}
