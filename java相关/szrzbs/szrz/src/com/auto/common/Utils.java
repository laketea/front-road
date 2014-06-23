package com.auto.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

public class Utils {
	
	
	public static boolean notNull(String str){	
		if(str!=null&&!"".equals(str)){
			return true;
		}else{
			return false;
		}
	}

	public static String getTemplateString(String fileName) {
		File file = new File("");
		String path = file.getAbsolutePath() + "/src/com/auto/template/"
				+ fileName + ".txt";

		InputStream is = null;
		String ret = null;
		try {
			File f = new File(path);
			is = new FileInputStream(f);
			long contentLength = f.length();
			byte[] ba = new byte[(int) contentLength];
			is.read(ba);
			ret = new String(ba, "gbk");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (Exception e) {
				}
			}
		}
		return ret;
	}

	public static String getRandomChar() {
		int index = (int) Math.round(Math.random() * 2);
		String randChar = "";
		switch (index) {
		case 0:// ´óÐ´×Ö·û
			randChar = String
					.valueOf((char) Math.round(Math.random() * 25 + 65));
			break;
		case 1:// Ð¡Ð´×Ö·û
			randChar = String
					.valueOf((char) Math.round(Math.random() * 25 + 97));
			break;
		default:// Êý×Ö
			randChar = String.valueOf(Math.round(Math.random() * 9));
			break;
		}
		return randChar;
	}
	
	public static String getRandomStr(){
		String str="";
		for(int i=0;i<8;i++){
			str+=getRandomChar();
		}
		return str;
	}

}
