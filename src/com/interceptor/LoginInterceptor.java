package com.interceptor;

import java.util.Map;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor
{
    //定义一个拦截器，拦截赛事管理的操作
	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation ai) throws Exception
	{
		ActionContext ac = ai.getInvocationContext();
		Map<String,String> session = (Map<String,String>)ac.getSession();
		String realname = (String)session.get("realname");
		if((realname != null) && (realname.length() > 0))
		{
			return ai.invoke();  //放行，把执行控制权转交给下一个Action
		}
		else
		{
			ac.put("sorry", "对不起，请先登录！");  //保存一条信息在ac中，以便在login.jsp上显示
			return Action.LOGIN;      //替被它拦截的Action返回LOGIN
		}
	}
}
