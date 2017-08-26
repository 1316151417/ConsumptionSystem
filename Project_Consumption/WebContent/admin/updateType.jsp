<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>消息</title>
	<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
 	<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
 	<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	  $(function(){
		  $("form").submit(function(){
			  var type_name = $.trim($("#type_name").val());
			  if(type_name == ""){
				  alert("请输入分类名称！");
				  return false;
			  }
			  if(type_name.length < 2 || type_name.length > 10){
				  alert("分类名称必须在2到10之间！");
				  return false;
			  }
			  return true;
		  });
	  });
	</script>
  </head>  
  <body>  
		<div id="container" class="easyui-layout" style="width:1024px;height:680px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="logo" data-options="region:'north'" style="width:1024px;height:168px">
			</div>
			<div data-options="region:'west',split:true" title="系统菜单" style="width:165px;">
				<%@ include file="menu.jsp" %>
			</div>
			<div data-options="region:'center',title:'欢迎使用',iconCls:'icon-ok'" style="height:100%;">
				<div id="mainbody">
				  <center>
				    <h1 style="color:skyblue;">修改分类</h1>
				    <form action="type-update" method="post">
				      <input type="hidden" name="type_id" value="${type.type_id}"/>
				      <div style="padding:3px;">
				        <label for="type_name">分类名称：</label>
				        <input id="type_name" type="text" name="type_name" value="${type.type_name}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,10]'"/>
				      </div>
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="修改"/>
				      </div>
				    </form>
				  </center>
				</div>	
			</div>
		</div>
  </body>
</html>