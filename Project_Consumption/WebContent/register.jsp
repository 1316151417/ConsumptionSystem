<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>注册</title>
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	  $(function(){
		  $("form").submit(function(){
			  var consumer_name = $.trim($("#consumer_name").val());
			  if(consumer_name == ""){
				  alert("请输入真实姓名！");
				  return false;
			  }
			  if(consumer_name.length < 2 || consumer_name.length > 10){
				  alert("真实姓名长度必须在2到10之间！");
				  return false;
			  }
			  var consumer_username = $.trim($("#consumer_username").val());
			  if(consumer_username == ""){
				  alert("请输入用户名！");
				  return false;
			  }
			  if(consumer_username.length < 5 || consumer_username.length > 20){
				  alert("用户名长度必须在5到20之间！");
				  return false;
			  }
			  var consumer_password = $.trim($("#consumer_password").val());
			  if(consumer_password == ""){
				  alert("请输入密码！");
				  return false;
			  }
			  if(consumer_password.length < 5 || consumer_password.length > 20){
				  alert("密码长度必须在5到20之间！");
				  return false;
			  }
			  var confirm = $.trim($("#confirm").val());
			  if(confirm == ""){
				  alert("请确认密码！");
				  return false;
			  }
			  if(confirm.length < 5 || confirm.length > 20){
				  alert("确认密码长度必须在5到20之间！");
				  return false;
			  }
			  if(consumer_password != confirm){
				  alert("密码与确认密码不相同！");
				  return false;
			  }
			  return true;
		  });
		  $("#consumer_username").blur(function(){
			  var url = "consumer-validateUsername";
			  var args = {"consumer_username":$.trim($(this).val()), "time":new Date()};
			  $.post(url, args, function(data){
				  if(data == "0"){
					  alert("用户名已存在！");
					  $("#consumer_username").focus();
				  }
			  });
		  });
	  });
	</script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="logo" data-options="region:'north'" style="width:1024px;height:168px">
			</div>
			<div data-options="region:'west',split:true" title="系统菜单" style="width:165px;">
				<%@ include file="menu.jsp" %>
			</div>
			<div data-options="region:'center',title:'欢迎使用',iconCls:'icon-ok'" style="height:100%;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">用户注册</h1>
				    <div style="padding:3px;color:red;">
				    ${msg}
				    </div>
				    <form action="consumer-register" method="post">
				      <div style="padding:3px;">
				        <label for="consumer_name">真实姓名：</label>
				        <input id="consumer_name" type="text" name="consumer_name" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,10]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="consumer_username">用户名：</label>
				        <input id="consumer_username" type="text" name="consumer_username" class="easyui-validatebox textbox" data-options="required:true,validType:'length[5,20]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="consumer_password">密码：</label>
				        <input id="consumer_password" type="password" name="consumer_password" class="easyui-validatebox textbox" data-options="required:true,validType:'length[5,20]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="confirm">确认密码：</label>
				        <input id="confirm" type="password" name="confirm" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,10]'"/>
				      </div>
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="注册"/>
				      </div>
				    </form>
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="tail.jsp" %>
				</div>
			</div>
		</div>
  </body>
</html>