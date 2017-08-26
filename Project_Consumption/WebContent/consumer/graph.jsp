<%@page import="swust.model.Graph"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图表信息</title>
<link href="css/style.css" rel="stylesheet">

<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/echarts/echarts-all.js"></script>
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
<%
List<Graph> graphs = (List<Graph>) request.getAttribute("graphs");
String types = "[";
String totals = "[";
for(Graph graph : graphs){
	types = types + "'" + graph.getType_name() + "',";
	totals = totals + graph.getTotal()  + ",";
}
types = types.substring(0, types.length()-1) + "]";
totals = totals.substring(0, totals.length()-1) + "]";
%>
	$(document).ready(function(){
		 var barChart1 = echarts.init(document.getElementById("echarts-bar-chart1"));
		    var baroption = {
		        title : {
		            text: '消费情况'
		        },
		        tooltip : {
		            trigger: 'axis'
		        },
		        legend: {
		            data:['消费金额']
		        },
		        calculable : true,
		        xAxis : [
		            {
		                type : 'category',
		                data : <%=types%>
		            }
		        ],
		        yAxis : [
		            {
		                type : 'value'
		            }
		        ],
		        series : [
		            {
		                name:'金额',
		                type:'bar',
		                data:<%=totals%>,
		                markPoint : {
		                    data : [
		                        {type : 'max', name: '最大值'},
		                        {type : 'min', name: '最小值'}
		                    ]
		                },
		                markLine : {
		                    data : [
		                        {type : 'average', name: '平均值'}
		                    ]
		                }
		            }
		        ]
		    };
		    barChart1.setOption(baroption);
		});
</script>
<style type="text/css">
  body{
    background:white;
  }
</style>
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
			    <div class="row">
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>统计消费情况</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                        <i class="fa fa-wrench"></i>
                                    </a>                              
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <div class="echarts" id="echarts-bar-chart1"></div>
                            </div>
                        </div>
                    </div>
                </div>
			</center>
		</div>
		<div id="tailbody" style="height:3%">
			<%@ include file="../tail.jsp" %>
		</div>
	</div>
</div>
</body>
</html>