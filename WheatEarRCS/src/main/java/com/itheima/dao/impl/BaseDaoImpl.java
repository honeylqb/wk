package com.itheima.dao.impl;

import com.itheima.dao.BaseDao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Title: BaseDaoImpl
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/3/7 0007 20:32
 */
public class BaseDaoImpl implements BaseDao {
    @Autowired
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public SqlSession getSqlSession() {
        return sqlSession;
    }

    @Override
    public List<Map<String,Object>> queryForList(String sqlId, Map<String, Object> params) {
              List<Map<String,Object>> list =  getSqlSession().selectList(sqlId,params);
        return list;
    }

    @Override
    public Object queryForObject(String sqlId, Map<String, Object> params) {
        return getSqlSession().selectOne(sqlId, params);
    }

    @Override
    public int getTotalCount(String sqlId, Map<String, Object> params) {
        return (Integer) getSqlSession().selectOne(sqlId,params);
    }

    @Override
    public int update(String sqlId,  Object object) {
        return getSqlSession().update(sqlId,object);
    }

    @Override
    public int insert(String sqlId,  Object object) {
        return getSqlSession().insert(sqlId,object);
    }

    @Override
    public int delete(String sqlId, Map<String, Object> params) {
        return getSqlSession().delete(sqlId,params);
    }
}

                                        