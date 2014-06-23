package com.szrz.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.mathworks.toolbox.javabuilder.MWException;

import WarterMark.WarterMark;

public class WaterMarkUtils {

	private static final double KEY = 2;

	public static final String EXTRACT_ERR = "EXTRACT_ERR";

	// 嵌入水印
	public static boolean warter_embed(String path1, String path2, String info) {
		try {
			WarterMark a = new WarterMark();
			a.func_embed(path1, KEY, (double) 200, (double) 15, info, path2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	// 提取水印
	public static String warter_extract(String path) {
		Object[] r = null;
		try {
			WarterMark a = new WarterMark();
			r = a.func_extract(1, path, KEY);
		} catch (MWException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return EXTRACT_ERR;
		}
		return r == null || r.length < 1 || r[0] == null ? null : r[0].toString().trim();
	}

	public static boolean antiCheck(String fileName,String fileName2) {

		BufferedImage d = null;
		warterMake x = new warterMake();
		try {
			d = ImageIO.read(new File(fileName));// 读取要验证的图像

			BufferedImage c = warterMake.warter_Auth(d, 10, 10);// 图像验证

			ImageIO.write(c, "bmp", new File(fileName2));// 生成黑白二值图像，白色区域为篡改的
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;

	}
	
	public static boolean antiEmbed(String fileName,String fileName2) {

		BufferedImage a=null;
		//下面程序为水印嵌入，输出添加水印的图像，生成bmp文件，jpg文件不对
		warterMake x=new warterMake();
		try {
			a=ImageIO.read(new File(fileName));//读取要加水印的图像
		
		BufferedImage b=warterMake.warter_embed(a,10,10);//水印嵌入
		
			 ImageIO.write(b, "bmp",new File(fileName2));//输出添加水印的图像，生成bmp文件，jpg不对，我也暂时不知道--
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;

	}

}
