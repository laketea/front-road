package com.szrz.action; 
/** 
 * @author zhangwei laketea@163.com
 * @version 2012-10-16
 * 
 */

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport{
	 
	 
	private static final long serialVersionUID = -676538067021681709L;
  private String lookup;
  private String workflow;
//  private Object errorObject;
  protected static final String DOWNLOAD = "download";
  protected static final String AUTO = "auto";
  private ActionProxy proxy;
  private int statusCode = 200;
  private String callbackType="";
  private String rel ="";
  private String tipsMessage;
  private String forwardUrl;
  private String ajax;
  private String navTabId;
  
  private int pageNum = 1;
  private int numPerPage = 15;
	private String orderField;
	private String orderDirection;
	private String keywords;
	private int totalCount = 0;

  public ActionProxy getProxy()
  {
    if (this.proxy == null)
      this.proxy = ActionContext.getContext().getActionInvocation().getProxy();
    return this.proxy;
  }

  public String getLookup() {
    return this.lookup;
  }

  public void setLookup(String lookup) {
    this.lookup = lookup;
  }

  public HttpServletRequest getRequest() {
    return ServletActionContext.getRequest();
  }

  public HttpServletResponse getResponse() {
    return ServletActionContext.getResponse();
  }

  public HttpSession getSession()
  {
    return ServletActionContext.getRequest().getSession(true);
  }

  public String getParameter(String name) {
    return getRequest().getParameter(name);
  }

//  public Object getErrorObject() {
//    return this.errorObject;
//  }
//
//  public void setErrorObject(Object errorObject) {
//    this.errorObject = errorObject;
//  }

  protected Date getDateFromStr(String sendTime_str)
  {
    Date returnDate = null;
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    if ((sendTime_str == null) || (sendTime_str.equals("")))
    {
      return null;
    }
    try
    {
      returnDate = df.parse(sendTime_str);
    }
    catch (Exception e)
    {
      returnDate = null;
    }

    return returnDate;
  }

 
  public String getWorkflow() {
    return this.workflow;
  }

  public void setWorkflow(String workflow) {
    this.workflow = workflow;
  }

  protected String returnCommand(){
    return returnCommand(null); 
  }

  protected String returnCommand(String message) {
      if ((((this.ajax == null) || (!(this.ajax.trim().equals("1"))))) && (message == null))
        return "success";
      if (message == null) {
        return ajaxForwardSuccess("成功!");
      }
      return ajaxForwardError(message);
  }

  public void setAjax(String ajax)
  {
    this.ajax = ajax;
  }

  public int getStatusCode() {
    return this.statusCode;
  }

  public void setStatusCode(int statusCode) {
    this.statusCode = statusCode;
  }

  public String getTipsMessage() {
    return this.tipsMessage;
  }

  public void setTipsMessage(String tipsMessage) {
    this.tipsMessage = tipsMessage;
  }

  public String getForwardUrl() {
    return this.forwardUrl;
  }

  public void setForwardUrl(String forwardUrl) {
    this.forwardUrl = forwardUrl; }

  public String getTargetType() {
    if ((this.lookup != null) && (this.lookup.length() > 0)) {
      return "dialog";
    }
    return "navTab";
  }

  private String ajaxForward(int statusCode, String message) {
    this.statusCode = statusCode;
    this.tipsMessage = message;
    return "ajaxDone"; 
  }
  
  /**
   * ajax 提交后跳转
   * @param message
   * @return
   */
  public String ajaxForwardSuccess(String message) {
    return ajaxForward(200, message); 
  }

  /**
   * ajax 提交失败后跳转
   * @param message
   * @return
   */
  protected String ajaxForwardError(String message) {
    return ajaxForward(300, message);
  }

public int getPageNum() {
	return pageNum;
}

public void setPageNum(int pageNum) {
	this.pageNum = pageNum;
}

public int getNumPerPage() {
	return numPerPage > 0 ? numPerPage : 20;
}

public void setNumPerPage(int numPerPage) {
	this.numPerPage = numPerPage;
}

public String getOrderField() {
	return orderField;
}

public void setOrderField(String orderField) {
	this.orderField = orderField;
}

public String getOrderDirection() {
	return orderDirection;
}

public void setOrderDirection(String orderDirection) {
	this.orderDirection = orderDirection;
}

public String getKeywords() {
	return keywords;
}

public void setKeywords(String keywords) {
	this.keywords = keywords;
}

public int getTotalCount() {
	return totalCount;
}

public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
}

public String getCallbackType() {
	return callbackType;
}

public void setCallbackType(String callbackType) {
	this.callbackType = callbackType;
}

public String getRel() {
	return rel;
}

public void setRel(String rel) {
	this.rel = rel;
}

public String getNavTabId() {
	return navTabId;
}

public void setNavTabId(String navTabId) {
	this.navTabId = navTabId;
}






  
  
}


