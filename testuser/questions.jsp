<%
if(session.isNew())
{
  response.sendRedirect("/JSP1-3/onlineexamination/testuser");
  return;
}
%>
<head>
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
        var url="showquestion.jsp?qn="+qn;
        obj.open("GET",url);
        obj.send();
    }
    function pageLoad(bp)
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
        var url="showquestion.jsp?bp="+bp;
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
        var url="showquestion.jsp?bp="+bp;
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
        var url="saveanswer.jsp?ans="+value;
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
        var url="saveanswer.jsp";
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
</html>
<%@ include file="raquestion.jsp" %>
<%
  int m=noq/2;
  int s=0;
  if(noq%2!=0)
    s=30;
  session.setAttribute("m",m);
  session.setAttribute("s",s);
  int answer[]=new int[noq];
  session.setAttribute("answer",answer);
  session.setAttribute("tq",noq);
  session.setAttribute("qn",1);
%>
<div>
   <div>
    <img src='../images/image10.jpg' width="59%" height="30%" style="float:left"/>
   </div>
   <div id="quecontainer" style="overflow:scroll;width:40%;float:left;height:31%;border:2px solid black;background-color:yellow">
  </div>
</div><br/>
<hr style='border:2px solid green'>
  <input type='hidden' id='toq' value='<%=noq%>' >
  <table width="100%" style='font-weight:bold;font-size:22px;color:#55AAFF'>
   <tr>
    <td>Total question:<%=noq%></td>
    <td align='center' style='color:orange'>Hi,<%=session.getAttribute("name")%></td>
    <td align='right'>Remaining time--><label id="time" style='margin-right:10px'><%=m<10?"0"+m:m%>:<%=s<10?"0"+s:s%></label></td>
   </tr>
  </table>
<hr style='border:2px solid green'>
<body onload='pageLoad("1")'>
 <div id="container">
 </div> 
 <hr style='border:2px solid green'>
<form action="result.jsp">
 <table style="margin-top:0px" width="80%">
  <tr>
   <td><input type="button" name="bt" onclick='showq("1")' value="First" style="font-size:18px"></td>
   <td><input type="button" name="bt" onclick='showq("2")' style="font-size:18px" value="Previous"></td>
   <td><input type="button" name="bt" onclick='showq("3")' style="font-size:18px" value="Next"></td>
   <td><input type="button" name="bt" onclick='showq("4")' style="font-size:18px" value="Last"></td>
   <td><input type="submit" style="font-size:18px;border-radius:5px;color:white;background-color:#5555FF" value="End Test"></td>
  </tr>
</table>
</from>
<hr style='border:2px solid green'>
 </div>
</body>