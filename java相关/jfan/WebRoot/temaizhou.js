
var startTime = (new Date()).getTime();
var Temp;
var timerID = null;
var timerRunning = false;

try
{   
    onload=startclock();
}
catch(e)
{
}

function startclock()
{
    stopclock();
    showtime();
}

function stopclock()
{
    if(timerRunning)
        clearTimeout(timerID);
    timerRunning = false;
}

function showtime()
{
    now = new Date();
     
    for (var iii = 0; iii < initialTimeElement.length; ++iii)
	{
    var ts=parseInt((startTime-now.getTime())/1000)+initialTimeElement[iii];  
    var hourLeft = 0;
    var minuteLeft = 0;
    var secondLeft = 0;   
	var dayLeft
   
    if(ts < 0)
    {
        ts = 0;
        CurHour = 0;
        CurMinute = 0;
        secondLeft = 0;    
		CurDay = 0;
    } else {
       // __d=parseInt(leftsecond/3600/24);
 //__h=parseInt((leftsecond/3600)%24);
 //__m=parseInt((leftsecond/60)%60);
// __s=parseInt(leftsecond%60);
		dayLeft = parseInt(ts/3600/24);
        hourLeft = parseInt((ts/3600)%24);
        //ts = ts - hourLeft * 3600;       
        minuteLeft = parseInt((ts/60)%60);
        secondLeft = (ts%60);
    }
    
    if(hourLeft < 10) hourLeft = '0' +hourLeft;
    if(minuteLeft < 10) minuteLeft = '0' +minuteLeft;
	if(secondLeft < 10) secondLeft = '0' +secondLeft;
   
    if( hourLeft > 0 )
        hourLeft = hourLeft;
    else
    {
        hourLeft = "00";
    }
    if( minuteLeft > 0 )
        minuteLeft = minuteLeft ;
    else
    {
        minuteLeft = "00";
    }    

    if( secondLeft > 0 )
        secondLeft = secondLeft ;
    else
    {
        secondLeft = "00";
    } 

   	Temp=dayLeft+"天 "+hourLeft+"小时" + minuteLeft+ "分" +secondLeft+"秒";
    if(initialTimeElement[iii] <= 0 || hourLeft<=0 && minuteLeft<=0&& secondLeft<=0)
    {
        Temp = "<strong class=\"H\">抢购已结束</strong>";
        stopclock();
    }	
		var showtimes= showTimeElement[iii];
		changeSpanText(showtimes,Temp);
	}
	
    timerID = setTimeout("showtime()",1000);
    timerRunning = true;
}

function changeSpanText(spanID,text){
	text=text.replace(/\n/g,"<BR>");
	text=text.replace(/\'/g,"\\\'");

	var s;
	if(document.all){
		s="document.all['" + spanID + "'].innerHTML='" +text + "';";
	}else if(document.getElementById){
		s="document.getElementById('" + spanID +"').innerHTML='" + text +"';";
	}

	try{
		eval(s);
	}catch(e){}
}
