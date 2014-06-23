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
        	 <li><label>关键字：</label> <input type="text"
					name="user.name" value="${user.name}" /></li>  
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
               <li><a class="add"  mask="true" target="dialog" href="user/add.jsp"  ><span>
新建</span></a></li>  
				<li><a class="edit"  mask="true" target="dialog" href="user!edit.action?id={user_uid}" ><span>
编辑</span></a></li> 
                <li><a class="delete" rel="ids" target="selectedTodo" postType="string" href="user!delete.action"  title="
确实要删除这些记录吗?"><span>批量删除</span></a></li> 
        </ul>  
    </div>  
    <table class="table" width="100%" layoutH="138" >  
        <thead>  
            <tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>id</th>
				<th>昵称</th>
				<th>用户姓名</th>
				<th>身份证</th>
				<th>密码</th>
				<th>邮箱</th>
				<th>年龄</th>
				<th>性别</th>
				<th>职业</th>
				<th>金币</th>
				<th>状态</th>
				<th>注册时间</th>
				<th>登录次数</th>
				<th>编辑</th>
				
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
					<a title="删除" target="ajaxTodo" href="user!delete.action?id=${item.id}" class="btnDel">删除</a>
					<a title="编辑" target="dialog" href="user!edit.action?id=${item.id}" class="btnEdit">编辑</a>
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