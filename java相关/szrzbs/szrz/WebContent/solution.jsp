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
            <h2>解决方案</h2>

            <p>Solution</p>

        </div>
        <ul>
            <li flag="1334826892978320" class="depth_1">
                <ul style="" class="nav2_list">
                    <li flag="1334828962169537" class="depth_2">
                        <div class="nav2_bg"><a target="_self"
                                                href="solution.jsp"
                                                class="lv2btn nav2_off"><span>解决方案</span></a></div>

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
        <div class="main_title">当前位置：首页 <label class="nav_sep_color"> &gt;&gt; </label><label class="nav_has_no_link">解决方案</label>
             </div>
        <div id="content" class="main_con">
            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                <tbody><tr>
                    <td align="left" class="about-content" >
                    
                    <p >
                    	

<h4>一、方案背景</h4>

　　近年来，电子政务稳步展开，成为转变政府职能、提高行政效率、推进政务公开的有效手段。随着移动通信技术的普及，各级政府、各政府委办局对于移动办公需求日益强烈，特别对于生产、食品等与民众生产生活相关的业务以及政府监管类的移动办公需求十分迫切，政务处理的移动信息化已经从办公领域延伸到行政监督甚至执法领域。

　　然而，随着移动终端应用在电子政务领域不断推广，所面临的安全需求也日益迫切，针对移动应用和电子政务的业务特点，提出基于PKI密码技术体系的强身份认证、通道加密以及抗抵赖性的安全认证解决方案，有效提供安全、可信的网络信任机制，迅速提升整个移动电子政务信息安全防护能力。


<h4>二、需求分析</h4>

　　1、真实性需求</br>

　　移动终端更易丢失、被他人盗用，由此可能带来对信息的非法使用和责任无法认定的问题。因此，必须基于可靠的认证机制。</br>

　　2、信息的机密性和完整性需求</br>

　　在引入新的信息通道时，必须仍然保持不低于原有方式的安全性要求，以避免安全短板的出现，造成所处理的敏感政务信息的泄漏和篡改。在信息的传输、本机业务处理过程中，必须保证数据的机密性和完整性，防止信息被窃听或被篡改。</br>

　　3、可核查性要求</br>

　　移动业务处理方式同样不能降低行为人的责任意识，必须建立起一套有效地责任认定机制，确保发生纠纷或事故时，能够有效地追踪和认定相关责任。</br>

　　4、可控性要求</br>

　　政务信息、文件、通讯录等信息较为敏感，一旦手机丢失，极有可能产生不好的社会影响，同时，也会对政务业务开展带来不便。因此，既要保证这些信息的可控性，又要确保业务开展的可持续性。

　　5、可用性要求</br>

　　安全性设计不能以过多的牺牲可用性为代价，在确保足够安全强度的前提下，必须保证业务开展的可用性</br>


<h4>三、方案简介</h4>

　　根据上述的需求分析，我们提出了方案的总体设计思想，具体如下：</br>

　　（1）依托电子签名法，采用拥有《电子认证服务许可证》的合法第三方电子认证服务机构来完成数字证书的签发和管理。</br>

　　（2）提供智能终端环境下的证书应用中间件，实现数字证书在无线应用中的无缝集成，从而实现无线应用的身份认证，确保信息的保密性和完整性，在关键业务环境实现数字签名技术，防止抵赖，建立安全可靠的责任认定机制。</br>

　　（3）针对专用客户端软件，为了解决客户端证书申请、使用和证书生命周期管理的方便性，可以根据业务需求考虑在智能终端应用中嵌入认证模块，方便终端用户方便获取和使用数字证书服务。</br>

　　（4）根据用户的不同需求，数字证书可支持文件形式的软证书方式和智能SD卡、智能TF卡等硬介质方式。</br>


<h4>四、方案特点</h4>

　　（1）依托第三方电子认证服务，确保业务数据具有法律效力：2005年电子签名法颁布实施后，根据电子签名法和电子认证机构管理办法的有关规定，只有获得电子认证服务许可证的第三方认证机构提供的电子认证服务才是合法的，只有严格按照电子签名法要求产生的电子签名才具有真正的法律效力。</br>

　　（2）基于PKI/CA体系安全解决方案：为了实现智能终端用户的强身份认证，对敏感数据的安全保护，在交易关键操作引入责任认定和抗抵赖机制，我们采用PKI密码技术体系，它是目前能够全面解决信息安全问题最为有效，使用最为广泛，技术最成熟的解决方案。</br>

　　（3）支持硬件介质存储：在客户端认证方面，支持智能SD卡/智能TF卡作为数字证书的存储介质，该智能SD卡内含密码运算芯片，证书密钥在卡内产生和存储，所有签名操作都在卡内进行，具有良好安全性，同时，该硬件介质还具有防止拷贝、连续多次密码出错即可安全锁定等高安全功能。</br>

　　（4）成熟的证书应用中间件：BJCA自主研发的智能终端环境下的证书应用中间件具有安全完备、使用透明、性能高效的特点，在密码服务层支持PKCS#11、CSP通用标准，在客户端支持B/S和C/S应用模式以及文件证书和硬介质证书，在服务器端支持Windows、Linux、Aix、Solaris等不同操作系统和硬件加密设备，可以很好满足数字证书在无线应用领域的高安全、高可靠的需要。


<h4>五、产品清单</h4>

　　－　数字证书</br>

　　－　手机智能存储卡（智能SD卡/智能TF卡）</br>

　　－　移动智能终端证书应用中间件</br>
                    	
                    </p>
                    </td>
                </tr>
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