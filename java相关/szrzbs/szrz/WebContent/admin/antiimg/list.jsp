<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%>  

<form id="pagerForm" method="post" action="/szrz/admin/antiImg!list.action">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="antiImg.imgName" value="${antiImg.imgName}" />
</form>

<form method="post" action="/szrz/admin/antiImg!list.action" onsubmit="return navTabSearch(this)">  
<div class="pageHeader">  
    <input type="hidden" name="pageNum" value="${pageNum}" />  
    <div class="searchBar">  
        <ul class="searchContent">  
        	<li><label>�ؼ��֣�</label> <input type="text"
					name="antiImg.imgName" value="${antiImg.imgName}" /></li>  
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
               <li><a class="add"  mask="true" target="dialog" href="/szrz/admin/antiimg/add.jsp"  ><span>
�½�</span></a></li>  
				<li><a class="edit"  mask="true" target="dialog" href="/szrz/admin/antiImg!edit.action?id={antiImg_uid}" ><span>
�༭</span></a></li> 
                <li><a class="delete" rel="ids" target="selectedTodo" postType="string" href="/szrz/admin/antiImg!delete.action"  title="
ȷʵҪɾ����Щ��¼��?"><span>����ɾ��</span></a></li> 
        </ul>  
    </div>  
    <table class="table" width="100%" layoutH="138" >  
        <thead>  
            <tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>id</th>
				<th>ͼ������</th>
				<th>ԭʼͼƬid</th>
				<th>��ͼƬid</th>
				<th>����Id</th>
				<th>��ʼʱ��</th>
				<th>����ʱ��</th>
				<th>��Ч��</th>
				<th>����ص�</th>
				<th>����ʱ��</th>
				<th>�û�Id</th>
				<th>�û���</th>
				<th>�û����֤</th>
				<th>�ۼ�</th>
				<th>���ѽ��</th>
				<th>��֤ʱ��</th>
				<th>״̬</th>
				<th>�༭</th>
				
            </tr>  
        </thead>                
        <tbody>  
            <c:forEach var="item" items="${antiImgLst}" varStatus="s">  
            <tr target="antiImg_uid" rel="${item.id}" >  
            	<td><input name="ids" value="${item.id}" type="checkbox"></td>
				<td>${item.id}</td>
				<td>${item.imgName}</td>
				<td>${item.oglPath}</td>
				<td>${item.path}</td>
				<td>${item.typeId}</td>
				<td>${item.startDate}</td>
				<td>${item.endDate}</td>
				<td>${item.validDate}</td>
				<td>${item.shootPlace}</td>
				<td>${item.shootTime}</td>
				<td>${item.userId}</td>
				<td>${item.userName}</td>
				<td>${item.userIdCard}</td>
				<td>${item.valueCoin}</td>
				<td>${item.spendCoin}</td>
				<td>${item.antiTime}</td>
				<td>${item.status}</td>
				<td>
					<a title="ɾ��" target="ajaxTodo" href="/sns/admin/antiImg!delete.action?id=${item.id}" class="btnDel">ɾ��</a>
					<a title="�༭" target="dialog" href="/sns/admin/antiImg!edit.action?id=${item.id}" class="btnEdit">�༭</a>
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