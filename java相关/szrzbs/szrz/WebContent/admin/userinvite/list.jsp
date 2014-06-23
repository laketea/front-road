<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%>  

<form id="pagerForm" method="post" action="/sns/admin/userInvite!list.action">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="userInvite.email" value="${userInvite.email}" />
	<input type="hidden" name="userInvite.memeberType" value="${userInvite.memeberType}" />
</form>
<form method="post" action="/sns/admin/userInvite!list.action" onsubmit="return navTabSearch(this)"> 
<div class="pageHeader">  
    <input type="hidden" name="pageNum" value="${pageNum}" />  
    <div class="searchBar">  
        <ul class="searchContent">   
        <li>
					<label>���䣺</label>
					<input type="text" name="userInvite.email" value="${userInvite.email}"/>
				</li>
				<li>
					<label>��Ա���ͣ�</label>
					<select name="userInvite.memeberType">
						<option value="">All</option>
						<option value="1" ${'1' eq userInvite.memeberType ? 'selected="selected"' : ''}>��ʹ</option>
						<option value="0" ${'0' eq userInvite.memeberType ? 'selected="selected"' : ''}>��ͨ��Ա</option>
					</select>
				</li>  
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
                <li><a class="add"  mask="true" target="dialog" href="/sns/admin/userinvite/add.jsp"  ><span>
�½�</span></a></li>  
				<li><a class="edit"  mask="true" target="dialog" href="/sns/admin/userInvite!edit.action?id={userInvite_uid}" ><span>
�༭</span></a></li> 
                <li><a class="delete" rel="ids" target="selectedTodo" postType="string" href="/sns/admin/userInvite!delete.action"  title="
ȷʵҪɾ����Щ��¼��?"><span>����ɾ��</span></a></li>  
        </ul>  
    </div>  
    <table class="table" width="100%" layoutH="138" >  
        <thead>  
            <tr>
            	 <th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>id</th>
				<th width="200">����</th>
				<th>��֤��</th>
				<th>��Ա����</th>
				<th>���뷢��������</th>
				<th>������name</th>
				<th>����ʱ��</th>
				<th width="70">����</th>
				
            </tr>  
        </thead>                
        <tbody>  
            <c:forEach var="item" items="${userinviteLst}" varStatus="s">  
            <tr target="userInvite_uid" rel="${item.id}" >
            	<td><input name="ids" value="${item.id}" type="checkbox"></td>  
            	<td>${item.id}</td>
				<td>${item.email}</td>
				<td>${item.code}</td>
				<td>${'1' eq item.memeberType ? '��ʹ' : '��Ա'}</td>
				<td>${'1' eq item.admin ? '����Ա' : '��ͨ�û�'}</td>
				<td>${item.userName}</td>
				<td>${item.inviteTime}</td>
				<td>
					<a title="ɾ��" target="ajaxTodo" href="/sns/admin/userInvite!delete.action?id=${item.id}" class="btnDel">ɾ��</a>
					<a title="�༭" target="dialog" href="/sns/admin/userInvite!edit.action?id=${item.id}" class="btnEdit">�༭</a>
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