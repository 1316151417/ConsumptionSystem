<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>登录</title>
	<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
 	<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
 	<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	  $(function(){
		  $("form").submit(function(){
			  var admin_username = $.trim($("#admin_username").val());
			  if(admin_username == ""){
				  alert("请输入用户名！");
				  return false;
			  }
			  if(admin_username.length < 5 || admin_username.length > 20){
				  alert("用户名长度必须在5到20之间！");
				  return false;
			  }
			  var admin_password = $.trim($("#admin_password").val());
			  if(admin_password == ""){
				  alert("请输入密码！");
				  return false;
			  }
			  if(admin_password.length < 5 || admin_password.length > 20){
				  alert("密码长度必须在5到20之间！");
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
				    <h1 style="color:skyblue;">管理员登录</h1>
				    <div style="padding:3px;color:red;">
				    ${msg}
				    </div>
				    <form action="admin-login" method="post">
				      <div style="padding:3px;">
				        <label for="admin_username">用户名：</label>
				        <input id="admin_username" type="text" name="admin_username" class="easyui-validatebox textbox" data-options="required:true,validType:'length[5,20]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="admin_password">密码：</label>
				        <input id="admin_password" type="password" name="admin_password" class="easyui-validatebox textbox" data-options="required:true,validType:'length[5,20]'"/>
				      </div>
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="登录"/>
				      </div>
				    </form>
				  </center>
				</div>	
			</div>
		</div>
  </body>
</html>