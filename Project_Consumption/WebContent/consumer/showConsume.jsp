<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>个人消费记录系统</title>
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
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
				    <h1 style="color:skyblue;">消费记录列表</h1>
				    <table border="0" class="gridtable">
				      <tr>
				        <th width="50" height="20">序号：</th>
				        <th width="50" height="20">消费名称：</th>
				        <th width="80" height="20">消费金额：</th>
				        <th width="80" height="20">消费类型：</th>
				        <th width="80" height="20">消费者：</th>
				        <th width="80" height="20">消费日期：</th>
				        <th width="80" height="20">消费地点：</th>
				        <th width="80" height="20">消费备注：</th>
				        <th width="80" height="20">操作：</th>
				      </tr>
				      
				      <c:forEach items="${pb.beanList}" var="consume">
				        <tr>
				          <td width="50" height="20">${consume.consume_id}</td>
				          <td width="50" height="20">${consume.consume_name}</td>
				          <td width="50" height="20">${consume.consume_price}</td>
				          <td width="50" height="20">${consume.type.type_name}</td>
				          <td width="50" height="20">${consume.consumer.consumer_name}</td>
				          <%-- <td width="50" height="20">${consume.consume_date}</td> --%>
				          <td width="50" height="20"><fmt:formatDate value="${consume.consume_date}"/></td>
				          <td width="50" height="20">${consume.consume_place}</td>
				          <td width="50" height="20">${consume.consume_remark}</td>
				          <td width="50" height="20">
				            <a href="consume-updatePre?consume_id=${consume.consume_id}">修改</a>
				            <a href="consume-delete?consume_id=${consume.consume_id}">删除</a>
				          </td>
				        </tr>
				      </c:forEach>
				    </table>
				    <br><br><br>
                    <center>
                      <label>第${pb.currentPage}页/共${pb.totalPage}页</label>
                      <a href="${pb.url}?currentPage=1">首页</a>
                      <c:if test="${pb.currentPage>1}">
                      <a href="${pb.url}?currentPage=${pb.currentPage-1}">上一页</a>
                      </c:if>
                      <c:choose>
                        <c:when test="${pb.totalPage<=10}">
                          <c:set var="begin" value="1"/>
                          <c:set var="end" value="${pb.totalPage}"/>
                        </c:when>
                        <c:otherwise>
                          <c:set var="begin" value="${pb.currentPage-5}"/>
                          <c:set var="end" value="${pb.currentPage+4}"/>
                         <c:if test="${begin<1}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="10"/>
                          </c:if>
                          <c:if test="${end>pb.totalPage}">
                            <c:set var="begin" value="${pb.totalPage-9}"/>
                            <c:set var="end" value="${pb.totalPage}"/>
                          </c:if>
                        </c:otherwise>
                      </c:choose>
                      <c:forEach var="i" begin="${begin}" end="${end}">
                        <c:choose>
                          <c:when test="${i eq pb.currentPage}">
                            <label>[${i}]</label>
                          </c:when>
                          <c:otherwise>
                            <a href="${pb.url}?currentPage=${i}">[${i}]</a>
                          </c:otherwise>
                        </c:choose>
                      </c:forEach>
                      <c:if test="${pb.currentPage<pb.totalPage}">
                      <a href="${pb.url}?currentPage=${pb.currentPage+1}">下一页</a>
                      </c:if>
                      <a href="${pb.url}?currentPage=${pb.totalPage}">尾页</a>
                    </center>
				    <table>
				      <tr>
				          <td width="600" height="20"></td>
				          <td width="100" height="20">消费汇总：</td>
				          <td width="100" height="20">${total}元</td>
				        </tr>
				    </table>
				    ${warning}
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>
		</div>
  </body>
</html>