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
		
		// �˳���½ ����Session
		System.out.println("a");
		String id=request.getParameter("bookname"); //�ӱ���� 
		String yszl=request.getParameter("yszl");
		String nwbs=request.getParameter("nwbs");
		String tlsj=request.getParameter("tlsj");
		String tmsz=request.getParameter("tmsz");
		String nnjj=request.getParameter("nnjj"); 
		String cwl=request.getParameter("cwl");
		String fmsj = request.getParameter("fmsj");
		//�ӱ���� 
		
		String driver="com.mysql.jdbc.Driver"; //���õ���mysql�ٷ��������Լ���һ�¾����� �������� 
		String url="jdbc:mysql://localhost:3306/bookstore?user=root&password=good545"; //�������ݿ����ӵ�ַIbatis�����ݿ�����,user���û�.password��������û���,����ʵ��������޸� 
		//String sql="INSERT INTO person (username,password) VALUES('"+uname+"','"+pwd+"')"; //��index.jsp�ύ���������ݲ�����ݿ�����ݿ���� 
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
		Connection conn=null; //���ݿ����� 
		Statement stmt=null; 
		ResultSet rs = null; //��ѯ��� 
		 //�������� 
		try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url); //������� 
		stmt=conn.createStatement(); 
		stmt.execute(sql);//�������ݿ� 
		System.out.println("c");
		stmt.close();//�ر�Statement 
		conn.close();//�ر����ݿ����� 
		//ok����˲���Ͳ�ѯ���� 
		}catch(SQLException e1) {
			e1.printStackTrace();
		}
		catch(Exception ex){
			System.out.println("createError:"+ex.getMessage());
		}


		
		
		return mapping.findForward("success");

	}
	
}
