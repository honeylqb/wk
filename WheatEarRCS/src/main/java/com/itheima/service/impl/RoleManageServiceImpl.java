package com.itheima.service.impl;

import com.itheima.dao.BaseDao;
import com.itheima.service.MenuManageService;
import com.itheima.service.RoleManageService;
import com.itheima.utils.LayuiResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Title: AccountServiceImpl
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/17 0017 10:03
 */
@Service("roleManageService")
public class RoleManageServiceImpl implements RoleManageService {

    @Autowired
    private BaseDao baseDao;

    @Override
    public Object findAll(Map<String,Object> map) {
        System.out.println("业务层。。RoleManageServiceImpl.findAll");
        List<Map<String,Object>> list = baseDao.queryForList("RoleManageInfo.findAll",map);
        int count = baseDao.getTotalCount("RoleManageInfo.count",map);
        return  LayuiResult.ok(count, list);
    }


}
