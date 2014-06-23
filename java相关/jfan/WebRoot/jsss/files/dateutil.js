	function writeMonths(obj,full)
	{
		now = new Date()
    	var opt;
	  var len = obj.options.length ;
	  
	  if(!full){
	  
	    if(len == 12){
		  for(var i=0; i<12; i++){
		    obj.remove(0) ;
		  }
		  opt = document.createElement("option")
	      opt.text = "请选择";
		  opt.value = 0;
	      obj.add(opt);
		}else if(len == 0){
		  opt = document.createElement("option")
	      opt.text = "请选择";
		  opt.value = 0;
	      obj.add(opt);
		}
		
		return ;
	  }
	  
	  
	  
	  if(len == 1){
		obj.remove(0) ;
	  }else if(len == 12){
	  	return ;
	  }
	  
	  for (var i=1; i<=12; i++)
	  {
		opt = document.createElement("option")
		opt.text = opt.value = Math.floor(i/10) ? i : i
		obj.add(opt)
	  }
	  
	}
	
	function writeDates(obj,full)
	{
		now = new Date()
    	var opt;
	  var len = obj.options.length ;
	  
	  if(!full){
	    if(len > 0){
		  for(var i=0; i<len; i++){
		    obj.remove(0) ;
		  }
		  opt = document.createElement("option")
	      opt.text = "请选择";
		  opt.value = 0;
	      obj.add(opt);
		}else if(len == 0){
		  opt = document.createElement("option")
	      opt.text = "请选择";
		  opt.value = 0;
	      obj.add(opt);
		}
	  }
	}
	
	function writeDate(obj, year, month)
	{		
		now = new Date()
    	var opt;
	    if(year == 0 || month == 0){
		    for(var i = 1; i <= 31; i++){
			    opt = document.createElement("option") ;
				opt.text = opt.value = i ;
				obj.add(opt) ;
			}
			return ;
		}

		var date = new Date(""+year+"/"+(parseInt(month)+1)+"/"+0).getDate()
		var selectedIndex = (date-1)<obj.selectedIndex ? (date-1) : obj.selectedIndex
		
		if(selectedIndex < 0){
			selectedIndex = 0 ;
		}
		
		var len = obj.options.length
		
		if(len == 1){
		  obj.remove(0) ;
		  opt = document.createElement("option")
	      opt.text = 1;
		  opt.value = 1;
	      obj.add(opt);
		}
		
		if (date>len)
			for (var i=len+1; i<=date; i++)
			{
				opt = document.createElement("option")
				opt.text = opt.value = i ;
				obj.add(opt)
			}
		else
			for (var i=len; i>date; i--)
			{
				obj.remove(i-1)
			}
			
		obj.selectedIndex = selectedIndex;
	}

	function changeDate(year,month,date)
	{
/*
		var year	= eval("document.sendPersonConditionForm.cstartyear")
		var month	= eval("document.sendPersonConditionForm.cstartmon")
		var date	= eval("document.sendPersonConditionForm.cstartday")
*/		
		now = new Date()
    	var opt;
		if(year.options(year.selectedIndex).value == 0){
			writeMonths(month,false) ;
			writeDates(date,false) ;
			return ;
		}
		
		writeMonths(month,true) ;
		writeDate(date, year.options(year.selectedIndex).value, month.options(month.selectedIndex).value)
	}