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
        	<li><label>关键字：</label> <input type="text"
					name="antiImg.imgName" value="${antiImg.imgName}" /></li>  
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
               <li><a class="add"  mask="true" target="dialog" href="/szrz/admin/antiimg/add.jsp"  ><span>
新建</span></a></li>  
				<li><a class="edit"  mask="true" target="dialog" href="/szrz/admin/antiImg!edit.action?id={antiImg_uid}" ><span>
编辑</span></a></li> 
                <li><a class="delete" rel="ids" target="selectedTodo" postType="string" href="/szrz/admin/antiImg!delete.action"  title="
确实要删除这些记录吗?"><span>批量删除</span></a></li> 
        </ul>  
    </div>  
    <table class="table" width="100%" layoutH="138" >  
        <thead>  
            <tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>id</th>
				<th>图像名称</th>
				<th>原始图片id</th>
				<th>新图片id</th>
				<th>类型Id</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>有效期</th>
				<th>拍摄地点</th>
				<th>拍摄时间</th>
				<th>用户Id</th>
				<th>用户名</th>
				<th>用户身份证</th>
				<th>售价</th>
				<th>话费金额</th>
				<th>认证时间</th>
				<th>状态</th>
				<th>编辑</th>
				
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
					<a title="删除" target="ajaxTodo" href="/sns/admin/antiImg!delete.action?id=${item.id}" class="btnDel">删除</a>
					<a title="编辑" target="dialog" href="/sns/admin/antiImg!edit.action?id=${item.id}" class="btnEdit">编辑</a>
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