package com.szrz.views;

import com.mathworks.toolbox.javabuilder.MWException;

import WarterMark.WarterMark;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.szrz.common.WaterMarkUtils;
import com.szrz.domain.AntiImg;
import com.szrz.domain.ImgType;
import com.szrz.domain.User;
import com.szrz.service.AntiImgManager;
import com.szrz.service.ImgTypeManager;
import com.szrz.service.UserManager;

public class AntiImgAction extends ActionSupport {

	private static final int BUFFER_SIZE = 16384;

	protected AntiImgManager mgr;

	protected ImgTypeManager imgr;

	private AntiImg anti;

	private File file;
	
	private String type="check";

	private List<ImgType> tLst;

	public void setAntiImgManager(AntiImgManager mgr) {
		this.mgr = mgr;
	}

	public void setImgTypeManager(ImgTypeManager imgr) {
		this.imgr =imgr;
	}

	public String execute() {
		tLst = imgr.findAll();
		anti = new AntiImg();
		this.setType(this.getParameter("type"));
		return "anti";

	}

	public String upload() {
		String root = ServletActionContext.getRequest().getRealPath("/oldPath");
		String fileName = "";
		try {
			File path = new File(root);
			if (!path.exists()) {
				path.mkdir();
			}
			String ext = getExtention(file.getName()).toLowerCase();
			fileName = UUID.randomUUID().toString() + "." + "bmp";
			File destFile = new File(root+"/"+fileName);

//			if (ext.trim().equals("jpg") || ext.trim().equals("gif") || ext.trim().equals("bmp") || ext.trim().equals("swf")
//					|| ext.trim().equals("jpeg") || ext.trim().equals("pjpeg") || ext.trim().equals("word") || ext.trim().equals("excel")
//					|| ext.trim().equals("flv")) {

				InputStream in = null;
				OutputStream out = null;
				try {
					in = new BufferedInputStream(new FileInputStream(file), BUFFER_SIZE);
					out = new BufferedOutputStream(new FileOutputStream(destFile), BUFFER_SIZE);
					byte buffer[] = new byte[BUFFER_SIZE];
					while (in.read(buffer) > 0) {
						out.write(buffer);
					}

				} finally {
					if (in != null)
						in.close();
					if (out != null)
						out.close();

				}
//			}
		} catch (Exception exception) {
			System.err.println(exception);
		}
		anti.setOglPath(fileName);
		this.setType(type);
		this.setAnti(anti);
		return "anti-step-2";
	}

	public void step2() {
		HttpServletResponse response = this.getResponse();
		response.setContentType("text/html;charset=gbk");
		String oldPath =getParameter("oldPath");

		String root = ServletActionContext.getRequest().getRealPath("/oldPath");
		File sfile = new File(ServletActionContext.getRequest().getRealPath("/newsPath"));
		if(!sfile.exists()){
			sfile.mkdir();
		}
		String req = "0";
		String path = root +"\\"+ oldPath;
		String isAleadyExsit =null;
		//ºÏ≤‚
		if("check".equals(type)){
			boolean isSuccessed =WaterMarkUtils.antiCheck(path, ServletActionContext.getRequest().getRealPath("/newsPath")+"\\"+type+"_"+oldPath);
			if(isSuccessed){
				req ="1";
			}else{
				req ="2";
			}
			
		}else{//«∂»Î
			boolean isSuccessed =WaterMarkUtils.antiEmbed(path, ServletActionContext.getRequest().getRealPath("/newsPath")+"\\"+type+"_"+oldPath);
			if(isSuccessed){
				req ="3";
			}else{
				req ="4";
			}
			
		}
		
		try {
			response.getWriter().write(req);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos + 1);
	}

	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	public HttpSession getSession() {
		return ServletActionContext.getRequest().getSession(true);
	}

	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	public String getParameter(String name) {
		return getRequest().getParameter(name);
	}

	public List<ImgType> getTLst() {
		return tLst;
	}

	public void setTLst(List<ImgType> tLst) {
		this.tLst = tLst;
	}

	public AntiImg getAnti() {
		return anti;
	}

	public void setAnti(AntiImg Anti) {
		this.anti = Anti;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
	
	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public static void main(String[] args) {

		String ss = "sdfsdf.gif";
		System.out.println(AntiImgAction.getExtention(ss));
	}

}
