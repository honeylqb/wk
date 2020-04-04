package com.itheima.dao;

import java.util.List;
import java.util.Map;

/**
 * @Title: BaseDao
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/3/7 0007 20:27
 */
public interface BaseDao {

    /**
     * 查找list
     * @param sqlId
     * @param params
     * @return
     */
    public  List<Map<String,Object>> queryForList(String sqlId, Map<String,Object> params);


    public Object queryForObject(String sqlId, Map<String,Object> params);

    public int getTotalCount(String sqlId, Map<String,Object> params);

    public int update(String sqlId,  Object object);

    public int insert(String sqlId, Object object);

    public int delete(String sqlId, Map<String,Object> params);



}
