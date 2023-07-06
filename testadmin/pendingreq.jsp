<head>
<script>
    function cc()
    {
	document.getElementById('pr').style.color='red';
    } 
</script>
</head>
<style>
th
{
  text-align:left;
}
</style>
<%@ include file="testusersmenu.jsp" %>
<%@ include file="conn.jsp" %>
<body onload='cc()'>
<form>
<%
 String scid=request.getParameter("sid"); 
 ResultSet rst1=null; 
 String code=null;
 if(scid!=null)
 {
   boolean exist=false;
   java.util.Random ra=new java.util.Random();
   do
   {
     int num=ra.nextInt(900001)+100000;
     code="SPECTRUM"+num;
     PreparedStatement ps1=cn.prepareStatement("select * from schedulerequest where test_code =?");
     ps1.setString(1,code);
     rst1=ps1.executeQuery(); 
     exist=rst1.next();
     rst1.close();
   }while(exist);
   PreparedStatement ps2=cn.prepareStatement("update schedulerequest set test_code=?,status=? where sid=?");
   ps2.setString(1,code);
   ps2.setString(2,"Approved");
   ps2.setString(3,scid);
   ps2.executeUpdate();
 } 
 PreparedStatement ps=cn.prepareStatement("select * from schedulerequest where status =?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
 ps.setString(1,"Pending");
 ResultSet rst=ps.executeQuery(); 
 rst.first();
 int t=rst.getRow();
 if(t==0)
 {%>
  <div align='center' style='margin-top:50px'>
   <h2>No pending request...</h2>
  </div>
  <%
  return;
 }%>
 <table width="60%" align='center' style='margin-top:42px;border-collapse:collapse' cellpadding='5px' border='2'>
 <tr>
  <th>User Id</th><th>Paper Name</th><th>Request Date</th><th>Status</th><th>Generated Code</th>
 </tr>
 <%rst.beforeFirst();
 while(rst.next())
 {
  String sid=rst.getString(1);
  %>
  <tr>
   <td style='font-size:1.1em'><%=rst.getString(2)%></td>
   <td style='font-size:1.1em'><%=rst.getString(3)%></td>
   <td style='font-size:1.1em'><%=rst.getString(4)%></td>
   <td style='font-size:1.1em'><%=rst.getString(6)%></td>
   <td style='font-size:1.1em'><a href='pendingreq.jsp?sid=<%=sid%>' style='font-family:algerian'>Click</a></td>
  </tr> 
  <%
 }
%>
</table>
</form>