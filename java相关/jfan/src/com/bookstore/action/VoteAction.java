package com.bookstore.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import java.sql.*;
public class VoteAction extends DispatchAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		// 退出登陆 销毁Session
		System.out.println("a");
		String id=request.getParameter("bookname"); //从表单获得 
		String yszl=request.getParameter("yszl");
		String nwbs=request.getParameter("nwbs");
		String tlsj=request.getParameter("tlsj");
		String tmsz=request.getParameter("tmsz");
		String nnjj=request.getParameter("nnjj"); 
		String cwl=request.getParameter("cwl");
		String fmsj = request.getParameter("fmsj");
		//从表单获得 
		
		String driver="com.mysql.jdbc.Driver"; //我用的是mysql官方驱动你自己换一下就是了 在这里有 
		String url="jdbc:mysql://localhost:3306/bookstore?user=root&password=good545"; //这是数据库连接地址Ibatis是数据库名称,user是用户.password就是你的用户名,根据实际情况你修改 
		//String sql="INSERT INTO person (username,password) VALUES('"+uname+"','"+pwd+"')"; //把index.jsp提交的两个数据插进数据库的数据库语句 
		String sql1="update vote set ";
		String sql2="yszl_"+yszl+"=yszl_"+yszl+"+1,";
		String sql3="nwbs_"+nwbs+"=nwbs_"+nwbs+"+1,";
		String sql4="tlsj_"+tlsj+"=tlsj_"+tlsj+"+1,";
		String sql5="tmsz_"+tmsz+"=tmsz_"+tmsz+"+1,";
		String sql6="nnjj_"+nnjj+"=nnjj_"+nnjj+"+1,";
		String sql7="cwl_"+cwl+"=cwl_"+cwl+"+1  ";
		String sql8="  where id="+id;
		String sql9="fmsj_"+fmsj+"=fmsj_"+fmsj+"+1,";
		String sql =sql1+sql9+sql2+sql3+sql4+sql5+sql6+sql7+sql8;
		System.out.println("a");
		System.out.println(sql);
		Connection conn=null; //数据库连接 
		Statement stmt=null; 
		ResultSet rs = null; //查询结果 
		 //加载驱动 
		try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url); //获得连接 
		stmt=conn.createStatement(); 
		stmt.execute(sql);//存入数据库 
		System.out.println("c");
		stmt.close();//关闭Statement 
		conn.close();//关闭数据库连接 
		//ok完成了插入和查询操作 
		}catch(SQLException e1) {
			e1.printStackTrace();
		}
		catch(Exception ex){
			System.out.println("createError:"+ex.getMessage());
		}


		
		
		return mapping.findForward("success");

	}
	
}
