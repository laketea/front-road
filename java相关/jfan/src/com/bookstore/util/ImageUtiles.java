/**
 * FileName:     ImageUtiles.java
 * CreationTime: 2010-8-11 07:06:17
 * Author:       zxc
 * EMail:        zxce.1988@163.com
 * Site:         http://www.tjitast.com
 * CopyRight: 2010-2012 All Recieves.
 */
package com.bookstore.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

/**
 * @author zxc
 */
public class ImageUtiles {
	private ImageUtiles(){}

	private static char []  chars = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
			  									'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
			  									'0', '1', '2', '3', '4', '5','6', '7', '8', '9'};
	
	public static String getPicture(int width,int height,OutputStream os){
		StringBuilder str = new StringBuilder();
		//
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		//
		Graphics2D g2d = bi.createGraphics();
		g2d.setBackground(new Color(255,255,255));
		g2d.fillRect(0, 0, width, height);
		g2d.setColor(new Color(0,0,0));
		g2d.drawRect(0, 0, width-1, height-1);
		g2d.setFont(new Font("Times New Roman", Font.PLAIN, 14));
		g2d.drawRect(0, 0, width-1, height-1);
		//
		Random random = new Random();
		for(int i =0;i<4;i++){
            char c = chars[random.nextInt(chars.length-1)];
            str.append(c);
			g2d.setColor(new Color(1+random.nextInt(255),1+random.nextInt(255),1+random.nextInt(255)));
			g2d.drawString(String.valueOf(c), 12+i*10, 12);
		}
		g2d.dispose();
		try {
			ImageIO.write(bi, "gif", os);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return str.toString();
	}
}
