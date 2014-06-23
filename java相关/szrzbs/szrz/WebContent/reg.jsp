<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>数字防伪认证</title>
    <link type="text/css" rel="stylesheet" href="css/css.css"/>
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
</head>
<script>
    $(document).ready(function () {
    });
</script>
<body>

<%@include file="head.jsp"%>

<div class="main">
    <div class="main_left l">
        <div class="nav_title">
            <h2>用户注册</h2>

            <p>Register</p>

        </div>
        <ul>
            <li flag="1334826892978320" class="depth_1">
                <ul style="" class="nav2_list">
                    <li flag="1334828962169537" class="depth_2">
                        <div class="nav2_bg"><a target="_self"
                                                href="reg.jsp"
                                                class="lv2btn nav2_off"><span>用户注册</span></a></div>

                    </li>
                  
                </ul>
            </li>
        </ul>
        <ul class="kuaisu">
            <li><a href="?classid=1335283079098597"><img width="188" height="54"
                                                         src="img/pic1.jpg"></a>
            </li>
            <li><a href="?classid=1335283111680998"><img width="188" height="54"
                                                         src="img/pic2.jpg"></a>
            </li>
            <li><a href="?classid=1335283159771390"><img width="188" height="54"
                                                         src="img/pic3.jpg"></a>
            </li>
        </ul>
    </div>
    <div class="main_right r">
        <div class="main_title">当前位置：首页 <label class="nav_sep_color"> &gt;&gt; </label><label class="nav_has_no_link">用户注册</label>
             </div>
        <div id="content" class="main_con">
       
            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                <tbody><tr>
                    <td align="center" class="about-content" >
                     <form action="user!reg.action" method="post">
                  		<table width="80%">
                  			<tr>
                  				<td  align="right"></td>
                  				<td colspan="3"><span style="color:red">${errMsg}</span></td>
                  				
                  			</tr>
                  			<tr>
                  				<td width="120px" align="right">用户名:</td>
                  				<td width="15px"></td>
                  				<td><input type="text" name="user.nick" size="20" >*</td>
                  				<td></td>
                  			</tr>
                  			<tr>
                  				<td  align="right">真实姓名:</td>
                  				<td></td>
                  				<td><input type="text" name="user.name" size="20" >*</td>
                  				<td></td>
                  			</tr>
                  			<tr>
                  				<td  align="right">身份证:</td>
                  				<td></td>
                  				<td><input type="text" name="user.idCard" size="35" >*</td>
                  				<td></td>
                  			</tr>
                  			<tr>
                  				<td  align="right">年龄:</td>
                  				<td></td>
                  				<td><input type="text" name="user.age" >*</td>
                  				<td></td>
                  			</tr>
                  			<tr>
                  				<td  align="right">性别:</td>
                  				<td></td>
                  				<td><select name="user.male" >
                  					<option value="0">男</option>
                  					<option value="1">女</option>
                  				</select>*</td>
                  				<td></td>
                  			</tr>
                  			<tr>
                  				<td  align="right" >邮箱:</td>
                  				<td></td>
                  				<td><input type="text" name="user.email" size="40" >*</td>
                  				<td></td>
                  			</tr>
                  			<tr>
                  				<td  align="right" >密码:</td>
                  				<td></td>
                  				<td><input type="password" class="pwd" name="user.password" size="25" >*</td>
                  				<td></td>
                  			</tr>
                  			<tr>
                  				<td  align="right">确认密码:</td>
                  				<td></td>
                  				<td><input type="password" class="checkpwd" name="" size="25" >*</td>
                  				<td></td>
                  			</tr>
                  			<tr>
                  				<td></td>
                  				<td></td>
                  				<td><input type="submit" value="注册"></td>
                  				<td></td>
                  			</tr>
                  			
                  			
                  		
                  		</table>
                  		</form>
                  		
                    </td>
                </tr>
                <script>
                $("td").css("height","35px");
                $("input").css("height","22px");
                $("input").css("line-height","22px");
                </script>
                <tr>
                    <td align="center" class="news_info">
                       
                    </td>
                </tr>
               
                <!--邻近新闻开始-->
               
                <!--邻近新闻结束-->


                <!--相关新闻开始-->
                <!--相关新闻结束-->

                <!--新闻评论开始-->
                <!--新闻评论结束-->
                </tbody></table>

        </div>
    </div>
    <div class="clr"></div>
</div>

<%@include file="bottom.jsp"%>
</body>
</html>