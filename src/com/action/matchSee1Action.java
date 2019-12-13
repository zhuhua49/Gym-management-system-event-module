package com.action;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.service.*;
import com.opensymphony.xwork2.ActionSupport;
import com.po.*;
import com.vo.*;
public class matchSee1Action {
	private ModelBean service;
	private List<matchPO> matchOne;

	public List<matchPO> getmatchOne() {
		return matchOne;
	}

	public void setmatchOne(List<matchPO> matchOne) {
		this.matchOne = matchOne;
	}

	public String execute() 
	{
		try
		{
			service = new ModelBean();
			matchOne = new ArrayList<matchPO>();
			matchOne = service.Seematch(null,ServletActionContext.getRequest().getParameter("match.ID"));
						
			if (matchOne != null) 
			{
				return  "success";  //成功
			}
			else
			{
				return "input";     //不成功						
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
