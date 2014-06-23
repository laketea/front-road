package com.auto.business;

import java.util.ArrayList;
import java.util.List;

public class Po {
	
	private String className ;
	
	private String classCnName;
	
	private String path;
	
	private List<String[]> property = new ArrayList<String[]>();
	
	public Po(){
		
	}
	
	public Po(String name,String cnName,String path){
		this.className = name;
		this.classCnName = cnName;
		this.path=path;
	}
	
	public Po add(String type,String name,String des){
		String[] attr ={type,name,des};
		this.property.add(attr);
		return this;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassCnName() {
		return classCnName;
	}

	public void setClassCnName(String classCnName) {
		this.classCnName = classCnName;
	}

	public List<String[]> getProperty() {
		return property;
	}

	public void setProperty(List<String[]> property) {
		this.property = property;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	public String getFirstLowClassName(){
		String f = this.getClassName().substring(0,1).toLowerCase();
		return f+this.getClassName().substring(1);
	}
	
	
	
	

}
