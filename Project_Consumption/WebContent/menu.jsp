<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript">
  $(function(){
	  $("#logout").click(function(){
		  if(!confirm("确认退出吗？")){
			  return false;
		  }
	  });
  });
</script>
<style type="text/css">
  a{
    text-decoration:none;
    color:blue;
  }
  a:hover{
    background:skyblue;
  }
</style>
</head>
<body>
<div class="easyui-accordion" style="width:158px;height:auto;">
	<div title="个人账号管理" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
		<c:choose>
		  <c:when test="${empty session_consumer}">
		    <p><a href="login.jsp">登录</a></p>
		    <p><a href="register.jsp">注册</a></p>
		  </c:when>
		  <c:otherwise>
		    <p><a href="consumer-change">修改密码</a></p>
		    <p><a id="logout" href="consumer-logout">退出账号</a></p>
		  </c:otherwise>
		</c:choose>
	</div>
	<div title="个人消费记录管理" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="consume-addPre">添加消费记录</a></p>
	    <p><a href="consume-findAll">查看消费记录</a></p>
	    <p><a href="consume-export">导出消费账单</a></p>
	    <p><a href="consume-graph">统计消费情况</a></p>
	</div>
</div>
</body>
</html>