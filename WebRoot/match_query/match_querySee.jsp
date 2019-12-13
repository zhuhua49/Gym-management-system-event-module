<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/base.css" />	
	<title>赛事查询结果</title>
	<style>td {text-align:center;}</style>
</head>
<body>
	   符合条件的赛事总数：<s:property value="matchAll.size()"/>例
	   
	   <div class="center">
	   <table>
		<tr>
			<td>赛事编号</td>
			<td>赛事名称</td>
			<td>赛事时间</td>
			<td>赛事类型</td>
			<td>赛事场地</td>
			<td>赛事状态</td>
		</tr>
		<s:iterator value="matchAll" id="ALL">
		<tr>
			<td><s:property value="#ALL.ID"/></td>
			<td><s:property value="#ALL.match_name"/></td>
			<td><s:property value="#ALL.match_time"/></td>
			<td><s:property value="#ALL.match_type"/></td>
			<td><s:property value="#ALL.place"/></td>
			<td><s:property value="#ALL.state"/></td>
			<td><a href="match_querySee1.action?match.ID=<s:property value="#ALL.ID" />" >查看</a></td>
			<s:if test=" #ALL.state=='未通过' && #session.realname==#ALL.applicant " ><td>
			    <a href="match_reapplySee1.action?match.ID=<s:property value="#ALL.ID" />" >重新预约</a>
			</td></s:if>
		</tr>
		</s:iterator>
	   </table>
	   </div>
	   
	 <a href="${pageContext.request.contextPath}/index.jsp">返回主页</a>
</body>
</html>