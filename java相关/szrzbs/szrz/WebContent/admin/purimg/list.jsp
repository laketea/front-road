<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%>  

<form id="pagerForm" method="post" action="/szrz/admin/purImg!list.action">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="purImg.imgName" value="${purImg.imgName}" />
</form>

<form method="post" action="/szrz/admin/purImg!list.action" onsubmit="return navTabSearch(this)">  
<div class="pageHeader">  
    <input type="hidden" name="pageNum" value="${pageNum}" />  
    <div class="searchBar">  
        <ul class="searchContent">  
        	<li><label>�ؼ��֣�</label> <input type="text"
					name="purImg.imgName" value="${purImg.imgName}" /></li>   
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
               <li><a class="add"  mask="true" target="dialog" href="/szrz/admin/purimg/add.jsp"  ><span>
�½�</span></a></li>  
				<li><a class="edit"  mask="true" target="dialog" href="/szrz/admin/purImg!edit.action?id={purImg_uid}" ><span>
�༭</span></a></li> 
                <li><a class="delete" rel="ids" target="selectedTodo" postType="string" href="/szrz/admin/purImg!delete.action"  title="
ȷʵҪɾ����Щ��¼��?"><span>����ɾ��</span></a></li> 
        </ul>  
    </div>  
    <table class="table" width="100%" layoutH="138" >  
        <thead>  
            <tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>ͼ������</th>
				<th>��ַ</th>
				<th>��������</th>
				<th>������names</th>
				<th>�������û����֤</th>
				<th>����ʱ��</th>
				<th>�ۼ�</th>
				<th>����ص�</th>
				<th>����ʱ��</th>
				<th>�û���</th>
				<th>�û����֤</th>
				<th>״̬</th>
				<th>�༭</th>
				
            </tr>  
        </thead>                
        <tbody>  
            <c:forEach var="item" items="${purImgLst}" varStatus="s">  
            <tr target="purImg_uid" rel="${item.id}" >  
            	<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.imgName}</td>
				<td>${item.path}</td>
				<td>${item.typeName}</td>
				<td>${item.purUserName}</td>
				<td>${item.purUserIdCard}</td>
				<td>${item.purTime}</td>
				<td>${item.valueCoin}</td>
				<td>${item.shootPlace}</td>
				<td>${item.shootTime}</td>
				<td>${item.userName}</td>
				<td>${item.userIdCard}</td>
				<td>${item.status}</td>
				<td>
					<a title="ɾ��" target="ajaxTodo" href="/szrz/admin/purImg!delete.action?id=${item.id}" class="btnDel">ɾ��</a>
					<a title="�༭" target="dialog" href="/szrz/admin/purImg!edit.action?id=${item.id}" class="btnEdit">�༭</a>
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