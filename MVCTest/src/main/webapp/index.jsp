<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/30 0030
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery.min.js" ></script>
    <script>
        $(function(){
            alert();
            $("#btn").click(function(){
               alert("btn - function");
               $.ajax({
                   //json 格式
                   url:"HelloController/ajax",
                   contentType:"application/json;charset=UTF-8",
                   data:'{"userName":"hehe","password":"123"}',
                   dataType:"json",
                   type:"post",
                   success:function(data){
                       //data 服务器相应的数据
                       console.log(data);
                   }
               });

            });
        });
    </script>
</head>
<body>
<h3> 入门</h3>
<a href="HelloController/sayHello" > 跳转</a>
<form action="HelloController/form" method="post">
    姓名：<input type="text" name="user.userName"><br/>
    密码：<input type="text" name="user.passWord"><br/>
    钱：<input type="text" name="money">
    <input type="submit" value="提交" >
    <input type="reset" value="重置">
</form>

<button id="btn">AJAX请求</button>

<h3>文件上传</h3>
<form action="FileUploadController/fileUpload2" method="post" enctype="multipart/form-data">
    选择文件：<input type="file" name="upload"><br/>
    <input type="submit" value="上传"/>
</form>
<hr/>
<h3>异常处理</h3>
<a href="Test/textException">异常处理</a>
</body>
</html>
