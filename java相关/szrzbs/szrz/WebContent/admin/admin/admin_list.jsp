<%@ page language="java" pageEncoding="GBK"
	contentType="text/html;charset=GBK"%>
<%@ include file="/admin/common/include.jsp"%>

<form id="pagerForm" method="post" action="/szrz/admin/adminList.action">
	<input type="hidden" name="pageNum" value="1" /> <input type="hidden"
		name="numPerPage" value="${numPerPage}" />
</form>

<form method="post" action="/szrz/admin/adminList.action"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<div class="searchBar">
			<ul class="searchContent">
			</ul>
			<div class="subBar">
				<div class="buttonActive">
					<div class="buttonContent">
						<button type="submit">��ѯ</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" mask="true" target="dialog"
				href="/szrz/admin/admin/add.jsp"><span> �½�</span></a></li>
			<li><a class="edit" mask="true" target="dialog"
				href="/szrz/admin/admin!edit.action?id={admin_uid}"><span>
						�༭</span></a></li>
			<li><a class="delete" target="ajaxTodo"
				href="/szrz/admin/admin!delete.action?id={admin_uid}"
				title="
ȷʵҪɾ����¼��?"><span>ɾ��</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="22">1</th>
				<th>�˻���</th>
				<th>�˻�����</th>
				<th>��������Ա</th>
				<th>����ʱ��</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${adminLst}" varStatus="s">
				<tr target="admin_uid" rel="${item.id}">
					<td>1</td>
					<td>${item.name}</td>
					<td>${item.pwd}</td>
					<td>${item.supers}</td>
					<td>${item.createDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>��ʾ</span> <select class="combox" name="numPerPage"
				onchange="navTabPageBreak

({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select> <span>������${totalCount}��</span>
		</div>
		<div class="pagination" targetType="navTab"
			totalCount="${totalRecords}" numPerPage="{numPerPage}"
			pageNumShown="10" currentPage="1"></div>
	</div>
</div>
