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
					<label>邮箱：</label>
					<input type="text" name="userInvite.email" value="${userInvite.email}"/>
				</li>
				<li>
					<label>会员类型：</label>
					<select name="userInvite.memeberType">
						<option value="">All</option>
						<option value="1" ${'1' eq userInvite.memeberType ? 'selected="selected"' : ''}>天使</option>
						<option value="0" ${'0' eq userInvite.memeberType ? 'selected="selected"' : ''}>普通会员</option>
					</select>
				</li>  
        </ul>  
       <div class="subBar">
                  <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
                  </ul>
            </div>
    </div>  
</div> 
</form> 
<div class="pageContent">  
    <div class="panelBar">  
        <ul class="toolBar">  
                <li><a class="add"  mask="true" target="dialog" href="/sns/admin/userinvite/add.jsp"  ><span>
新建</span></a></li>  
				<li><a class="edit"  mask="true" target="dialog" href="/sns/admin/userInvite!edit.action?id={userInvite_uid}" ><span>
编辑</span></a></li> 
                <li><a class="delete" rel="ids" target="selectedTodo" postType="string" href="/sns/admin/userInvite!delete.action"  title="
确实要删除这些记录吗?"><span>批量删除</span></a></li>  
        </ul>  
    </div>  
    <table class="table" width="100%" layoutH="138" >  
        <thead>  
            <tr>
            	 <th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>id</th>
				<th width="200">邮箱</th>
				<th>验证码</th>
				<th>会员类型</th>
				<th>邀请发送者类型</th>
				<th>发送人name</th>
				<th>发送时间</th>
				<th width="70">操作</th>
				
            </tr>  
        </thead>                
        <tbody>  
            <c:forEach var="item" items="${userinviteLst}" varStatus="s">  
            <tr target="userInvite_uid" rel="${item.id}" >
            	<td><input name="ids" value="${item.id}" type="checkbox"></td>  
            	<td>${item.id}</td>
				<td>${item.email}</td>
				<td>${item.code}</td>
				<td>${'1' eq item.memeberType ? '天使' : '会员'}</td>
				<td>${'1' eq item.admin ? '管理员' : '普通用户'}</td>
				<td>${item.userName}</td>
				<td>${item.inviteTime}</td>
				<td>
					<a title="删除" target="ajaxTodo" href="/sns/admin/userInvite!delete.action?id=${item.id}" class="btnDel">删除</a>
					<a title="编辑" target="dialog" href="/sns/admin/userInvite!edit.action?id=${item.id}" class="btnEdit">编辑</a>
				</td>
				
            </tr>  
            </c:forEach>  
        </tbody>  
    </table>    
    <div class="panelBar">  
        <div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak
({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${totalCount}条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${totalRecords}" numPerPage="{numPerPage}" pageNumShown="10" 
currentPage="1"></div> 
    </div>  
</div>  