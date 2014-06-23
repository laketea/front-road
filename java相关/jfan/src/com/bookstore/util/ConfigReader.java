package com.bookstore.util;
 
import org.dom4j.DocumentException; 
import org.dom4j.Attribute; 
import org.dom4j.Document; 
import org.dom4j.DocumentHelper; 
import org.dom4j.Element; 
import org.dom4j.Node;

import org.dom4j.io.OutputFormat; 
import org.dom4j.io.SAXReader; 
import org.dom4j.io.XMLWriter;
import java.util.Iterator; 
import java.util.List; 

/** 
* ��ȡ�أͣ������ļ�sysconfig.xml 
* 
* @author zhangwei 
* 
*/ 
public class ConfigReader { 
private static ConfigReader instance = new ConfigReader(); 
private Document doc; 
private Sysinfo sysInfo; 

private ConfigReader() { 
try { 
doc = new SAXReader().read(Thread.currentThread() 
.getContextClassLoader().getResourceAsStream( 
"/SysConfig.xml")); 
Element mailSizeElement = (Element) doc 
.selectObject("/config/sys-info/mailsize"); 
Element topContentElement = (Element) doc 
.selectObject("/config/sys-info/topcontent"); 
Element topImgElement = (Element) doc 
.selectObject("/config/sys-info/topimg"); 
sysInfo = new Sysinfo(); 
sysInfo.setMailsize(mailSizeElement.getStringValue()); 
sysInfo.setTopcontent(topContentElement.getStringValue()); 
sysInfo.setTopimg(topImgElement.getStringValue()); 
} catch (DocumentException e) { 
e.printStackTrace(); 
} 

} 

public Sysinfo getSysInfo() { 
return sysInfo; 

} 

public void setSysmail( String syscontent ) { 
	try { 
		doc = new SAXReader().read(Thread.currentThread() 
		.getContextClassLoader().getResourceAsStream( 
		"/SysConfig.xml")); 
		//Element mailSizeElement = (Element) doc 
		//.selectObject("/config/sys-info/mailsize"); 
		//ͨ��·���õ�һ���ڵ�
        Node node = doc.selectSingleNode("/config/sys-info");
        //ת����Ԫ��
        Element element = (Element)node;
        //ͨ���õ�Ԫ�������Ե������ۺϽ���ѭ��
        //element.setValue("syscontent");
        element.attribute("mailsize").setValue("111");
        for(int i=0;i<element.attributeCount();i++){
           //�ж��������Ƿ����
            if(element.attribute(i).getName().equals("mailsize")){
               //�޸�����ֵ
                element.attribute(i).setValue("syscontent");
                System.out.println("cc");
            }
        }
        System.out.println("dd");
      //�޸��ı�����
      element.setText(syscontent);
		} catch (DocumentException e) { 
		System.out.println("cc");
		e.printStackTrace(); 
		
		} 
	}

public void setSyscontent( String syscontent ) { 
	try { 
		doc = new SAXReader().read(Thread.currentThread() 
		.getContextClassLoader().getResourceAsStream( 
		"/SysConfig.xml")); 
		Element topContentElement = (Element) doc 
		.selectObject("/config/sys-info/topcontent"); 
		topContentElement.setText(syscontent);
		} catch (DocumentException e) { 
		e.printStackTrace(); 
		} 
	}

public void setSysimg( String syscontent ) { 
	try { 
		doc = new SAXReader().read(Thread.currentThread() 
		.getContextClassLoader().getResourceAsStream( 
		"/SysConfig.xml")); 
		Element topImgElement = (Element) doc 
		.selectObject("/config/sys-info/topimg"); 
		topImgElement.setText(syscontent);
		} catch (DocumentException e) { 
		e.printStackTrace(); 
		} 
	}

public static ConfigReader getInstance() { 
return instance; 
} 

public static void main(String[] args) { 
System.out.print(ConfigReader.getInstance().getSysInfo()); 
} 
} 

