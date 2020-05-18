<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>穗粒识别</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/lib/jq-module/zyupload/zyupload-1.0.0.min.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/layui/layuimini/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
    <fieldset class="layui-elem-field layuimini-search">
        <legend>穗粒识别-上传图片</legend>
    <div class="layuimini-main">
        <div id="zyupload" class="zyupload"></div>

    </div>
    </fieldset>
    </div>
</div>
<%--<jsp:include page="../main/footer.jsp"></jsp:include>--%>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/layui-v2.5.4/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/src/layui/layuimini/lib/jq-module/zyupload/zyupload-1.0.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/src/layui/X-admin/js/xadmin.js"></script>
<script type="text/javascript">
    layui.use('layer', function () { //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句


         $(".upload_btn").click(function () {
             alert("0000000000000");
         })




   var tav = function () {
        parent.xadmin.open('在tab打开','${pageContext.request.contextPath}/page/home/imageManage/shibieResult.jsp')

    };

    $(function () {
        // 初始化插件
        $("#zyupload").zyUpload({
            width: "650px",                 // 宽度
            height: "400px",                 // 宽度
            itemWidth: "140px",                 // 文件项的宽度
            itemHeight: "115px",                 // 文件项的高度
            url: "${pageContext.request.contextPath}/FileUploadController/wheatImageUploads.do",  // 上传文件的路径
            fileType: ["jpg", "png"],// 上传文件的类型
            fileSize: 51200000,                // 上传文件的大小
            multiple: false,                    // 是否可以多个文件上传
            dragDrop: true,                    // 是否可以拖动上传文件
            tailor: true,                    // 是否可以裁剪图片
            del: true,                    // 是否可以删除文件
            finishDel: true,  				  // 是否在上传文件完成后删除预览

            /* 外部获得的回调接口 */
            onSelect: function (selectFiles, allFiles) {    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
                console.info("当前选择了以下文件：");
                console.info(selectFiles);
            },
            onDelete: function (file, files) {              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
                console.info("当前删除了此文件：");
                console.info(file.name);
            },
            onSuccess: function (file, response) {          // 文件上传成功的回调方法
                console.info("此文件上传成功：");
                console.info(file.name);
                console.info("此文件上传到服务器地址：");
                console.info(response);
                //加载层-默认风格
               // layer.load();
                var data = eval('('+response+')');
               // alert(data);
                //alert(data.code);
                if(data.code == '0'){

                    //此处演示关闭

                    //layer.closeAll('loading');
                    layer.msg(data.msg);
                    //tav();


                }else{

                        layer.msg('无法识别该图，请换一张图片试试！');




                }

                setTimeout(function(){
                    $("#uploadInf").append("<p>上传成功，文件地址是：" + response + "</p>");
                }, 6000);

            },
            onFailure: function (file, response) {          // 文件上传失败的回调方法
                console.info("此文件上传失败：");
                console.info(file.name);
            },
            onComplete: function (response) {           	  // 上传完成的回调方法
                console.info("---------------------文件上传完成--------");
                console.info(response);


               // alert("cehgnogn");
            }
        });

    });

    });
</script>

</body>
</html>