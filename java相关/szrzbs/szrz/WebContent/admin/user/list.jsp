<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%>  

<form id="pagerForm" method="post" action="user!list.action">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="user.name" value="${user.name}" />
</form>

<form method="post" action="user!list.action" onsubmit="return navTabSearch(this)">  
<div class="pageHeader">  
    <input type="hidden" name="pageNum" value="${pageNum}" />  
    <div class="searchBar">  
        <ul class="searchContent">    
        	 <li><label>�ؼ��֣�</label> <input type="text"
					name="user.name" value="${user.name}" /></li>  
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
               <li><a class="add"  mask="true" target="dialog" href="user/add.jsp"  ><span>
�½�</span></a></li>  
				<li><a class="edit"  mask="true" target="dialog" href="user!edit.action?id={user_uid}" ><span>
�༭</span></a></li> 
                <li><a class="delete" rel="ids" target="selectedTodo" postType="string" href="user!delete.action"  title="
ȷʵҪɾ����Щ��¼��?"><span>����ɾ��</span></a></li> 
        </ul>  
    </div>  
    <table class="table" width="100%" layoutH="138" >  
        <thead>  
            <tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>id</th>
				<th>�ǳ�</th>
				<th>�û�����</th>
				<th>���֤</th>
				<th>����</th>
				<th>����</th>
				<th>����</th>
				<th>�Ա�</th>
				<th>ְҵ</th>
				<th>���</th>
				<th>״̬</th>
				<th>ע��ʱ��</th>
				<th>��¼����</th>
				<th>�༭</th>
				
            </tr>  
        </thead>                
        <tbody>  
            <c:forEach var="item" items="${userLst}" varStatus="s">  
            <tr target="user_uid" rel="${item.id}" >  
            	<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.id}</td>
				<td>${item.nick}</td>
				<td>${item.name}</td>
				<td>${item.idCard}</td>
				<td>${item.passward}</td>
				<td>${item.email}</td>
				<td>${item.age}</td>
				<td>${item.male}</td>
				<td>${item.userWork}</td>
				<td>${item.goldCoin}</td>
				<td>${item.status}</td>
				<td>${item.regTime}</td>
				<td>${item.loginCount}</td>
				<td>
					<a title="ɾ��" target="ajaxTodo" href="user!delete.action?id=${item.id}" class="btnDel">ɾ��</a>
					<a title="�༭" target="dialog" href="user!edit.action?id=${item.id}" class="btnEdit">�༭</a>
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