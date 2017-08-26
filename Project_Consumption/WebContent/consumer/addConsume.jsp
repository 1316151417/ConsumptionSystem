<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>添加消费记录</title>
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">

 	  $(function(){
		  $("form").submit(function(){
			  var consumer_id = $.trim($("#consumer_id").val());
			  if(consumer_id == ""){
				  alert("请登录后再进行操作！");
				  return false;
			  }
			  var consume_name = $.trim($("#consume_name").val());
			  if(consume_name == ""){
				  alert("请输入消费名称！");
				  return false;
			  }
			  if(consume_name.length < 2 || consume_name.length > 10){
				  alert("消费名称长度必须在2到10之间！");
				  return false;
			  }
			  var consume_price = $.trim($("#consume_price").val());
			  if(consume_price == ""){
				  alert("请输入消费金额！");
				  return false;
			  }
			  if(consume_price.length > 5){
				  alert("消费金额过大！");
				  return false;
			  }
			  var type_id = $.trim($("#type_id").val());
			  if(type_id == 0){
				  alert("请选择消费类型！");
				  return false;
			  }
			  
			  /* if($("#consume_date").datebox("getValue") == ""){
				  alert("请输入消费日期！");
				  return false;
			  } */
			  
			  var consume_place = $.trim($("#consume_place").val());
			  if(consume_place == ""){
				  alert("请输入消费地点！");
				  return false;
			  }
			  if(consume_place.length < 2 || consume_place.length > 20){
				  alert("消费地点长度必须在2到20之间！");
				  return false;
			  }
			  return true;
		  });
	  });
	</script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="logo" data-options="region:'north'" style="width:1024px;height:168px">
			</div>
			<div data-options="region:'west',split:true" title="系统菜单" style="width:165px;">
				<%@ include file="../menu.jsp" %>
			</div>
			<div data-options="region:'center',title:'欢迎使用',iconCls:'icon-ok'" style="height:100%;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加消费记录</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="consume-add" method="post">
				      <div style="padding:3px;">
				        <label for="consume_name">消费名称：</label>
				        <input id="consume_name" type="text" name="consume_name" value="${consume.consume_name}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,10]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="consume_price">消费金额：</label>
				        <input id="consume_price" type="text" name="consume_price" value="${consume.consume_price}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="type.type_id">消费类型：</label>
				        <select id="type_id" class="easyui-validatebox textbox" name="type.type_id" style="width:180px;">
				          <option value="0">---请选择消费类型---</option>
				          <c:forEach items="${types}" var="type">
				            <option value="${type.type_id}">${type.type_name}</option>
				          </c:forEach>
				        </select>
				      </div>
				      
				      <input type="hidden" id="consumer_id" name="consumer.consumer_id" value="${sessionScope.session_consumer.consumer_id}"/>
				      
				      <div style="padding:3px;">
				        <label for="consume_date">消费日期：</label>
				        <input id="consume_date" class="easyui-datebox" type="text" name="consume_date" value="${consume.consume_date}" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="consume_place">消费地点：</label>
				        <input id="consume_place" type="text" name="consume_place" value="${consume.consume_place}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,20]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="consume_remark">消费备注：</label>
				        <input id="consume_remark" type="text" name="consume_remark" value="${consume.consume_remark}" class="easyui-validatebox textbox"/>
				      </div>
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="录入"/>
				      </div>
				    </form>
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>
		</div>
  </body>
</html>