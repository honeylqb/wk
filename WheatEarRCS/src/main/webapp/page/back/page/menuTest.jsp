<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>智慧出行</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/src/js/layui/css/layui.css">
</head>
<body>
 <div id="test1"></div>

     
<script src="${pageContext.request.contextPath}/src/js/layui/layui.js" charset="utf-8"></script>
 
<script>
	layui.use(['jquery','table','layer','form','tree'], function(){
	  var table = layui.table;
	  var $     = layui.jquery;
	  var layer = layui.layer; 
	  var form  = layui.form; 
	  var tree = layui.tree;
	  //渲染
	  var list =[{
	        title: '江西' //一级菜单
		        ,children: [{
		          title: '南昌' //二级菜单
		          ,children: [{
		            title: '高新区' //三级菜单
		            //…… //以此类推，可无限层级
		          }]
		        }]
		      },{
		        title: '陕西' //一级菜单
		        ,children: [{
		          title: '西安' //二级菜单
		        }]
		      },{
			        title: '陕西' //一级菜单
				        ,children: [{
				          title: '西安' //二级菜单
				        }]
				      }];
	  var Tree = function(data){
		    var inst1 = tree.render({
			      elem: '#test1'  //绑定元素
			      ,data: data
			      ,id: 'demoId' //定义索引
			      ,showCheckbox:true	//是否显示复选框
			      ,accordion:false		//是否开启手风琴模式
			      ,onlyIconControl:false	//是否仅允许节点左侧图标控制展开收缩。
			      ,isJump:false		//是否允许点击节点时弹出新窗口跳转
			      ,showLine:true	//是否开启连接线。默认 true，若设为 false，则节点左侧出现三角图标。
			      ,click: function(obj){
			    	    console.log(obj.data); //得到当前点击的节点数据
			    	    console.log(obj.state); //得到当前节点的展开状态：open、close、normal
			    	    console.log(obj.elem); //得到当前节点元素
			    	    
			    	    console.log(obj.data.children); //当前节点下是否有子节点
			    	  }
				    ,oncheck: function(obj){
				        console.log(obj.data); //得到当前点击的节点数据
				        console.log(obj.checked); //得到当前节点的展开状态：open、close、normal
				        console.log(obj.elem); //得到当前节点元素
				      } 
			    });	

	  }

	  
	    $.ajax({
            url:'${pageContext.request.contextPath}/MenuManageController/findMenuTree.do',
            data:JSON.stringify({"userAccount":$("#username").val(),"userPassword":$("#password").val()}),
            type:"post",
            dataType:"json",
            contentType: "application/json; charset=utf-8",
            success:function(data){
            
            	//console.log(data.data);
    			if(data.code == 0){
    				Tree(data.data);
    		
    			}
    			 //layer.msg(data.msg);
    			 
            }
        });
	    
/* 	  //获得选中的节点
	    var checkData = tree.getChecked('demoId');
		  console.log("-------------------------------------");
		  console.log(checkData);
 */
	    
	});//end of use
</script>

</body>
</html>