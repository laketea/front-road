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
* 读取ＸＭＬ配置文件sysconfig.xml 
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
		//通过路径得到一个节点
        Node node = doc.selectSingleNode("/config/sys-info");
        //转换成元素
        Element element = (Element)node;
        //通过得到元素内属性的数量综合进行循环
        //element.setValue("syscontent");
        element.attribute("mailsize").setValue("111");
        for(int i=0;i<element.attributeCount();i++){
           //判断属性名是否符合
            if(element.attribute(i).getName().equals("mailsize")){
               //修改属性值
                element.attribute(i).setValue("syscontent");
                System.out.println("cc");
            }
        }
        System.out.println("dd");
      //修改文本内容
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

