<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="easyui-accordion" style="width:158px;height:auto;">
    <div title="管理员账号管理" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
		<c:choose>
		  <c:when test="${empty session_admin}">
		    <p><a href="login.jsp">登录</a></p>
		  </c:when>
		  <c:otherwise>
		    <p><a id="logout" href="admin-logout">退出</a></p>
		  </c:otherwise>
		</c:choose>
	</div>
	<div title="分类管理" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="type-addPre">添加分类</a></p>
		<p><a href="type-findAll">查看分类</a></p>
	</div>
</div>