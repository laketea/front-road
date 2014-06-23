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
			paywaycn = "֧��������";
		}
		else if(payway=="2"||payway.equals("2")){
			paywaycn = "����ת�˸���";
		}
		else {
			paywaycn = "�ʾֻ��";
		}
		return paywaycn;
	}
	
	public static String getArgtext (String payway ){
		String paywaycn= null;
		if(payway=="1"||payway.equals("1")){
			paywaycn = "Email/�û���������������������룡";
		}
		else if(payway=="2"||payway.equals("2")){
			paywaycn = "�����˻�û�м�����ȼ��������˻���";
		}
		else if(payway=="3"||payway.equals("3")) {
			paywaycn = "��֤��������������룡";
		}else if(payway=="4"||payway.equals("4")) {
				paywaycn = "�ʺŲ����ڣ����������룡";
		}else if(payway=="11"||payway.equals("11")) {
			paywaycn = "��֤��������������룡";
		}else if(payway=="12"||payway.equals("12")) {
			paywaycn = "���û�����EMAIL�Ѵ��ڣ����������룡";
		}else if(payway=="13"||payway.equals("13")) {
			paywaycn = "����������������룡";
		}else if(payway=="110"||payway.equals("110")) {
			paywaycn = "��Ǹ���������� ÿ����Ʒ��һ�����ֻ�ܹ���10����";
		}else if(payway=="111"||payway.equals("111")) {
			paywaycn = "��Ǹ���������� ��ѡ����������ڿ������";
		}else {
			paywaycn = "����������������룡";
		}
		return paywaycn;
	}
	
	public static String getPaywaycn (String payway ){
		String paywaycn= null;
		if(payway=="1"||payway.equals("1")){
			paywaycn="��������ϵ";
		}
		else if(payway=="2"||payway.equals("2")){
			paywaycn = "��ѡ���������ת��֧����ʽ���밴����˵�������ϵ���ǣ�<br/>�����У�ĳĳ����<br/>������ĳ��<br/>�ʺţ�0000000000<br/>" +
			"��ʹ�ô˷�ʽת�ʻ����һ����ת�ʻ����绰�����֪ͨ���ǣ����ⵢ�������������ű༭��ʽ��������+�����ŷ�����      ���µ磺       ��" +
			"";
		}
		else {
			paywaycn = "��ѡ������ʾֻ��֧����ʽ���밴����˵�������ϵ���ǣ�<br/>�տ��ˣ�ĳ��<br/>������0000000000<br/>" +
			"��ʹ�ô˷�ʽ����һ���ڻ���绰�����֪ͨ���ǣ����ⵢ�������������ű༭��ʽ��������+�����ŷ�����      ���µ磺       ��" +
			"";
		}
		return paywaycn;
	}
	
	public static String getFlag (String flag ){
		String paywaycn= null;
		if(flag=="0"||flag.equals("0")){
			paywaycn = "δ";
		}
		else if(flag=="1"||flag.equals("1")){
			paywaycn = "��";
		}
		else {
			paywaycn = "δ";
		}
		return paywaycn;
	}
	
	public static String getSendway (String flag ){
		String paywaycn= null;
		if(flag=="0"||flag.equals("0")){
			paywaycn = "���";
		}
		else if(flag=="1"||flag.equals("1")){
			paywaycn = "���";
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
