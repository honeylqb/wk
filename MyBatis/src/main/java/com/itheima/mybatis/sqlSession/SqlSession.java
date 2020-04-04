package com.itheima.mybatis.sqlSession;

/**
 * @Title: SqlSession
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/3 0003 15:49
 */
public interface SqlSession {
    /**
     * 根据参数创建一个代理对象
     * @param daoInterfaceClass
     * @param <T>
     * @return
     */
    <T> T getMapper(Class<T> daoInterfaceClass);

    void close();
}
