package Utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Title: jsonUtil
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2019/12/26 0026 10:52
 */
public class jsonUtil {
    /**
     * 读取json文件，返回json串
     * @param fileName
     * @return
     */
    public static String readJsonFile(String fileName) {
        String jsonStr = "";
        try {
            File jsonFile = new File(fileName);
            FileReader fileReader = new FileReader(jsonFile);

            Reader reader = new InputStreamReader(new FileInputStream(jsonFile),"utf-8");
            int ch = 0;
            StringBuffer sb = new StringBuffer();
            while ((ch = reader.read()) != -1) {
                sb.append((char) ch);
            }
            fileReader.close();
            reader.close();
            jsonStr = sb.toString();
            return jsonStr;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void main(String[] args) throws  Exception{

        String lu = "E:\\刘清斌\\毕业\\小麦粒\\wheat2017\\wheat2017_0001\\json.txt";
        File file = new File(lu);

        if(!file.exists()){
            file.createNewFile();
        }
        FileOutputStream fos = new FileOutputStream(file);

       // String path = jsonUtil.class.getClassLoader().getResource("test.json").getPath();
        String path = "E:\\刘清斌\\毕业\\小麦粒\\wheat2017\\wheat2017_0017\\wheat2017_0017.json";
        String s = jsonUtil.readJsonFile(path);
        JSONObject jobj = JSON.parseObject(s);
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
        fos.write(li.toString().getBytes());
//                fos.write(map.get("Points").toString().getBytes());
//                fos.write(",".getBytes());
        fos.close();

        System.out.println(data.toString());


//        System.out.println("name"+jobj.get("name"));
//        JSONObject address1 = jobj.getJSONObject("address");
//        String street = (String) address1.get("street");
//        String city = (String) address1.get("city");
//        String country = (String) address1.get("country");
//
//        System.out.println("street :" + street);
//        System.out.println("city :" + city);
//        System.out.println("country :" + country);
//
//        JSONArray links = jobj.getJSONArray("links");
//
//        for (int i = 0 ; i < links.size();i++){
//            JSONObject key1 = (JSONObject)links.get(i);
//            String name = (String)key1.get("name");
//            String url = (String)key1.get("url");
//            System.out.println(name);
//            System.out.println(url);
//        }
    }

}
