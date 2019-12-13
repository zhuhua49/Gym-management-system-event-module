<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/base.css" />	
	<title>赛事查询详情页</title>
</head>
<body>
	  <div class="center">
	  <table>
	      <s:iterator value="matchOne" id="One">	      
	  
	      <tr>
	      <td><label for="ID">赛事编号：</label></td>
	      <td><s:textfield value="%{#One.ID}" readonly="true" id="ID"/></td>
	      <td><label for="match_name">赛事名称：</label></td>
	      <td><s:textfield value="%{#One.match_name}" readonly="true" id="match_name"/></td>
	      <td><label for="match_time">赛事时间：</label></td>
	      <td><s:textfield value="%{#One.match_time}" readonly="true" id="match_time"/></td>
	      <td><label for="place">赛事地点：</label></td>
	      <td><s:textfield value="%{#One.match_type} %{#One.place}" readonly="true" id="place"/></td>
	      </tr>
	      
	      <tr>
	      <td><label for="applicant">申请人：</label></td>
	      <td><s:textfield value="%{#One.applicant}" readonly="true" id="applicant"/></td>
	      <td><label for="reviewer">审核人：</label></td>
	      <td><s:textfield value="%{#One.reviewer}" readonly="true" id="reviewer"/></td>
	      <td><label for="recorder">记录员：</label></td>
	      <td><s:textfield value="%{#One.recorder}" readonly="true" id="recorder"/></td>
	      <td><label for="state">赛事状态：</label></td>
	      <td><s:textfield value="%{#One.state}" readonly="true" id="state"/></td>
	      </tr>
	      
	      <tr>
	      <td><label for="result">备注：</label></td>
		  <td colspan="7"><s:textarea value="%{#One.result}" readonly="true" id="result" cols="150" cssStyle="resize:none"/></td>
	      </tr>
	      
	      </s:iterator>
	  </table>
	  <a href="${pageContext.request.contextPath}/index.jsp">返回主页</a>
	  </div>
</body>
</html>