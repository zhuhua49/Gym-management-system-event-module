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
	<title>赛事预约</title>
</head>
<body>	  
	  <div class="center">
	  <s:form action="match_apply">
	  
	  <table>
	  
	      <tr>
	      <td><label for="match_name">赛事名字：</label></td>
	      <td><s:textfield name="match.match_name" id="match_name"/></td>
	      <td><label for="applicant">申请人：</label></td>
	      <td><s:textfield name="match.applicant" id="applicant" value="%{#session.realname}" readonly="true"/></td>
	      </tr>
	      
	      <tr>
	      <td><label for="match_time">时间：</label></td>
	      <td style="position:relative"><s:textfield name="match.match_time" id="match_time"/></td>
	      <td><label for="place">地点：</label></td>
	      <td>
	      <select name="match.match_type" id='match_type' class="selectpicker" onchange='change_place()'></select>
	      <select name="match.place" id='place' class="selectpicker" multiple title="请选择"></select>
	      </td>
	      </tr>
	      
	  </table>
	  
	  <s:submit  value="提交"/>
	  <s:reset  value="重置"/>
	  
	  </s:form>
	  <a href="${pageContext.request.contextPath}/index.jsp">返回主页</a>
	  </div> 
</body>

<script src="${pageContext.request.contextPath}/base.js"></script>
<script src="${pageContext.request.contextPath}/match_apply/match_apply.js"></script>

</html>