

var nowid;

var totalid;

var can1press = false;

var emailafter;

var emailbefor;

$(document).ready(function(){

    $("#me").focus(function(){ //�ı����ý��㣬����Email��ʾ��

        $("#myemail").remove();

$(this).after("<div id='myemail' style='width:170px; height:auto; background:#fff; color:#6B6B6B; position:absolute; left:"+$(this).get(0).offsetLeft+"px; top:"+($(this).get(0).offsetTop+$(this).height()+2)+"px; border:1px solid #ccc;z-index:5px; '></div>");

        if($("#myemail").html()){

             $("#myemail").css("display","block");

$(".newemail").css("width",$("#myemail").width());

can1press = true;

        } else {

             $("#myemail").css("display","none");

can1press = false;

        }

    }).keyup(function(){ //�ı�����������ʱ����ʾEmail��ʾ��ͳ���Email

var press = $("#me").val();

if (press!="" || press!=null){

var emailtxt = "";

var emailvar = new Array("@163.com","@126.com","@yahoo.com","@qq.com","@sina.com","@gmail.com","@hotmail.com","@foxmail.com");

totalid = emailvar.length;

var emailmy = "<div class='newemail' style='width:170px; color:#6B6B6B; overflow:hidden;'><font color='#D33022'>" + press + "</font></div>";

if(!(isEmail(press))){

   for(var i=0; i<emailvar.length; i++) {

   emailtxt = emailtxt + "<div class='newemail' style='width:170px; color:#6B6B6B; overflow:hidden;'><font color='#D33022'>" + press + "</font>" + emailvar[i] + "</div>"

   }

} else {

   emailbefor = press.split("@")[0];

   emailafter = "@" + press.split("@")[1];

   for(var i=0; i<emailvar.length; i++) {

        var theemail = emailvar[i];

        if(theemail.indexOf(emailafter) == 0)

        {

        emailtxt = emailtxt + "<div class='newemail' style='width:170px; color:#6B6B6B; overflow:hidden;'><font color='#D33022'>" + emailbefor + "</font>" + emailvar[i] + "</div>"

    }

   }

}

$("#myemail").html(emailmy+emailtxt);

if($("#myemail").html()){

$("#myemail").css("display","block");

$(".newemail").css("width",$("#myemail").width());

can1press = true;

} else {

$("#myemail").css("display","none");

can1press = false;

}

beforepress = press;

}

if (press=="" || press==null){

   $("#myemail").html("");

    $("#myemail").css("display","none");    

}

    })

$(document).click(function(){ //�ı���ʧ��ʱɾ����

        if(can1press){

$("#myemail").remove();

can1press = false;

if($("#me").focus()){

   can1press = false;

}

}

    })

    $(".newemail").live("mouseover",function(){ //��꾭����ʾEmailʱ����������Email

        $(".newemail").css("background","#FFF");

        $(this).css("background","#CACACA");

$(this).focus();

nowid = $(this).index();

    }).live("click",function(){ //�����Emailʱ���ı��������滻�ɸ���Email����ɾ����ʾ��

        var newhtml = $(this).html();

        newhtml = newhtml.replace(/<.*?>/g,"");

        $("#me").val(newhtml); 

        $("#myemail").remove();

    })

$(document).bind("keydown",function(e)  

{     

if(can1press){

switch(e.which)     

{            

case 38:

if (nowid > 0){

$(".newemail").css("background","#FFF");

$(".newemail").eq(nowid).prev().css("background","#CACACA").focus();

nowid = nowid-1;

}

if(!nowid){

nowid = 0;

$(".newemail").css("background","#FFF");

$(".newemail").eq(nowid).css("background","#CACACA");

$(".newemail").eq(nowid).focus();

}

break;       

 

case 40:

if (nowid < totalid){

$(".newemail").css("background","#FFF");

$(".newemail").eq(nowid).next().css("background","#CACACA").focus();

nowid = nowid+1;

}

if(!nowid){

nowid = 0;

$(".newemail").css("background","#FFF");

$(".newemail").eq(nowid).css("background","#CACACA");

$(".newemail").eq(nowid).focus();

}

break;  

 

case 13:

var newhtml = $(".newemail").eq(nowid).html();

newhtml = newhtml.replace(/<.*?>/g,"");

$("#me").val(newhtml); 

$("#myemail").remove();

}

}   

})

}) 

//���email����

function isEmail(str){

    if(str.indexOf("@") > 0)     

    {     

        return true;

    } else {

        return false;

    }

}

