package com.service;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.vo.*;
import com.po.*;
import java.util.Map;
import com.dao.HibernateServiceProvider;
import com.opensymphony.xwork2.ActionContext;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ModelBean {
	private HibernateServiceProvider hsp = new HibernateServiceProvider();
	Transaction tx = null;
    Query query = null;	
	Boolean flag = false;
	Long i;
	int effectLines = 0;
	
	//用户登录
	@SuppressWarnings("unchecked")
	public Boolean login(User User)  throws SQLException, ClassNotFoundException,HibernateException
	{
		Session session = hsp.getSession();   //创建一个会话
	    List<userPO> result = new ArrayList<userPO>();
	    String hql = null;
		
		try
		{
			hql = "from userPO WHERE username = \'"+User.getusername()+"\' and password = \'"+User.getpassword()+"\' ";
			
			tx = session.beginTransaction();   //开始事务
			query = session.createQuery(hql);
			result = query.list();
			tx.commit();   //提交事务
			
			if(result != null)
			{
				flag = true;
				for (Iterator<userPO> i = result.iterator(); i.hasNext();) 
			    {
					userPO userPO = new userPO();
					userPO = (userPO) i.next();
					
					//把登录用户保存在session中,供拦截器访问
					ActionContext ac= ActionContext.getContext();
					Map<String,String> session1 = (Map<String,String>)ac.getSession();
					session1.put("realname",userPO.getrealname());
					session1.put("status",userPO.getstatus());
			    }
			}
		}catch (HibernateException he) 
		{
			if (tx != null) {
				tx.rollback();
			}
			throw he;
		}
		finally 
		{
			session.close();
		}
		return flag;
	 }
	
	//新建赛事（赛事预约）
	public Boolean Insertmatch(Match Match)  throws SQLException, ClassNotFoundException,HibernateException
	{
		Session session = hsp.getSession();   //创建一个会话
		
		try
	    {
			matchPO matchPO = new matchPO();
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String match_time = format.format(Match.getmatch_time());
			
			matchPO.setmatch_name(Match.getmatch_name());
			matchPO.setmatch_type(Match.getmatch_type());
			matchPO.setapplicant(Match.getapplicant());
			matchPO.setmatch_time(match_time);
			matchPO.setplace(Match.getplace());
			matchPO.setstate("待审核");
			
	    	tx = session.beginTransaction();   //开始事务
	    	i = (Long)session.save(matchPO);  //返回保存的记录主键ID值
	    	tx.commit();           //提交事务
	    }catch (HibernateException he) 
	    {
		      if (tx != null) {
		         tx.rollback();
		      }
		      throw he;
		    }
		finally 
		    {
		       session.close();
		}
		if(i!=0)
		{
			flag = true;
		}
		return flag;
	}
	
	//查询赛事
	public List<matchPO> Seematch(Match Match,String zl)  throws SQLException, ClassNotFoundException,HibernateException
	{
		Session session = hsp.getSession();   //创建一个会话
	    List<matchPO> result = new ArrayList<matchPO>();
	    String hql = null;
		
		try
		{
			if( Match == null && zl.trim().equals("待审核") ){ //复核查询
				hql = "from matchPO WHERE state = '待审核'";				
			}
			else if( Match == null && zl.trim().equals("已通过") ){ //查询通过审核的赛事
				hql = "from matchPO WHERE state = '已通过' ";
			}
			else if( Match != null && zl.trim().equals("全部") ){ //查询指定条件的赛事
				
				String match_type = "is not null";
				String place = "is not null";
				String state = "is not null";
				String timeA = "is not null";
				String timeB = "is not null";
				
				if( !Match.getmatch_type().trim().equals("不选择") ){
					match_type = "= \'"+Match.getmatch_type()+"\'";
				}
				if( !Match.getplace().trim().equals("不选择") ){
					place = "like \'%"+Match.getplace()+"%\'";
				}
				if( !Match.getstate().trim().equals("不选择") ){
					state = "= \'"+Match.getstate()+"\'";
				}
				if( Match.gettimeA() != null && !Match.gettimeA().trim().equals("") ){
					timeA = ">= \'"+Match.gettimeA()+"\'";
				}
				if( Match.gettimeB() != null && !Match.gettimeB().trim().equals("") ){
					timeB = "<= \'"+Match.gettimeB()+"\'";
				}
				hql = "from matchPO WHERE match_type "+match_type+" and place "+place+" and state "+state+" and DATE_FORMAT(match_time,\'%Y-%m-%d\') "+timeA+" and DATE_FORMAT(match_time,\'%Y-%m-%d\') "+timeB;
			}
			else if( Match == null && zl != null ){ //查询指定ID的一个赛事(ID为zl)
				hql = "from matchPO WHERE ID = \'"+zl+"\' ";
			}
			
			tx = session.beginTransaction();   //开始事务
			query = session.createQuery(hql);
			result = query.list();
			tx.commit();   //提交事务
		}catch (HibernateException he) 
		{
			if (tx != null) {
				tx.rollback();
			}
			throw he;
		}
		finally 
		{
			session.close();
		}
		return result;
	 }

	//存入审核后的赛事、记录赛事、赛事重新预约                    、删除档案，恢复档案
	public Boolean Updatematch(Match match,String zl)  throws SQLException, ClassNotFoundException,HibernateException
	{
		Session session = hsp.getSession();   //创建一个会话
		String hql = null;
		
		try
		{
			if( zl.trim().equals("审核") ){ //存入赛事审核
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String match_time = format.format(match.getmatch_time());
				if( match.getplace()==null || match.getplace().trim().equals("") ){
					hql = "UPDATE matchPO SET match_name = \'"+match.getmatch_name()+"\' , applicant = \'"+match.getapplicant()+"\' , reviewer = \'"+match.getreviewer()+"\' , match_time = \'"+match_time+"\' , result = \'"+match.getresult()+"\' , state = \'"+match.getstate()+"\' WHERE ID = \'"+match.getID()+"\' ";
				}else{
					hql = "UPDATE matchPO SET match_name = \'"+match.getmatch_name()+"\' , match_type = \'"+match.getmatch_type()+"\' , applicant = \'"+match.getapplicant()+"\' , reviewer = \'"+match.getreviewer()+"\' , match_time = \'"+match_time+"\' , place = \'"+match.getplace()+"\' , result = \'"+match.getresult()+"\' , state = \'"+match.getstate()+"\' WHERE ID = \'"+match.getID()+"\' ";
				}
			}
			else if( zl.trim().equals("记录") ){  //赛事记录
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String match_time = format.format(match.getmatch_time());
				if( match.getplace()==null || match.getplace().trim().equals("") ){
					hql = "UPDATE matchPO SET match_name = \'"+match.getmatch_name()+"\' , applicant = \'"+match.getapplicant()+"\' , reviewer = \'"+match.getreviewer()+"\' , match_time = \'"+match_time+"\' , recorder = \'"+match.getrecorder()+"\' , result = \'"+match.getresult()+"\' , state = '已结束' WHERE ID = \'"+match.getID()+"\' ";
				}else{
					hql = "UPDATE matchPO SET match_name = \'"+match.getmatch_name()+"\' , match_type = \'"+match.getmatch_type()+"\' , applicant = \'"+match.getapplicant()+"\' , reviewer = \'"+match.getreviewer()+"\' , match_time = \'"+match_time+"\' , place = \'"+match.getplace()+"\' , recorder = \'"+match.getrecorder()+"\' , result = \'"+match.getresult()+"\' , state = '已结束' WHERE ID = \'"+match.getID()+"\' ";
				}			
			}
			else if( zl.trim().equals("重新预约") ){  //赛事重新预约
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String match_time = format.format(match.getmatch_time());
				if( match.getplace()==null || match.getplace().trim().equals("") ){
					hql = "UPDATE matchPO SET match_name = \'"+match.getmatch_name()+"\' , applicant = \'"+match.getapplicant()+"\' , match_time = \'"+match_time+"\' , state = '待审核' WHERE ID = \'"+match.getID()+"\' ";
				}else{
					hql = "UPDATE matchPO SET match_name = \'"+match.getmatch_name()+"\' , match_type = \'"+match.getmatch_type()+"\' , applicant = \'"+match.getapplicant()+"\' , match_time = \'"+match_time+"\' , place = \'"+match.getplace()+"\' , state = '待审核' WHERE ID = \'"+match.getID()+"\' ";
				}			
			}
			tx = session.beginTransaction();   //开始事务
			query = session.createQuery(hql);
			effectLines = query.executeUpdate();
			tx.commit();   //提交事务
		}catch (HibernateException he) 
		{
			if (tx != null) {
				tx.rollback();
			}
			throw he;
		}
		finally 
		{
			session.close();
		}
		if(effectLines!=0)
		{
			flag = true;
		}
		return flag;
	}
}
