package com.action;
import java.sql.SQLException;
import com.service.*;
import com.opensymphony.xwork2.ActionSupport;
import com.vo.*;
public final class loginAction extends ActionSupport
{  
	private User user; 
	private ModelBean service;

	public User getuser() {
		return user;
	}

	public void setuser(User user) {
		this.user = user;
	}

	public String execute() 
	{
		//return  "success";
		try
		{
			service = new ModelBean();
			
			if (service.login(user)) 
			{
				return  "success";  //成功
			}
			else
			{
				return "fail";     //不成功						
			}
		}catch(SQLException e)
			{
				return  "input";     //不成功	
			}
		 catch(ClassNotFoundException ne)
		 {
		 	return  "input";     //不成功	
		 }
	}
}
