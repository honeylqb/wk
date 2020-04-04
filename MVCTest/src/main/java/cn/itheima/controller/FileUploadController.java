package cn.itheima.controller;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
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
    /**
     * 传统方式
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(path = "/fileUpload1")
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
    @RequestMapping(path = "/fileUpload2")
    public String fileUpload2(HttpServletRequest request , MultipartFile upload) throws Exception {
        System.out.println("SPingMVC文件上传。。。");
        //使用fileUplod2组件完成文件上传

        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        path = "E:\\C\\uploads";
        System.out.println(path);
        //判断，改路径是否存在
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }

        String fileName =  upload.getOriginalFilename() ;
        String uuid = UUID.randomUUID().toString().replace("-", "");
        fileName = uuid + "_"+fileName;
        upload.transferTo(new File(path,fileName));



        return "success";
    }


    /**
     * 跨服务器文件上传
     * @return
     */
    @RequestMapping("/fileUpload3")
    public String fileuoload3(MultipartFile upload) throws Exception {
        System.out.println("跨服务器文件上传...");

        // 定义上传文件服务器路径
        String path = "http://localhost:8090/fileServer/uploads/";

        // 说明上传文件项
        // 获取上传文件的名称
        String filename = upload.getOriginalFilename();
        // 把文件的名称设置唯一值，uuid
        String uuid = UUID.randomUUID().toString().replace("-", "");
        filename = uuid+"_"+filename;

        // 创建客户端的对象
        Client client = Client.create();

        // 和图片服务器进行连接
        WebResource webResource = client.resource(path + filename);

        // 上传文件
        webResource.put(upload.getBytes());

        return "success";
    }
}
