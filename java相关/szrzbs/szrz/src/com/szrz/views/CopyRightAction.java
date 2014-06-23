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
import com.szrz.domain.CopyRightImg;
import com.szrz.domain.ImgType;
import com.szrz.domain.User;
import com.szrz.service.CopyRightImgManager;
import com.szrz.service.ImgTypeManager;
import com.szrz.service.UserManager;

public class CopyRightAction extends ActionSupport {

	private static final int BUFFER_SIZE = 16384;

	protected CopyRightImgManager mgr;

	protected ImgTypeManager imgr;

	private CopyRightImg copyRight;

	private File file;

	private List<ImgType> tLst;

	public void setCopyRightImgManager(CopyRightImgManager mgr) {
		this.mgr = mgr;
	}

	public void setImgTypeManager(ImgTypeManager imgr) {
		this.imgr =imgr;
	}

	public String execute() {
		tLst = imgr.findAll();
		copyRight = new CopyRightImg();
		return "copyright";

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
		copyRight.setOglPath(fileName);
		ImgType type = imgr.get(Integer.valueOf(copyRight.getTypeId()));
		copyRight.setTypeName(type.getName());
		this.setCopyRight(copyRight);
		return "copyright-step-2";
	}

	public void step2() {
		HttpServletResponse response = this.getResponse();
		response.setContentType("text/html;charset=gbk");
		String imgName =getParameter("imgName");
		String typeId =getParameter("typeId");
		String oldPath =getParameter("oldPath");

		String root = ServletActionContext.getRequest().getRealPath("/oldPath");
		String req = "0";
		String path = root +"/"+ oldPath;
		String isAleadyExsit =null;
		try{
//		isAleadyExsit= WaterMarkUtils.warter_extract(path);
		}catch(Exception e){
			e.printStackTrace();
		}

		if (isAleadyExsit != null && WaterMarkUtils.EXTRACT_ERR.equals(isAleadyExsit)) {
			req = "0";// 提取出错
		}
		if (isAleadyExsit != null && !WaterMarkUtils.EXTRACT_ERR.equals(isAleadyExsit)) {
			req = "1";// 存在
		}
		if (isAleadyExsit == null) {
			User user = (User) this.getSession().getAttribute("user");
			if (user == null) {
				req = "2";// 登录失效
			} else {
				
//				boolean isRight = WaterMarkUtils.warter_embed(path, root + "/newPath/" + oldPath, user.getIdCard());
//				if (!isRight) {
//					req = "3";// 系统错误，嵌入水印失败
//				} else {
				copyRight = new CopyRightImg();
					copyRight.setImgName(imgName);
					copyRight.setTypeId(typeId);
					copyRight.setOglPath(oldPath);
					copyRight.setValidDate(oldPath);
					copyRight.setUserId(String.valueOf(user.getId()));
					copyRight.setUserIdCard(user.getIdCard());
					copyRight.setUserName(user.getName());
					mgr.add(copyRight);
					req = oldPath;// 成功!
//				}
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

	public CopyRightImg getCopyRight() {
		return copyRight;
	}

	public void setCopyRight(CopyRightImg copyRight) {
		this.copyRight = copyRight;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public static void main(String[] args) {

		String ss = "sdfsdf.gif";
		System.out.println(CopyRightAction.getExtention(ss));
	}

}
