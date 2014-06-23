<%@ page language="java" pageEncoding="GBK"
	contentType="text/html;charset=GBK"%>
<%@ include file="/admin/common/include.jsp"%>

<form id="pagerForm" method="post"
	action="/sns/admin/userInfo!list.action">
	<input type="hidden" name="pageNum" value="1" /> 
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="userInfo.nick" value="${userInfo.nick}" />
	<input type="hidden" name="userInfo.status" value="${userInfo.status}" />
</form>

<form method="post" action="/sns/admin/userInfo!list.action"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<input type="hidden" name="pageNum" value="${pageNum}" />
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>�ؼ��֣�</label> <input type="text"
					name="userInfo.nick" value="${userInfo.nick}" /></li>
				<li><label>��Ա���ͣ�</label> <select name="userInfo.status">
						<option value="">����</option>
						<option value="1"
							${'0' eq userInfo.status ? 'selected="selected"' : ''}>�����</option>
						<option value="1"
							${'1' eq userInfo.status ? 'selected="selected"' : ''}>����</option>
						<option value="2"
							${'2' eq userInfo.status ? 'selected="selected"' : ''}>����</option>
				</select></li>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">����</button>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" mask="true" target="dialog"
				href="/sns/admin/userinfo/add.jsp"><span> �½�</span></a></li>
			<li><a class="edit" mask="true" target="dialog"
				href="/sns/admin/userInfo!edit.action?id={userInfo_uid}"><span>
						�༭</span></a></li>
			<li><a class="delete" rel="ids" target="selectedTodo"
				postType="string" href="/sns/admin/userInfo!delete.action"
				title="
ȷʵҪɾ����Щ��¼��?"><span>����ɾ��</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th>�ǳ�</th>
				<th>����</th>
				<th>�绰</th>
				<th>�Ա�</th>
				<th>��ѧ</th>
				<th>��˾</th>
				<th>qq����</th>
				<th>sina΢��</th>
				<th width="170px">ע��ʱ��</th>
				<th>״̬</th>
				<th>�༭</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${userInfoLst}" varStatus="s">
				<tr target="userInfo_uid" rel="${item.id}">
					<td><input name="ids" value="${item.id}" type="checkbox"></td>
					<td>${item.nick}</td>
					<td>${item.email}</td>
					<td>${item.phone}</td>
					<td>${'1' eq item.male ? '��' : 'Ů'}</td>
					<td>${item.university}</td>
					<td>${item.company}</td>
					<td>${item.qq}</td>
					<td>${item.micblog}</td>
					<td>${item.regTime}</td>
					<td>${'0' eq item.status ? '�����' : ''}${'2' eq item.status ? '�� &nbsp;&nbsp; ��' : ''}${'1' eq item.status ? '�� &nbsp;&nbsp; ʽ' : ''}&nbsp;&nbsp;
					<c:if test="${item.status=='0'}">
						<a  target="ajaxTodo"
						href="/sns/admin/userInfo!verify.action?id=${item.id}">[��֤]</a>
					</c:if>
					<c:if test="${item.status!='0'}">
					<a  target="ajaxTodo"
						href="/sns/admin/userInfo!${'2' eq item.status ? 'enable' : 'disable'}.action?id=${item.id}">[${'2' eq item.status ? '����' : '����'}]</a>
					</c:if>	
					</td>
					<td><a title="ɾ��" target="ajaxTodo"
						href="/sns/admin/userInfo!delete.action?id=${item.id}"
						class="btnDel">ɾ��</a> <a title="�༭" target="dialog"
						href="/sns/admin/userInfo!edit.action?id=${item.id}"
						class="btnEdit">�༭</a></td>

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
