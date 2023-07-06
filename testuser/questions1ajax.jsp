<script>
    function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
    var tt=setInterval(showTimer,1000);
    function showTimer()
    {
        var ta=document.getElementById("time").innerHTML.trim();
        if(ta=="01:00")
        {
	document.getElementById("time").style.color="red";
        } 
        if(ta=="00:00")
        {
	clearInterval(tt);
	dd();
	return;
        } 
        var obj=new XMLHttpRequest();
        obj.onreadystatechange=function()
        { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("time").innerHTML=res; 	
         }
        };
        obj.open("GET","timer.jsp");
        obj.send();
    }
    function pQ(qn)
    {
        var obj=new XMLHttpRequest();
        obj.onreadystatechange=function()
        { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("container").innerHTML=res; 	
         }
        };
        var url="showquestion1.jsp?dq="+qn;
        obj.open("GET",url);
        obj.send();
    }
    function pageLoad()
    {
        var obj=new XMLHttpRequest();
        obj.onreadystatechange=function()
        { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("container").innerHTML=res; 	
         }
        };
        var url="showquestion1.jsp";
        obj.open("GET",url);
        obj.send();
        loadButtons();	
    }
    function showq(bp)
    { 
       if(invalidQst(bp))
         return;
        var obj=new XMLHttpRequest();
        obj.onreadystatechange=function()
        { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("container").innerHTML=res; 	
         }
        };
        var url="showquestion1.jsp?bp="+bp;
        obj.open("GET",url);
        obj.send();
    }
    function invalidQst(bp)
    {
       if((bp==1 || bp==2) && document.getElementById("qn").value==1)
       {
	alert("This is already first question");
	return true;
       } 	 	
       if((bp==3 || bp==4) && document.getElementById("qn").value==document.getElementById("toq").value)
       {
	alert("This is already last question");
	return true;
       } 	 	
    } 
    function store(value)
    { 
        var obj=new XMLHttpRequest();
        obj.onreadystatechange=function()
        { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("quecontainer").innerHTML=res;
         }
        };
        var url="saveanswer1.jsp?ans="+value;
        obj.open("GET",url);
        obj.send();
    } 
    function loadButtons()
    { 
        var obj=new XMLHttpRequest();
        obj.onreadystatechange=function()
        { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("quecontainer").innerHTML=res; 	
         }
        };
        var url="saveanswer1.jsp";
        obj.open("GET",url);
        obj.send();
    }
    function dd()
    {
	var bt=document.getElementsByName("bt");
	for(i=0;i<bt.length;i++)
	{
	  bt[i].disabled=true;
	}
    } 
  </script>