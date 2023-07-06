<%
if(session.isNew())
{
  response.sendRedirect("/JSP1-3/onlineexamination/testuser");
  return;
}
%>
<head> 
<%@ include file="questions1ajax.jsp" %>
</head>
<%@ include file="raquestion.jsp" %>
<%
  int m=qs/2;
  int s=0;
  if(qs%2!=0)
    s=30;
  session.setAttribute("m",m);
  session.setAttribute("s",s);
  int answer[]=new int[qs];
  session.setAttribute("answer",answer);
  session.setAttribute("ai",0);
  session.setAttribute("qn",raq[0]);
%>
 <div>
   <div>
    <img src='../images/image10.jpg' width="59%" height="30%" style="float:left"/>
   </div>
   <div id="quecontainer" style="overflow:scroll;width:40%;float:left;height:31%;border:2px solid black;background-color:yellow">
  </div>
</div><br/>
<hr style='border:2px solid green'>
  <input type='hidden' id='toq' value='<%=qs%>' >
  <table width="100%" style='font-weight:bold;font-size:23px;color:#0000FF;background-color:rgb(241, 243, 217)'>
   <tr>
    <td>Total question:<%=qs%></td>
    <td align='center' style='color:rgb(217, 0, 0)'>Hi,<%=session.getAttribute("name")%></td>
    <td align='right'>Remaining time--><label id="time" style='margin-right:10px'><%=m<10?"0"+m:m%>:<%=s<10?"0"+s:s%></label></td>
   </tr>
  </table>
<hr style='border:2px solid green'><br>
<body onload='pageLoad()'>
 <div id="container">
 </div><br>
 <hr style='border:2px solid green'>
<form action="result1.jsp">
 <table style="margin-top:0px"width="80%">
  <tr>
   <td><input type="button" name="bt" onclick='showq("1")' value="First" style="font-size:1.5em"></td>
   <td><input type="button" name="bt" onclick='showq("2")' style="font-size:1.5em" value="Previous"></td>
   <td><input type="button" name="bt" onclick='showq("3")' style="font-size:1.5em" value="Next"></td>
   <td><input type="button" name="bt" onclick='showq("4")' style="font-size:1.5em" value="Last"></td>
   <td><input type="submit" style="font-size:1.5em;border-radius:6px;color:white;background-color:black" value="End Test"></td>
  </tr>
</table>
</from>
<hr style='border:2px solid green'>
 </div>
</body>
<div align='center' style='font-size:2em;background-color:grey;color:purple;border:2px solid black' ><h3><%=session.getAttribute("paper")%>&nbsp;Online Exam</h3></div>