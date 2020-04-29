package com.itheima.controller;

import com.itheima.service.WheatImageService;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.TryCatchFinally;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @Title: FileUploadController
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/15 0015 16:18
 */
@Controller
@RequestMapping(path = "/FileUploadController")
public class FileUploadController {

    @Autowired
    private WheatImageService wheatImageService;
    /**
     * 传统方式
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(path = "/fileUpload1.do")
    public  String fileUpload(HttpServletRequest request) throws Exception {
        System.out.println("文件上传。。。");
        //使用fileUplod组件完成文件上传
        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        //判断，改路径是否存在
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        //解析request
        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
        List<FileItem> items = upload.parseRequest(request);
        for (FileItem item:items){
            if(item.isFormField()){
            //普通表单项
            }else{
                String fileName =  item.getName();
                item.write(new File(path,fileName));
                item.delete();
            }
        }
        return "success";
    }

    @RequestMapping(path = "/fileUpload2.do")
    @ResponseBody
    public Map<String,String> fileUpload2(@RequestParam("file") MultipartFile  upload, HttpServletRequest request) throws Exception {
        System.out.println("SPingMVC文件上传。。。");
        //使用fileUplod2组件完成文件上传

        String path = request.getSession().getServletContext().getRealPath("/");
        String path1 = "E://C//uploads";
        String path2 = "/home/liuqingbin/apache-tomcat-8.0.43/webapps/C/uploads";
        System.out.println(path);
        //判断，改路径是否存在
        File file1 = new File("E://C//uploads");
        if(file1.exists()){
           path = path1;
        }else{
            path = path2;
        }

        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }

        String fileName =  upload.getOriginalFilename() ;
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String  uuidFilename = uuid + "_"+fileName;
        upload.transferTo(new File(path,uuidFilename));


        Map<String,String> map=new HashMap<>();
        map.put("code", "0");
        map.put("msg","上传成功"+path);
        String src = "C/uploads/"+uuidFilename;
        request.getSession().setAttribute("wheatImage", src);
        //放点坐标


        String name =  fileName.substring(0, fileName.indexOf(".")) ;
        System.out.println("分割的名字："+name);
        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
        Map<String,Object> wheatImageMap = new HashMap<>();
        wheatImageMap.put("userId", loginUserInfo.get("vid"));
        wheatImageMap.put("imageName",name);
        wheatImageMap.put("imagePath",src);
        wheatImageMap.put("wheatType","1");
        Object   wheatImageReInfoLog = null;
        Object wheatData = null;
        try {
            wheatData = wheatImageService.readWheatJson(name);
            request.getSession().setAttribute("wheatData", wheatData);
            System.out.println("wheatData"+wheatData.toString());


        }catch (Exception e){
            System.out.println(e.toString());
            map.put("code", "-1");
            map.put("msg","识别失败");
            wheatImageMap.put("isSuccess",1);
            wheatImageReInfoLog = wheatImageService.wheatImageReInfoLog(wheatImageMap);
            return map;
        }
        Map<String,Object> metadataMap = null;
        try {
            metadataMap = ( Map<String,Object>)wheatImageService.readmetadataJson(name);
            request.getSession().setAttribute("metadata", metadataMap);
            System.out.println("metadata"+metadataMap.toString());


            wheatImageMap.put("Ears",metadataMap.get("Ears"));
            wheatImageMap.put("Spikelets",metadataMap.get("Spikelets"));
            wheatImageMap.put("Awns",metadataMap.get("Awns"));
            wheatImageMap.put("isSuccess",0);
            wheatImageReInfoLog = wheatImageService.wheatImageReInfoLog(wheatImageMap);

        }catch (Exception e){
            System.out.println(e.toString());

            map.put("code", "-9999");
            map.put("msg","计数失败");
            wheatImageMap.put("isSuccess",1);
               wheatImageReInfoLog = wheatImageService.wheatImageReInfoLog(wheatImageMap);
            e.printStackTrace();
        }



        return map;
    }


    /**
     * 跨服务器文件上传
     * @return
     */
    @RequestMapping("/fileUpload3")
    public Map<String,String>  fileuoload3(MultipartFile upload) throws Exception {
        System.out.println("跨服务器文件上传...");

        // 定义上传文件服务器路径
        String path = "http://localhost:8090/fileServer/uploads/";

        // 说明上传文件项
        // 获取上传文件的名称
        String filename = upload.getOriginalFilename();
        // 把文件的名称设置唯一值，uuid
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String  uuidFilename = uuid+"_"+filename;

        // 创建客户端的对象
        Client client = Client.create();

        // 和图片服务器进行连接
        WebResource webResource = client.resource(path + uuidFilename);

        // 上传文件
        webResource.put(upload.getBytes());
        Map<String,String> map=new HashMap<>();
        map.put("code", "0");
        map.put("msg","上传成功");

        return map;
    }
//
//    /**
//     * 上传Excel文档
//     * @throws IOException
//     * @throws IllegalStateException
//     */
//    @RequestMapping("/fileUpload4")
//    @ResponseBody
//    public Map<String,String> uploadfile(@RequestParam("file") MultipartFile file, HttpServletRequest request)
//            throws IllegalStateException, IOException {
//        if(null!=file){
//            String fileOrigName=file.getOriginalFilename();// 文件原名称
//            if (!fileOrigName.contains(".")) {
//                throw  new IllegalArgumentException("缺少后缀名");
//            }
//            //获取后缀名
//            fileOrigName = fileOrigName.substring(fileOrigName.lastIndexOf("."));
//            String newfileName =CommonFunction.strAutoInfo() +fileOrigName;
//            //得到上传文件的保存目录 D:\apache-tomcat-8.0.53\webapps\QrCode\
//            String uploadPath=request.getServletContext().getRealPath("");
//            //获取项目名QrCode
//            String projectName=request.getServletContext().getContextPath().substring(1);
//            //将上传文件的保存目录换成 D:\apache-tomcat-8.0.53\webapps/uploadfile\
//            String newdestPath= uploadPath.replaceAll(projectName, "uploadfile")+newfileName;
//            //判断上传文件的目录是否存在
//            File newfile=new File(newdestPath);
//            if(!newfile.exists() && !newfile.isDirectory()){
//                System.out.println(newfile+"目录不存在，需要创建");
//                //创建目录
//                newfile.mkdirs();
//            }
//            file.transferTo(newfile);
//        }
//        Map<String,String> map=new HashMap<String,String>();
//        map.put("code", "0");
//        map.put("msg","上传成功");
//        return map;
//    }
}
