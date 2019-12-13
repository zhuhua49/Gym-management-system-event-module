<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/base.css" />	
	<title>主页</title>
</head>
<body>
	 <s:if test="#session.realname!=null" >
	            欢迎您，<s:property value="#session.realname"/>
        <a href="${pageContext.request.contextPath}/login/login.jsp">重新登录</a>
	 </s:if>
	 <s:else><a href="login/login.jsp">登录</a></s:else>
	 
	 <div class="center">
	  <a href="GOmatch_apply.action">赛事预约</a>
	  <s:if test="#session.status=='管理员'" >
	    <a href="match_reviewSee.action">赛事审核</a>
	  </s:if>
	  <a href="GOmatch_query.action">赛事查询</a>
	  <s:if test="#session.status=='管理员'" >
	    <a href="match_recordSee.action">赛事记录</a>
	  </s:if>
	  <br><br>
	 </div>
</body>
</html>