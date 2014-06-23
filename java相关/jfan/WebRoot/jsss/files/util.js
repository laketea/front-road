	var contentPath = '/epanelweb' ;
	
		
	
	
	function showDialogWindow(theWidth,theHeight,theUrl,parameters){
		var newParameters = [] ;
		newParameters[0] = contentPath + theUrl ;
		if(parameters != null){
			for(var i = 0; i < parameters.length; i++){
				newParameters[i+1] = parameters[i] ;
			}
		}
		var returnValue = window.showModalDialog(contentPath+'/js/child.html',newParameters,'dialogHeight:'+theHeight+'px;dialogWidth:'+theWidth+'px;help:no;resizable:no') ;
		return returnValue ;
	}

	function checkmail(mail){
	  var strr;
	  //\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
	  //\w+@\w+\.\w+)(\.{0,1}\w*)(\.{0,1}\w*
	  re=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i;
	  re.exec(mail);
	  if (RegExp.$3!=""&&RegExp.$3!="."&&RegExp.$2!="."){
	   strr=RegExp.$1+RegExp.$2+RegExp.$3;
	  }
	  else
	    if (RegExp.$2!=""&&RegExp.$2!=".") {
	    	strr=RegExp.$1+RegExp.$2;
	    } else {
	    	strr=RegExp.$1;
	    }
	    	
	  if (strr!=mail) {
		  return false;
	  }
	  return true;
	}
	
	
	//review
	function reviewCheck(theCheck,theValues){
	  if(theCheck == null){
	  	return ;
	  }
	  
	  if(theCheck.type == 'checkbox'){
	  	  for(var n = 0; n < theValues.length; n++){
				if(theCheck.value == theValues[n]){
					theCheck.checked = true ;
					break ;
				}
		  }
	  }else{
		  for(var i = 0; i < theCheck.length; i++){
			for(var j = 0; j < theValues.length; j++){
				if(theCheck[i].value == theValues[j]){
					theCheck[i].checked = true ;
					break ;
				}
			}
		  }
	  }
	}//~function
	
	function reviewSelect(theSelect,theValue){
	  if(theSelect == null){
		  return ;
	  }
	  
	  for(var i = 0; i < theSelect.options.length; i++){
		if(theSelect.options[i].value == theValue){
		  theSelect.options[i].selected = true ;
		  return ;
		}
	  }
	}//~function
	
	function reviewRadio(theRadio,theValue){
	  if(theRadio == null){
		  return ;
	  }
	  
	  if(theRadio.type == 'radio'){
	    if(theRadio.value == theValue){
		  theRadio.checked = true ;
		}
	  }else{
		  for(var i = 0; i < theRadio.length; i++){
			if(theRadio[i].value == theValue){
			  theRadio[i].checked = true ;
			  return ;
			}
		  }
        }
	}//~function

	function radioIsChecked(theRadio){
	  if(theRadio == null){
		  return false ;
	  }
	  
	  if(theRadio.type == 'radio'){
	    if(theRadio.checked){
		  return true ;
		}
	  }else{
		  for(var i = 0; i < theRadio.length; i++){
			if(theRadio[i].checked){
			  return true ;
			}
		  }
        }
		
		return false ;
	}//~function
	
	function checkBoxIsChecked(theCheck){
	  if(theCheck == null){
		  return false ;
	  }
	  
	  if(theCheck.type == 'checkbox'){
	    if(theCheck.checked){
		  return true ;
		}
	  }else{
		  for(var i = 0; i < theCheck.length; i++){
			if(theCheck[i].checked){
			  return true ;
			}
		  }
        }
		
		return false ;
	}//~function
	
	function getCheckedRadio(theRadio){
	  if(theRadio == null){
		  return null ;
	  }
	  
	  if(theRadio.type == 'radio'){
	    if(theRadio.checked){
		  return theRadio ;
		}
	  }else{
		  for(var i = 0; i < theRadio.length; i++){
			if(theRadio[i].checked){
			  return theRadio[i] ;
			}
		  }
        }
		
		return null ;
	}//~function
	
	
	function clickCheckBox(theCheck,OnlyChecked){
	  if(theCheck == null){
		  return ;
	  }
	  
	  if(theCheck.type == 'checkbox'){
	  	if(OnlyChecked){
		    if(theCheck.checked){
		      theCheck.checked = false ;
			  theCheck.click() ;
			  return ; 
			}
		}else{
			if(theCheck.checked){
				theCheck.checked = false ;
			}else{
				theCheck.checked = true ;
			}
			theCheck.click() ;
			return ; 
		}
	  }else{
		  for(var i = 0; i < theCheck.length; i++){
			if(OnlyChecked){
				if(theCheck[i].checked){
				  theCheck[i].checked = false ;
				  theCheck[i].click() ;
				}
			 }else{
				if(theCheck[i].checked){
					theCheck[i].checked = false ;
				}else{
					theCheck[i].checked = true ;
				}
				theCheck[i].click() ;
			 }
		  }
        }
	}//~function
	
	
	function clickCheckedRadio(theRadio){
	  if(theRadio == null){
		  return false ;
	  }
	  
	  if(theRadio.type == 'radio'){
	    if(theRadio.checked){
		  theRadio.click() ;
		  return true ; 
		}
	  }else{
		  for(var i = 0; i < theRadio.length; i++){
			if(theRadio[i].checked){
			  theRadio[i].click() ;
			  return true ;
			}
		  }
        }
		
		return false ;
	}//~function
	
	function isNumber(str){
		var nStr = trimSpace(str);
		if(nStr.length < 1){
			return false ;
		}
		for(var i = 0; i < nStr.length; i ++){
			var c = nStr.charAt(i) ;
			if(c < '0' || c > '9'){
				return false ;
			}
		}
		return true ;
	}
	
	function trimSpace(s){
		if(s == null){
			s = "" ;
		}
		return s.replace(/(^\s*)|(\s*$)/g,"");
		//return s.replace( "/^\s*/", "" ).replace( "/\s*$/", "" );
	}
	
	function isNotNull(parameter){
		var newParameter = trimSpace(parameter);
		if(newParameter == '' || newParameter.length < 1){
			return false ;
		}
		return true;
	}
	
	
	function isURL(parameter){
		var newParameter = trimSpace(parameter);
		if(!isNotNull(newParameter)){
			return false ;
		}
		var patrn= /^http[s]?:\/\/[\w-]+(\.[\w-]+)+([\w-\.\/?%&=]*)?$/;
		
		return patrn.test(parameter);;
	}
	
	function checkLength(parameter,maxlength){
		if(parameter.length <= maxlength) {
			return true;
		}
		
		return false;
	}
	
	//ÓÊ¼ÄµØÖ·
	function checkPostAddress(postAddress){
		if(postAddress!=null) {
			postAddress = postAddress.replace( /^\s*/, "" ).replace( /\s*$/, "" ) ;
			
			if(postAddress == ""){
				alert("ÇëÊäÈëÓÊ¼þµØÖ·£¡") ;
				return false ;
			} 
			
			return true;
		}
		return false ;
	}
	
	function isNumberNotBeginWithZero(number){
		if(isNumber(number)) {
			if(number.indexOf(0) == 0) {
				return false;
			}
			return true;
		}
		return false;
	}

	function isEmail(email) {
		if(email != null){
			email = email.replace( /^\s*/, "" ).replace( /\s*$/, "" ) ;
			
			if(email == ""){
				return false ;
			}
			
			for(var i = 0; i < email.length; i++){
				var c = email.charAt(i) ;
				if(!(c>='0'&&c<='9') && !(c>='a'&&c<='z') && !(c >='A'&&c<='Z') &&!(c=='@') && !(c=='.') && !(c=='_') && !(c=='-')){
					return false ;
				}
			}

			if(email.indexOf('@') < 0 || email.indexOf('.') < 0 || email.indexOf('@')>=email.lastIndexOf('.')){
				return false ;
			} 

			var email1 = email.substr(email.indexOf('@')+1) ;
			if(email1.indexOf('@') != -1){
				return false ;
			}

			var c1 = email.charAt(0) ;
			if(c1=='@' || c1=='.' || c1=='_' || c1=='-'){
				return false ;
			}
			var c2 = email.charAt(email.length-1) ;
			if(c2=='@' || c2=='.' || c2=='_' || c2=='-'){
				return false ;
			}

			var pos = email.indexOf('@') ;
			var c3 = email.charAt(pos-1) ;
			if(c3=='@' || c3=='.' || c3=='_' || c3=='-'){
				return false ;
			}
			var c4 = email.charAt(pos+1) ;
			if(c4=='@' || c4=='.' || c4=='_' || c4=='-'){
				return false ;
			}
			if(email == ""){
				return false ;
			}
			return true;
		}
		return false;
	}

	function checkBanjiao(str){   
  		if(/[\x00-\xFF]/.test(str)) {
			return true;
		}
  		else {
  			return false;
  		}
  	}
  	
  	//submit the page number when using "Enter" button
  	function bt_go_keyDoown(){
		if(event.keyCode == 13){
			bt_go_click() ;
		}
	}
	
	function isNumberForAllInt(numStr){
		var regexp2=/^-?[0-9]*[1-9][0-9]*$/;
		if(!isNotNull(numStr)){
			return false ;
		}else{
			var nStr = trimSpace(numStr);
			if(regexp2.test(nStr)){
				return true;
			}else{
				return false;
			}
		}
	}
	
	