package com.itheima.mybatis.cfg;

/**
 * @Title: Mapper
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/3 0003 16:04
 * 用于封装执行的sql语句和结果类型的sql的全限定类名
 */
public class Mapper {
    private  String queryString;
    private  String resultType;

    public String getQueryString() {
        return queryString;
    }

    public void setQueryString(String queryString) {
        this.queryString = queryString;
    }

    public String getResultType() {
        return resultType;
    }

    public void setResultType(String resultType) {
        this.resultType = resultType;
    }
}
