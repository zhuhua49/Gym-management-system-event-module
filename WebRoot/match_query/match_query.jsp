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
	<title>赛事查询</title>
</head>
<body>
	  <div class="center">
	  <s:form action="match_querySee" name="match_querySee">
	  
	  <style> 
	  .area br{display:none}   
	  </style>
	  <s:set name="area" 
	  value="#{'不选择':{'不选择'},
	           '羽毛球':{'不选择','1号场','2号场','3号场','4号场','5号场','6号场','7号场','8号场','9号场','10号场'}, 
               '乒乓球':{'不选择','1号台','2号台','3号台','4号台','5号台','6号台','7号台','8号台','9号台','10号台'},
               '台球':{'不选择','1号台','2号台','3号台','4号台','5号台','6号台','7号台','8号台','9号台','10号台'},
	           '网球':{'不选择','1号场','2号场','3号场','4号场','5号场','6号场','7号场','8号场','9号场','10号场'} 
               }" /> 
	  
	  <table>
	  	  
	      <tr>
	      <td><label>赛事时间：</label></td>
	      <td style="position:relative"><s:textfield name="match.timeA" id="timeA"/>至<s:textfield name="match.timeB" id="timeB"/></td>
	      </tr>
	      
	      <tr>
	      <td><label for="place">赛事地点：</label></td>
	      <td><div class="area">
	      <s:doubleselect list="#area.keySet()" name="match.match_type" doubleName="match.place" doubleList="#area[top]" id="place" />
	      </div></td>
	      </tr>
	      
	      <tr>
	      <td><label for="state">赛事状态：</label></td>
	      <td><s:select name="match.state" list="{'待审核','已通过','未通过','已结束'}" headerKey="不选择"  headerValue="不选择" id="state" cssStyle="width:349px"/></td>
	      </tr>
	      
	  </table>
	  
	  <s:submit  value="查询"/>
	  <s:reset  value="重置"/>
	  
	  </s:form>
	  <a href="${pageContext.request.contextPath}/index.jsp">返回主页</a>
	  </div>
</body>
<script src="${pageContext.request.contextPath}/base.js"></script>
<script src="${pageContext.request.contextPath}/match_query/match_query.js"></script>
</html>