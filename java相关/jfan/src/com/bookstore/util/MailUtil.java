package com.bookstore.util;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Address;
import javax.mail.internet.MimeUtility;

/**
 * @author Administrator
 */
public class MailUtil {

	static int port = 25;

	static String server = "123.232.164.7";

	static String from = "www.jfanfan.com<admin@jfanfan.com>";

	static String user = "admin@jfanfan.com";

	static String password = "806098918";
	
	static String true_from = null;
	
	public static String getFrom(Message msg){   
	      String from="";   
	      try{   
	        if(msg.getFrom()[0]!=null)   
	          from=msg.getFrom()[0].toString();   
	        if(from.startsWith("=?GB")||from.startsWith("=?gb")){   
	          from=MimeUtility.decodeText(from);   
	        }else{   
	          from=toChinese(from);   
	       }   
	     }catch(Exception e){   
	       e.printStackTrace();   
	     }   
	    // from=StringUtil.replaceStr(from,"<","<");// replaceStrÎª×Ö·û´®Ìæ»»º¯Êý   
	     //from=StringUtil.replaceStr(from,">",">");   
	     return from;   
	   }   

	
	
	public static String toChinese(String strvalue){   
	     try{   
	       if(strvalue==null)   
	         return null;   
	       else{   
	         strvalue = new String(strvalue.getBytes("ISO8859_1"), "GBK");   
	         return strvalue;   
	       }   
	     }catch(Exception e){   
	       return null;   
	     }   
	   } 
	
	
	public static void sendEmail(String email, String subject, String body) {
		try {
			Properties props = new Properties();
			props.put("mail.smtp.host", server);
			props.put("mail.smtp.port", String.valueOf(port));
			props.put("mail.smtp.auth", "true");
			Transport transport = null;
			Session session = Session.getDefaultInstance(props, null);
			transport = session.getTransport("smtp");
			transport.connect(server, user, password);
			MimeMessage msg = new MimeMessage(session);
			msg.setSentDate(new Date());
			//true_from = getFrom(from);
			InternetAddress fromAddress = new InternetAddress(from);
			msg.setFrom(fromAddress);
			InternetAddress[] toAddress = new InternetAddress[1];
			toAddress[0] = new InternetAddress(email);
			msg.setRecipients(Message.RecipientType.TO, toAddress);
			msg.setSubject(subject, "gb2312");	
			msg.setText(body, "gb2312");
			msg.saveChanges();
			true_from = getFrom(msg);
			InternetAddress fromAddresss = new InternetAddress(true_from);
			msg.setFrom(fromAddresss);
			msg.saveChanges();
			transport.sendMessage(msg, msg.getAllRecipients());
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
