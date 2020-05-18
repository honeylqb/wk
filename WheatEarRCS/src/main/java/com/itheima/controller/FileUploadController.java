package com.itheima.controller;

import XMSB.WheatEatEcs;
import com.itheima.service.WheatImageService;
import com.itheima.service.impl.UserManageServiceImpl;
import com.itheima.utils.UploadUtils;
import com.itheima.utils.imageUtil;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TryCatchFinally;
import java.io.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

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

    private static  final Logger logger = Logger.getLogger(FileUploadController.class);
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

    @RequestMapping(path = "/wheatImageUploads.do")
    @ResponseBody
    public Map<String,String> wheatImageUploads(@RequestParam("file") MultipartFile[]  uploads, HttpServletRequest request) throws Exception {
        System.out.println("SPingMVC小麦图片批量上传。。。");
        logger.info("[wheatImageUploads]SPingMVC小麦图片批量上传。。。"+uploads.length);
        Map<String,Object> loginUserInfo = ( Map<String,Object>)request.getSession().getAttribute("loginUserInfo");
        //使用fileUplod2组件完成文件上传
        Map<String,String> map=new HashMap<>();
        map.put("code", "0");
        map.put("msg", "上传成功");
        //String path = request.getSession().getServletContext().getRealPath("/");
        String path = "E:/C/uploads";
        System.out.println(path);
        //判断，改路径是否存在
        File file1 = new File("E://C//uploads");


        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }


        for (int i = 0; i < uploads.length; i++) {
            MultipartFile tempFile = uploads[i];

            // 获取文件名
            String fileName = tempFile.getOriginalFilename();
            System.out.println(fileName);
            String getDir = UploadUtils.getDir(fileName);

//            String uuid = UUID.randomUUID().toString().replace("-", "");
//            String uuidFilename = uuid + "_" + fileName;
            String uuidFilename = UploadUtils.getUUIDName(fileName);

            String fileUrl = path  + getDir+"/"+ uuidFilename;
            File newFile = new File(fileUrl);
            // 判断目标文件所在目录是否存在
            if (!newFile.getParentFile().exists()) {
                // 如果目标文件所在的目录不存在，则创建父目录
                newFile.getParentFile().mkdirs();
            }
            // 将内存中的数据写入磁盘
            tempFile.transferTo(newFile);
            // 完整的url

            System.out.println("fileUrl:" + fileUrl);

            //msg = "上传成功";
            //使用压缩工具，压缩为800
            String imageCompressPath = "E:/C/compress" + getDir + "/" + uuidFilename;
            imageUtil.compressImage(fileUrl,imageCompressPath);
            Map<String,Object> tempMap = new HashMap<>();
            //整理图片信息
            tempMap.put("imageName",fileName );
            tempMap.put("imagePath", "/C/uploads" + getDir);
            tempMap.put("uuidName", uuidFilename);
            tempMap.put("wheatType", "1");
            tempMap.put("userId",  loginUserInfo.get("vid"));
            tempMap.put("compressPath", "/C/compress" + getDir);


            wheatImageService.addWheatImage(tempMap);

        }


        return map;
    }

    @RequestMapping(path = "/fileUploadAndWheat.do")
    @ResponseBody
    public Map<String,String> fileUploads(@RequestParam("file") MultipartFile  upload, HttpServletRequest request) throws Exception {
        System.out.println("SPingMVC文件上传--小麦图片上传--");
        //使用fileUplod2组件完成文件上传

       // final String  path = request.getSession().getServletContext().getRealPath("/");
        String path = "E://C//uploads";
        String path2 = "/home/liuqingbin/apache-tomcat-8.0.43/webapps/C/uploads";
        System.out.println(path);
        //判断，改路径是否存在
        File file1 = new File("E://C//uploads");

        //拼接上路径

        String fileName =  upload.getOriginalFilename() ;
        String getDir = UploadUtils.getDir(fileName);
        path = path + getDir;
        System.out.println("SPingMVC文件上传--小麦图片上传到--"+path);
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }


        String uuid = UUID.randomUUID().toString().replace("-", "");
        String  uuidFilename = uuid + "_"+fileName;
        upload.transferTo(new File(path,uuidFilename));


        Map<String,String> map=new HashMap<>();
        map.put("code", "0");
        map.put("msg","上传成功"+path);
        String src = "C/uploads/"+getDir+"/"+uuidFilename;
        String src1 = "C/uploads/"+getDir+"/1_"+uuidFilename;
        String src2 = "C/uploads/"+getDir+"/2_"+uuidFilename;
        String src3 = "C/uploads/"+getDir+"/3_"+uuidFilename;
        String src4 = "C/uploads/"+getDir+"/4_"+uuidFilename;
        String src5 = "C/uploads/"+getDir+"/5_"+uuidFilename;
        String src7 = "C/uploads/"+getDir+"/7_"+uuidFilename;


        Map<String,String> tmap = new HashMap<>();
        tmap.put("src",src);
        tmap.put("src1",src1);
        tmap.put("src2",src2);
        tmap.put("src3",src3);
        tmap.put("src4",src4);
        tmap.put("src5",src5);
        tmap.put("src7",src7);
        request.getSession().setAttribute("wheatImage", tmap );
        //放点坐标
        final String rePath = "E://C//uploads"+getDir+"/";
        final String reFileName = uuidFilename;
        System.out.println("[---]:"+
                rePath+"  "+reFileName);
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {

                System.err.println("--yibuzhixing ---------1------------");
                try {

                    String ss= rePath+"/";

                    String bb= uuidFilename;

                    WheatEatEcs eatEcs = new WheatEatEcs();
                    //eatEcs.XMSB(ss, bb);
                    Object[] result = eatEcs.XMSB(rePath,reFileName);
                    System.err.println("-------------2----------");
//			System.out.println(result[0].toString());
//			System.out.println(result[1].toString());
//			System.out.println(result[2].toString());

                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                    map.put("code", "-1");
                    map.put("msg","shibai ");
                }

                System.err.println("------------3-----------");


            }
        });//异步执行

        thread.start();

        map.put("code", "0");
        map.put("msg","上传成功！图片正在后台分析。。。请稍等");



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
    /**
     *文件压缩下载
     *billname:文件名
     *filename：文件存放路径
     */
    @RequestMapping("/zipfileDownload.do")
    public void zipfileDownload_workerCard(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException{
        //响应头的设置
        response.reset();
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");

        //设置压缩包的名字
        //解决不同浏览器压缩包名字含有中文时乱码的问题
        HttpSession session = request.getSession();

        String billname ="workerCard-"+session.getAttribute("projectWorktypeId");
        String downloadName = billname+".zip";
        //返回客户端浏览器的版本号、类型
        String agent = request.getHeader("USER-AGENT");
        try {
            //针对IE或者以IE为内核的浏览器：
            if (agent.contains("MSIE")||agent.contains("Trident")) {
                downloadName = java.net.URLEncoder.encode(downloadName, "UTF-8");
            } else {
                //非IE浏览器的处理：
                downloadName = new String(downloadName.getBytes("UTF-8"),"ISO-8859-1");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.setHeader("Content-Disposition", "attachment;fileName=\"" + downloadName + "\"");

        //设置压缩流：直接写入response，实现边压缩边下载
        ZipOutputStream zipos = null;
        try {
            zipos = new ZipOutputStream(new BufferedOutputStream(response.getOutputStream()));
            zipos.setMethod(ZipOutputStream.DEFLATED); //设置压缩方法
        } catch (Exception e) {
            e.printStackTrace();
        }

        //循环将文件写入压缩流
        DataOutputStream os = null;

        //worker.setProjectWorktypeId((Integer)session.getAttribute("projectWorktypeId"));
        //从数据库中取出要下载的图片路径、并循环写入压缩

        String src = "E://C//uploads/1.jpg";

        List<String> list  = new ArrayList<>();
        list.add(src);

        for (String filename : list) {

//            String removeStr = "C/uploads";
//            filename = filename.replace(removeStr, "");//去掉相对路径中的两个目录路径
//            String modipath = request.getSession().getServletContext().getRealPath("/C/uploads"+filename);
//            System.out.println("modipath"+modipath);

            File file = new File(filename);
            if(file.exists()){
                try {
                    //添加ZipEntry，并ZipEntry中写入文件流
                    //这里，加上i是防止要下载的文件有重名的导致下载失败
                    zipos.putNextEntry(new ZipEntry(filename));
                    os = new DataOutputStream(zipos);
                    InputStream is = new FileInputStream(file);
                    byte[] b = new byte[100];
                    int length = 0;
                    while((length = is.read(b))!= -1){
                        os.write(b, 0, length);
                    }
                    is.close();
                    zipos.closeEntry();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        //关闭流
        try {
            os.flush();
            os.close();
            zipos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }





}
