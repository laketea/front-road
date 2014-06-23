package com.bookstore.util;

import java.util.regex.Matcher; 
import java.util.regex.Pattern; 

public class UtilFun {
	
	public static String getString (String s , int a){
		int b;
		if(s.length()>a){b=a;}
		else
		{b=s.length();}
		return s.substring(0, b);
	}
	
	public static String getPayway (String payway ){
		String paywaycn= null;
		if(payway=="1"||payway.equals("1")){
			paywaycn = "支付包付款";
		}
		else if(payway=="2"||payway.equals("2")){
			paywaycn = "银行转账付款";
		}
		else {
			paywaycn = "邮局汇款";
		}
		return paywaycn;
	}
	
	public static String getArgtext (String payway ){
		String paywaycn= null;
		if(payway=="1"||payway.equals("1")){
			paywaycn = "Email/用户名或密码错误，请重新输入！";
		}
		else if(payway=="2"||payway.equals("2")){
			paywaycn = "您的账户没有激活，请先激活您的账户！";
		}
		else if(payway=="3"||payway.equals("3")) {
			paywaycn = "验证码错误，请重新输入！";
		}else if(payway=="4"||payway.equals("4")) {
				paywaycn = "帐号不存在，请重新输入！";
		}else if(payway=="11"||payway.equals("11")) {
			paywaycn = "验证码错误，请重新输入！";
		}else if(payway=="12"||payway.equals("12")) {
			paywaycn = "该用户名或EMAIL已存在，请重新输入！";
		}else if(payway=="13"||payway.equals("13")) {
			paywaycn = "输入错误，请重新输入！";
		}else if(payway=="110"||payway.equals("110")) {
			paywaycn = "抱歉，数量有限 每件商品您一次最多只能购买10件！";
		}else if(payway=="111"||payway.equals("111")) {
			paywaycn = "抱歉，数量有限 您选择的数量大于库存量！";
		}else {
			paywaycn = "输入错误，请重新输入！";
		}
		return paywaycn;
	}
	
	public static String getPaywaycn (String payway ){
		String paywaycn= null;
		if(payway=="1"||payway.equals("1")){
			paywaycn="请在线联系";
		}
		else if(payway=="2"||payway.equals("2")){
			paywaycn = "您选择的是银行转账支付方式，请按以下说明付款并联系我们：<br/>开户行：某某银行<br/>户名：某人<br/>帐号：0000000000<br/>" +
			"（使用此方式转帐或汇款，请一定于转帐或汇款后电话或短信通知我们，以免耽误您到货。短信编辑格式：订单号+金额短信发至：      或致电：       ）" +
			"";
		}
		else {
			paywaycn = "您选择的是邮局汇款支付方式，请按以下说明付款并联系我们：<br/>收款人：某人<br/>地主：0000000000<br/>" +
			"（使用此方式汇款，请一定于汇款后电话或短信通知我们，以免耽误您到货。短信编辑格式：订单号+金额短信发至：      或致电：       ）" +
			"";
		}
		return paywaycn;
	}
	
	public static String getFlag (String flag ){
		String paywaycn= null;
		if(flag=="0"||flag.equals("0")){
			paywaycn = "未";
		}
		else if(flag=="1"||flag.equals("1")){
			paywaycn = "已";
		}
		else {
			paywaycn = "未";
		}
		return paywaycn;
	}
	
	public static String getSendway (String flag ){
		String paywaycn= null;
		if(flag=="0"||flag.equals("0")){
			paywaycn = "快递";
		}
		else if(flag=="1"||flag.equals("1")){
			paywaycn = "快递";
		}
		else {
			paywaycn = "EMS";
		}
		return paywaycn;
	}
	
	public static String getStringReplace (String s , int a){
		Pattern p = Pattern.compile("\\s*|\t|\r|\n|<br>"); 
		Matcher m = p.matcher(s); 
		String ss = m.replaceAll("");
		int b;
		if(ss.length()>a){b=a;}
		else
		{b=ss.length();}
		return ss.substring(0, b);
	}
		
	
	
}
