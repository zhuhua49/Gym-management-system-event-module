<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE>

<html>
<head>
	<!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
    
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-zh_CN.min.js"></script>
	
	<script src="https://cdn.bootcss.com/moment.js/2.22.1/moment-with-locales.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
		
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/base.css" />	
	<title>赛事记录详情页</title>
</head>
<body>
	  <div class="center">
	  <s:form action="match_record">
	  
	      <table>
	      <s:iterator value="matchOne" id="One">
	      
	      <tr>
	      <td><label for="ID">赛事编号：</label></td>
	      <td><s:textfield name="match.ID" value="%{#One.ID}" readonly="true" id="ID"/></td>
	      <td><label for="match_name">赛事名称：</label></td>
	      <td><s:textfield name="match.match_name" value="%{#One.match_name}" id="match_name"/></td>
	      <td><label for="applicant">申请人：</label></td>
	      <td><s:textfield name="match.applicant" value="%{#One.applicant}" readonly="true" id="applicant"/></td>
	      </tr>
	      
	      <tr>
	      <td rowspan="2"><label for="match_time">赛事时间：</label></td>
	      <td rowspan="2" style="position:relative"><s:textfield name="match.match_time" value="%{#One.match_time}" id="match_time"/></td>
	      <td rowspan="2"><label for="place">赛事地点：</label></td>
	      <td style="font-size:0.75em">（原地点）<s:property value="#One.match_type"/><s:property value="#One.place"/></td>
	      <td rowspan="2"><label for="reviewer">审核人：</label></td>
	      <td rowspan="2"><s:textfield name="match.reviewer" value="%{#One.reviewer}" readonly="true" id="reviewer"/></td>
	      </tr>
	      
	      <tr>
	      <td>
	      <select name="match.match_type" id='match_type' class="selectpicker" onchange='change_place()'></select>
	      <select name="match.place" id='place' class="selectpicker" multiple title="不修改"></select>
	      </td>
	      </tr>
	      
	      <tr>
	      <td><label for="recorder">记录员：</label></td>
	      <td><s:textfield name="match.recorder" value="%{#session.realname}" readonly="true" id="recorder"/></td>
	      <td><label for="result">赛事结果：</label></td>
		  <td colspan="3"><s:textarea name="match.result" id="result" cols="58" cssStyle="resize:none"/></td>
	      </tr>
	      
	      </s:iterator>
	      </table>
	      <s:submit  value="提交"/>
	      <s:reset  value="重置"/>
	  </s:form>
	  <a href="${pageContext.request.contextPath}/index.jsp">返回主页</a>
	  </div>
</body>
<script src="${pageContext.request.contextPath}/base.js"></script>
<script src="${pageContext.request.contextPath}/match_record/match_record.js"></script>
</html>