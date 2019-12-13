<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/base.css" />	
	<title>赛事审核</title>
	<style>td {text-align:center;}</style>
</head>
<body>
	   当前等待审核的赛事总数：<s:property value="matchAll.size()"/>例
	   
	   <div class="center">
	   <table>
		<tr>
			<td>赛事编号</td>
			<td>赛事名称</td>
			<td>赛事时间</td>
			<td>赛事类型</td>
			<td>赛事场地</td>
		</tr>
		<s:iterator value="matchAll" id="ALL">
		<tr>
			<td><s:property value="#ALL.ID"/></td>
			<td><s:property value="#ALL.match_name"/></td>
			<td><s:property value="#ALL.match_time"/></td>
			<td><s:property value="#ALL.match_type"/></td>
			<td><s:property value="#ALL.place"/></td>
			<td><a href="match_reviewSee1.action?match.ID=<s:property value="#ALL.ID" />" >审核</a></td>
		</tr>
		</s:iterator>
	   </table>
	   </div>
	   
	 <a href="${pageContext.request.contextPath}/index.jsp">返回主页</a>
</body>
</html>