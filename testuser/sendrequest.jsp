<%@ include file="conn.jsp" %>
<style>
a{color:GREEN;}
</style>
<div>
 <img src="../images/tr.jpg" width="100%" height="35%">
</div>
<hr style='border:2px solid red'>
<%
PreparedStatement ps1=cn.prepareStatement("select * from schedulerequest where userid=? and paper=? and status in(?,?)");
ps1.setString(1,(String)session.getAttribute("userid"));
ps1.setString(2,request.getParameter("paper"));
ps1.setString(3,"Pending");
ps1.setString(4,"Approved");
ResultSet rst1=ps1.executeQuery();
if(rst1.next())
{%>
 <div style='margin-top:50px' align='center'>
   <h2>Dear <%=session.getAttribute("name")%> !!!! test code of this paper has already been generated...<h2>
   <h3>Please finish that test that send new request<h3>
 </div>
 <div style='margin-top:30px;font-family:lucida handwriting;font-size:15px' align='center'>
   <a href='testreq.jsp'>Send other request</a>
 </div>
<%
return;
}
PreparedStatement ps=cn.prepareStatement("insert into schedulerequest(userid,paper,req_date,test_code,status) values(?,?,?,?,?)");
ps.setString(1,(String)session.getAttribute("userid"));
ps.setString(2,request.getParameter("paper"));
java.util.Date dt=new java.util.Date();
String date=dt.getDate()+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900);
ps.setString(3,date);
ps.setString(4,"?");
ps.setString(5,"Pending");
ps.executeUpdate();
%>
<div style='margin-top:50px' align='center'>
 <h2>Dear <%=session.getAttribute("name")%> !!!! Your request has been sent...<h2>
 <h3>Please check your test code status<h3>
</div>
<div style='margin-top:30px;font-family:lucida handwriting;font-size:15px' align='center'>
 <a href='userhome.jsp'>Back to home</a>
</div>