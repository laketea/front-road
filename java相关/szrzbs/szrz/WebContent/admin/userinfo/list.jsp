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
				<li><label>关键字：</label> <input type="text"
					name="userInfo.nick" value="${userInfo.nick}" /></li>
				<li><label>会员类型：</label> <select name="userInfo.status">
						<option value="">所有</option>
						<option value="1"
							${'0' eq userInfo.status ? 'selected="selected"' : ''}>待审核</option>
						<option value="1"
							${'1' eq userInfo.status ? 'selected="selected"' : ''}>正常</option>
						<option value="2"
							${'2' eq userInfo.status ? 'selected="selected"' : ''}>禁用</option>
				</select></li>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
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
				href="/sns/admin/userinfo/add.jsp"><span> 新建</span></a></li>
			<li><a class="edit" mask="true" target="dialog"
				href="/sns/admin/userInfo!edit.action?id={userInfo_uid}"><span>
						编辑</span></a></li>
			<li><a class="delete" rel="ids" target="selectedTodo"
				postType="string" href="/sns/admin/userInfo!delete.action"
				title="
确实要删除这些记录吗?"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th>昵称</th>
				<th>邮箱</th>
				<th>电话</th>
				<th>性别</th>
				<th>大学</th>
				<th>公司</th>
				<th>qq号码</th>
				<th>sina微博</th>
				<th width="170px">注册时间</th>
				<th>状态</th>
				<th>编辑</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${userInfoLst}" varStatus="s">
				<tr target="userInfo_uid" rel="${item.id}">
					<td><input name="ids" value="${item.id}" type="checkbox"></td>
					<td>${item.nick}</td>
					<td>${item.email}</td>
					<td>${item.phone}</td>
					<td>${'1' eq item.male ? '男' : '女'}</td>
					<td>${item.university}</td>
					<td>${item.company}</td>
					<td>${item.qq}</td>
					<td>${item.micblog}</td>
					<td>${item.regTime}</td>
					<td>${'0' eq item.status ? '待审核' : ''}${'2' eq item.status ? '禁 &nbsp;&nbsp; 用' : ''}${'1' eq item.status ? '正 &nbsp;&nbsp; 式' : ''}&nbsp;&nbsp;
					<c:if test="${item.status=='0'}">
						<a  target="ajaxTodo"
						href="/sns/admin/userInfo!verify.action?id=${item.id}">[验证]</a>
					</c:if>
					<c:if test="${item.status!='0'}">
					<a  target="ajaxTodo"
						href="/sns/admin/userInfo!${'2' eq item.status ? 'enable' : 'disable'}.action?id=${item.id}">[${'2' eq item.status ? '启用' : '禁用'}]</a>
					</c:if>	
					</td>
					<td><a title="删除" target="ajaxTodo"
						href="/sns/admin/userInfo!delete.action?id=${item.id}"
						class="btnDel">删除</a> <a title="编辑" target="dialog"
						href="/sns/admin/userInfo!edit.action?id=${item.id}"
						class="btnEdit">编辑</a></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span> <select class="combox" name="numPerPage"
				onchange="navTabPageBreak
({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select> <span>条，共${totalCount}条</span>
		</div>
		<div class="pagination" targetType="navTab"
			totalCount="${totalRecords}" numPerPage="{numPerPage}"
			pageNumShown="10" currentPage="1"></div>
	</div>
</div>
