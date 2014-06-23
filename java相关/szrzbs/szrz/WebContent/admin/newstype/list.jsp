<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%>  

<form id="pagerForm" method="post" action="/szrz/admin/newsType!list.action">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
</form>

<form method="post" action="/szrz/admin/newsType!list.action" onsubmit="return navTabSearch(this)">  
<div class="pageHeader">  
    <input type="hidden" name="pageNum" value="${pageNum}" />  
    <div class="searchBar">  
        <ul class="searchContent">    
        </ul>  
       <div class="subBar">
                  <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit">����</button></div></div></li>
                  </ul>
            </div>
    </div>  
</div>  
</form>
<div class="pageContent">  
    <div class="panelBar">  
        <ul class="toolBar">  
               <li><a class="add"  mask="true" target="dialog" href="/szrz/admin/newstype/add.jsp"  ><span>
�½�</span></a></li>  
				<li><a class="edit"  mask="true" target="dialog" href="/szrz/admin/newsType!edit.action?id={newsType_uid}" ><span>
�༭</span></a></li> 
                <li><a class="delete" rel="ids" target="selectedTodo" postType="string" href="/szrz/admin/newsType!delete.action"  title="
ȷʵҪɾ����Щ��¼��?"><span>����ɾ��</span></a></li> 
        </ul>  
    </div>  
    <table class="table" width="100%" layoutH="138" >  
        <thead>  
            <tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>id</th>
				<th>��������</th>
				<th>ӵ����������</th>
				<th>״̬</th>
				<th>�༭</th>
				
            </tr>  
        </thead>                
        <tbody>  
            <c:forEach var="item" items="${newsTypeLst}" varStatus="s">  
            <tr target="newsType_uid" rel="${item.id}" >  
            	<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.newsCount}</td>
				<td>${item.status}</td>
				<td>
					<a title="ɾ��" target="ajaxTodo" href="/szrz/admin/newsType!delete.action?id=${item.id}" class="btnDel">ɾ��</a>
					<a title="�༭" target="dialog" href="/szrz/admin/newsType!edit.action?id=${item.id}" class="btnEdit">�༭</a>
				</td>
				
            </tr>  
            </c:forEach>  
        </tbody>  
    </table>    
    <div class="panelBar">  
        <div class="pages">
			<span>��ʾ</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak
({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>������${totalCount}��</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${totalRecords}" numPerPage="{numPerPage}" pageNumShown="10" 
currentPage="1"></div> 
    </div>  
</div>  