// JavaScript Document
//***************************************************�û�ע�����֤
function checkform_reg(){
	if (document.form1.name.value=="") {      
		alert("����������!");
		document.form1.name.focus();        
		return false;
	} 
	if (document.form1.author.value=="") {      
		alert("����������!");
		document.form1.author.focus();        
		return false;
	}
	if (document.form1.company.value=="") {      
		alert("�����������!");
		document.form1.company.focus();        
		return false;
	}
	if (document.form1.grade.value=="") {      
		alert("��ѡ���꼶!");
		document.form1.grade.focus();        
		return false;
	}
	if (document.form1.subject.value=="") {      
		alert("��ѡ���Ŀ!");
		document.form1.subject.focus();        
		return false;
	}
	if (document.form1.version.value=="") {      
		alert("������汾!");
		document.form1.version.focus();        
		return false;
	}
	if (document.form1.price.value=="") {      
		alert("������۸�!");
		document.form1.price.focus();        
		return false;
	}
	if (document.form1.isbn.value=="") {      
		alert("������ISBN!");
		document.form1.isbn.focus();        
		return false;
	}
	if (document.form1.size.value=="") {      
		alert("������װ֡/����!");
		document.form1.size.focus();        
		return false;
	}
	if (document.form1.createdate.value=="") {      
		alert("�������������!");
		document.form1.createdate.focus();        
		return false;
	}
     var regImg = new RegExp(/\.(gif|GIF|jpg|JPG|jpeg|JPEG)$/);
    var obj=document.getElementById('photo').value;
    if(obj.match(regImg)){    
    }else{
        alert('���ϴ�ͼƬ��ʽ�ļ�');
        document.getElementById('photo').focus();
        return false;
    }

}
//////////////////////////////////////////////////////////////////
function isEmail(strEmail) {
if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-

9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
return true;
else
alert("oh");
}

///////////////////////////////////////////////////////
function showsubmenum()
{
if (document.getElementById("mmls").style.display == "none")
{
document.getElementById("mmls").style.display ="block";
document.getElementById("mml").style.display ="none";
}
else
{
document.getElementById("mmls").style.display ="none";
document.getElementById("mml").style.display ="";
}
}

function showsubmenua()
{
if (document.getElementById("mals").style.display == "none")
{
document.getElementById("mals").style.display ="block";
document.getElementById("mal").style.display ="none";
}
else
{
document.getElementById("mals").style.display ="none";
document.getElementById("mal").style.display ="";
}
}


function showsubmenub()
{
if (document.getElementById("mbls").style.display == "none")
{
document.getElementById("mbls").style.display ="block";
document.getElementById("mbl").style.display ="none";
}
else
{
document.getElementById("mbls").style.display ="none";
document.getElementById("mbl").style.display ="";
}
}


function showsubmenuc()
{
if (document.getElementById("mcls").style.display == "none")
{
document.getElementById("mcls").style.display ="block";
document.getElementById("mcl").style.display ="none";
}
else
{
document.getElementById("mcls").style.display ="none";
document.getElementById("mcl").style.display ="";
}
}


function showsubmenud()
{
if (document.getElementById("mdls").style.display == "none")
{
document.getElementById("mdls").style.display ="block";
document.getElementById("mdl").style.display ="none";
}
else
{
document.getElementById("mdls").style.display ="none";
document.getElementById("mdl").style.display ="";
}
}



