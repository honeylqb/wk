package com.itheima.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.itheima.dao.WheatImageDao;
import com.itheima.domain.Account;
import com.itheima.service.WheatImageService;

import com.itheima.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
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
@Service("wheatImageService")
public class WheatImageServiceImpl implements WheatImageService {
    @Autowired
    private WheatImageDao wheatImageDao;
    @Override
    public List<Map<String,Object>> findAll() {
        System.out.println("业务层。。WheatImageServiceImpl.findAll");
        return wheatImageDao.findAll();
    }

    @Override
    public void saveAccount(Account account) {

        System.out.println("业务层。。WheatImageServiceImpl.saveAccount");
        wheatImageDao.saveAccount(account);
    }

    @Override
    public Object readWheatJson(String path) throws Exception{
        // Map<String, Object> resultMap = HashMap<String,Object>();
         //path = "E:\\刘清斌\\毕业\\小麦粒\\wheat2017\\wheat2017_0017\\wheat2017_0017.json";
        String name = path;
        path = "E:\\C\\wheat2017\\"+path+"\\"+path+".json";

        String wheatJson = JsonUtils.readJsonFile(path);


        JSONObject jobj = JSON.parseObject(wheatJson);
        System.out.println(jobj.toString());
        List<Map<String,List<String>>> data = (List) jobj.get("data");
        List<List<Double>> li = new ArrayList();
        for (Map map :data){
            System.out.println(map.toString());
            if(map.containsKey("Points")&&map.get("Type").equals("Point")){
                System.out.println(map.get("Points").toString());
                List<String> list = (List)map.get("Points");

                for(String str :list){
                    System.out.println(str);
                    List<Double> dTempList = new ArrayList<Double>();
                    String[] ss = str.split(",");
                    for (int i = 0;i<ss.length ;i++){
                        String tempStr = ss[i];
                        if(i!=0){
                            tempStr = "-"+tempStr;
                        }
                        //fos.write(ss[i].getBytes());
                        Double d =  Double.parseDouble(tempStr);
//                        if(i==0){
//                           d = d-600.0;
//                        }
                        dTempList.add(d);

                    }
                    li.add(dTempList);
                }


            }

        }
        System.out.println("--------------------");
        System.out.println("li:"+li.toString());

        path = "E:\\C\\wheat2017\\"+name+"\\metadata.json";

        String metadataJson = JsonUtils.readJsonFile(path);
        JSONObject jobj2 = JSON.parseObject(metadataJson);
        System.out.println(jobj2.toString());
        Map<String,Object> map = new HashMap<>();

            String Ears = (String) jobj.get("Ears");
            map.put("Ears",Ears);


            String Spikelets = (String) jobj.get("Spikelets");

            map.put("Spikelets",Spikelets);

        if(jobj2.containsKey("Awns")){
            String Awns = (String) jobj.get("Awns");
            map.put("Awns",Awns);
        }

        Map<String,Object> resultmap = new HashMap<>();

        resultmap.put("Data", li);
        resultmap.put("metadata",map);


        return li;
    }

    @Override
    public Object readmetadataJson(String path) throws Exception{

        path = "E:\\C\\wheat2017\\"+path+"\\metadata.json";

        String metadataJson = JsonUtils.readJsonFile(path);
        JSONObject jobj2 = JSON.parseObject(metadataJson);
        System.out.println(jobj2.toString());
        Map<String,Object> map = new HashMap<>();

        map.put("Ears",jobj2.get("Ears"));
        map.put("Spikelets",jobj2.get("Spikelets"));

        if(jobj2.containsKey("Awns")){
            map.put("Awns",jobj2.get("Awns"));
        }


        return map;
    }


}
