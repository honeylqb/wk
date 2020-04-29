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
public interface WheatImageService {

    public Object findAll(Map<String,Object> map);

    public void saveAccount(Account account);

    //public List<Map<String,Object>> find();

    public Object readWheatJson(String path) throws Exception;
    public Object readmetadataJson(String path) throws Exception;

    public Object wheatImageReInfoLog(Map<String,Object> map) ;


}
