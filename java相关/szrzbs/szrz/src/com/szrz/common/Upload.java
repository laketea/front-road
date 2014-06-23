package com.szrz.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

public class Upload {
	// 上传
	private static final long serialVersionUID = 0x85369b8626L;
	private static final int BUFFER_SIZE = 16384;

	public synchronized static String toFile(File path,String fileName,String root,String fileType) {				
		String imageFileName="";
		String random = String.valueOf(Math.random()).substring(2);
		try {
//			Help.createDir(root+fileType);
			File file = new File(root+fileType);
			if(!file.exists()){
				file.mkdir();
			}
			imageFileName = (new StringBuilder(String.valueOf(fileType
					+ random))).append(getExtention(fileName))
					.toString();

			File imageFile = new File((new StringBuilder(String
					.valueOf(root))).append(imageFileName)
					.toString());
			// 判断后缀类型
			int position1 = imageFileName.lastIndexOf('.');
			String fileName1 = codeToString(imageFileName
					.substring(position1 + 1));
			if (fileName1.trim().equals("jpg")
					|| fileName1.trim().equals("gif")
					|| fileName1.trim().equals("bmp")
					|| fileName1.trim().equals("swf")
					|| fileName1.trim().equals("jpeg")
					|| fileName1.trim().equals("pjpeg")
					|| fileName1.trim().equals("word")
					|| fileName1.trim().equals("excel")
					|| fileName1.trim().equals("flv")) {

				InputStream in = null;
				OutputStream out = null;
				try {
					in = new BufferedInputStream(new FileInputStream(path), BUFFER_SIZE);
					out = new BufferedOutputStream(new FileOutputStream(imageFile),
							BUFFER_SIZE);
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

			}
		} catch (Exception exception) {
			System.err.println(exception);
		}
		return imageFileName;

	}

	public static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	public static String codeToString(String str) {// 处理中文字符串的函数
		String s = str;
		try {
			byte tempB[] = s.getBytes("iso8859-1");
			s = new String(tempB);
			return s;
		} catch (Exception e) {
			return s;
		}

	}
}
