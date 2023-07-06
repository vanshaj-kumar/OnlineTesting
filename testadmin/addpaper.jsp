<head>
  <script>
    function cc()
    {
	document.getElementById('addp').style.color='red';
    }
    function addPaper()
    { 
        var obj=new XMLHttpRequest();
        obj.onreadystatechange=function()
        { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("addpaper").innerHTML=res;
         }
        };
        var url="savepaper.jsp?paper="+document.getElementById("paper").value;
        obj.open("POST",url);
        obj.send();
    }
  </script>
</head>
<%@ include file="papersmenu.jsp"%>
<body onload='cc()'>
<form>
  <table align="center" style="margin-top:35px;font-size:22px;border-color:solid black">
    <tr>
      <td><b>Add Paper:</b></td>
     <td><input type="text" id="paper" style="width:200px;height:30px;font-size:0.9em"></td>
     <td><input type="button" value="Save" style="font-size:0.9em;border-radius:0.2em" onclick="addPaper()"/></td>
    </tr>
   </table>
   <div align="center" id="addpaper" style="margin-top:20px;"></div>
</form>
<div id="papers" align="center"></div>
</body><br>
<%@ include file="conn.jsp" %>
<form>
<table align='center' style='margin-top:10px;font-size:1.2em;border-radius:0.2em;border:solid black' callpadding='10' border='2' width="23%">
<tr>
  <th>Paper Id</th><th>Paper name</th>
</tr>
<%
Statement st1=cn.createStatement();
ResultSet rst=st1.executeQuery("select * from papers");
while(rst.next())
{
  String pid=rst.getString(1);
 %>
   <tr>

     <td style='font-size:1.1em'><%=pid%></td>
     <td style='font-size:1.1em'><%=rst.getString(2)%></td>
   </tr>
  <%
}
%>
</table>
</form>
<div id="papers" align="center"></div>