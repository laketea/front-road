package com.bookstore.util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;

import java.util.Date;


import com.bookstore.exception.DBException;
import com.bookstore.form.GodsForm;
import com.bookstore.form.TestForm;
import com.bookstore.po.Gods;
import com.bookstore.service.GodsService;
import com.bookstore.service.TestService;

public class uploadimg {
	
	public static String upminimg(ActionForm form,
			HttpServletRequest request, HttpServletResponse response ){
		try {
			// ����ϴ�����Ƭ�ļ�
			GodsForm bookForm = (GodsForm) form;
			response.setContentType("text/html;charset=gbk");
			PrintWriter out = response.getWriter();
			FormFile upFile = bookForm.getMinphoto();
			// ����ϴ����ļ�����
			String filename = upFile.getFileName();
			String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
			Calendar calendar = Calendar.getInstance();
			filename = String.valueOf(calendar.getTimeInMillis())+"."+ext;
			int filesize = upFile.getFileSize();
			if(filesize>1024*1024*2){
				System.out.println("SSSSSSSS");
				return "error";
			}
			String path = request.getRealPath("/files");
			// �Զ���idΪĿ¼������Ƭ�洢���ļ���
			//path=path+"\\"+orderId;
			// �����Ŀ¼�����ڣ��򴴽���Ŀ¼
			File file=new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			InputStream fin = upFile.getInputStream();
			OutputStream fout = new FileOutputStream(path + "\\"
					+ filename);
			byte[] buffer = new byte[8192];
			int readByte = 0;
			while ((readByte = fin.read(buffer, 0, 8192)) > 0) {
				fout.write(buffer, 0, readByte);
			}
			fin.close();
			fout.close();
			return "files/"+filename;
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	public static String upmaximg(ActionForm form,
			HttpServletRequest request, HttpServletResponse response ){
		try {
			// ����ϴ�����Ƭ�ļ�
			GodsForm bookForm = (GodsForm) form;
			response.setContentType("text/html;charset=gbk");
			PrintWriter out = response.getWriter();
			FormFile upFile = bookForm.getMaxphoto();
			// ����ϴ����ļ�����
			String filename = upFile.getFileName();
			String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
			Calendar calendar = Calendar.getInstance();
			filename = String.valueOf(calendar.getTimeInMillis())+"."+ext;
			int filesize = upFile.getFileSize();
			if(filesize>1024*1024*2){
				System.out.println("SSSSSSSS");
				return null;
			}
			String path = request.getRealPath("/files");
			// �Զ���idΪĿ¼������Ƭ�洢���ļ���
			//path=path+"\\"+orderId;
			// �����Ŀ¼�����ڣ��򴴽���Ŀ¼
			File file=new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			InputStream fin = upFile.getInputStream();
			OutputStream fout = new FileOutputStream(path + "\\"
					+ filename);
			byte[] buffer = new byte[8192];
			int readByte = 0;
			while ((readByte = fin.read(buffer, 0, 8192)) > 0) {
				fout.write(buffer, 0, readByte);
			}
			fin.close();
			fout.close();
			return "files/"+filename;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static String upmaximga(ActionForm form,
			HttpServletRequest request, HttpServletResponse response ){
		try {
			// ����ϴ�����Ƭ�ļ�
			GodsForm bookForm = (GodsForm) form;
			response.setContentType("text/html;charset=gbk");
			PrintWriter out = response.getWriter();
			FormFile upFile = bookForm.getMaxphoto_a();
			// ����ϴ����ļ�����
			String filename = upFile.getFileName();
			String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
			Calendar calendar = Calendar.getInstance();
			filename = String.valueOf(calendar.getTimeInMillis())+"."+ext;
			int filesize = upFile.getFileSize();
			if(filesize>1024*1024*2){
				System.out.println("SSSSSSSS");
				return null;
			}
			String path = request.getRealPath("/files");
			// �Զ���idΪĿ¼������Ƭ�洢���ļ���
			//path=path+"\\"+orderId;
			// �����Ŀ¼�����ڣ��򴴽���Ŀ¼
			File file=new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			InputStream fin = upFile.getInputStream();
			OutputStream fout = new FileOutputStream(path + "\\"
					+ filename);
			byte[] buffer = new byte[8192];
			int readByte = 0;
			while ((readByte = fin.read(buffer, 0, 8192)) > 0) {
				fout.write(buffer, 0, readByte);
			}
			fin.close();
			fout.close();
			return "files/"+filename;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static String upmaximgb(ActionForm form,
			HttpServletRequest request, HttpServletResponse response ){
		try {
			// ����ϴ�����Ƭ�ļ�
			GodsForm bookForm = (GodsForm) form;
			response.setContentType("text/html;charset=gbk");
			PrintWriter out = response.getWriter();
			FormFile upFile = bookForm.getMaxphoto_b();
			// ����ϴ����ļ�����
			String filename = upFile.getFileName();
			String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
			Calendar calendar = Calendar.getInstance();
			filename = String.valueOf(calendar.getTimeInMillis())+"."+ext;
			int filesize = upFile.getFileSize();
			if(filesize>1024*1024*2){
				System.out.println("SSSSSSSS");
				return null;
			}
			String path = request.getRealPath("/files");
			// �Զ���idΪĿ¼������Ƭ�洢���ļ���
			//path=path+"\\"+orderId;
			// �����Ŀ¼�����ڣ��򴴽���Ŀ¼
			File file=new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			InputStream fin = upFile.getInputStream();
			OutputStream fout = new FileOutputStream(path + "\\"
					+ filename);
			byte[] buffer = new byte[8192];
			int readByte = 0;
			while ((readByte = fin.read(buffer, 0, 8192)) > 0) {
				fout.write(buffer, 0, readByte);
			}
			fin.close();
			fout.close();
			return "files/"+filename;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static String upmaximgc(ActionForm form,
			HttpServletRequest request, HttpServletResponse response ){
		try {
			// ����ϴ�����Ƭ�ļ�
			GodsForm bookForm = (GodsForm) form;
			response.setContentType("text/html;charset=gbk");
			PrintWriter out = response.getWriter();
			FormFile upFile = bookForm.getMaxphoto_c();
			// ����ϴ����ļ�����
			String filename = upFile.getFileName();
			String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
			Calendar calendar = Calendar.getInstance();
			filename = String.valueOf(calendar.getTimeInMillis())+"."+ext;
			int filesize = upFile.getFileSize();
			if(filesize>1024*1024*2){
				System.out.println("SSSSSSSS");
				return null;
			}
			String path = request.getRealPath("/files");
			// �Զ���idΪĿ¼������Ƭ�洢���ļ���
			//path=path+"\\"+orderId;
			// �����Ŀ¼�����ڣ��򴴽���Ŀ¼
			File file=new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			InputStream fin = upFile.getInputStream();
			OutputStream fout = new FileOutputStream(path + "\\"
					+ filename);
			byte[] buffer = new byte[8192];
			int readByte = 0;
			while ((readByte = fin.read(buffer, 0, 8192)) > 0) {
				fout.write(buffer, 0, readByte);
			}
			fin.close();
			fout.close();
			return "files/"+filename;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static String upmaximgd(ActionForm form,
			HttpServletRequest request, HttpServletResponse response ){
		try {
			// ����ϴ�����Ƭ�ļ�
			GodsForm bookForm = (GodsForm) form;
			response.setContentType("text/html;charset=gbk");
			PrintWriter out = response.getWriter();
			FormFile upFile = bookForm.getMaxphoto_d();
			// ����ϴ����ļ�����
			String filename = upFile.getFileName();
			String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
			Calendar calendar = Calendar.getInstance();
			filename = String.valueOf(calendar.getTimeInMillis())+"."+ext;
			int filesize = upFile.getFileSize();
			if(filesize>1024*1024*2){
				System.out.println("SSSSSSSS");
				return null;
			}
			String path = request.getRealPath("/files");
			// �Զ���idΪĿ¼������Ƭ�洢���ļ���
			//path=path+"\\"+orderId;
			// �����Ŀ¼�����ڣ��򴴽���Ŀ¼
			File file=new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			InputStream fin = upFile.getInputStream();
			OutputStream fout = new FileOutputStream(path + "\\"
					+ filename);
			byte[] buffer = new byte[8192];
			int readByte = 0;
			while ((readByte = fin.read(buffer, 0, 8192)) > 0) {
				fout.write(buffer, 0, readByte);
			}
			fin.close();
			fout.close();
			return "files/"+filename;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
