<link href='linkbutton.css' type='text/css' rel="stylesheet" /> 
<head>
  <script type='text/javascript'>
    function cc()
    {
	document.getElementById('editp').style.color='red';
    } 
function edit(pid)
{
  location.href="editpapers.jsp?epid="+pid;
}
function del(pid)
{
  location.href="editpapers.jsp?dpid="+pid;
}
</script>
</head>
<%@ include file="papersmenu.jsp" %>
<%@ include file="conn.jsp" %>
<body onload='cc()'>
<form>
<table align='center' style='margin-top:50px;font-size:1.2em;border-radius:0.4em;border:solid black' callpadding='10' border='2'>
<tr>
  <th>Paper Id</th><th>Paper Name</th><th>Action</th>
</tr>
<%
String upid=request.getParameter("upid");
if(upid!=null && request.getParameter("bt").equals("Update"))
{
  st.executeUpdate("update papers set paper='"+request.getParameter("paper")+"' where paperid="+upid);
}
String dpid=request.getParameter("dpid");
if(dpid!=null)
{
  st.executeUpdate("delete from papers where paperid="+dpid);
}
ResultSet rst=st.executeQuery("select * from papers");
String epid=request.getParameter("epid");
while(rst.next())
{
  String pid=rst.getString(1);
  String paper=rst.getString(2);
  %>
   <tr>
     <td style='font-size:1.1em'><%=pid%></td>
     <%if(epid==null || !epid.equals(pid)){%>
     <td style='font-size:1.1em'><%=paper%></td>
     <td>
       <input type='button' class="bt" value='Edit' id='<%=pid%>' onclick='edit(this.id)' style='font-size:0.8em'>
       <input type='button' class="bt" value='Delete' id='<%=pid%>' onclick='del(this.id)'style='font-size:0.8em'>
     </td>
     <%}
     else
     {%>
        <td>
          <input type='text' size='15' name='paper' value='<%=paper%>' >
        </td>
        <td>
         <input type='submit' class="bt" value='Update' name="bt">
         <input type='submit' class="bt" value='Cancel' name="bt">
          <input type='hidden' size='15' name='upid' value='<%=pid%>'
        </td>
     <%}
     %>
   </tr>
  <%
}
%>
<table>
</form>