 <head>
<script type='text/javascript'>
function cc()
{
  document.getElementById('editq').style.color='red';
} 
function delq(qid)
{
  location.href="deleteques.jsp?delqid="+qid;
} 
</script>
</head>
<style>
 input[type='text'] 
 {
   border-radius:5px;
   font-size:18px;
   width:170px;
   height:30px;
 }
</style>
<%@ include file='questionsmenu.jsp' %>
<%@ include file='conn.jsp' %>
<body onload='cc()'>
<%
  String dqid=request.getParameter("delqid");
  if(dqid!=null)
  {
    String qr1="delete from QuestionBank where qid=?";
    PreparedStatement ps1=cn.prepareStatement(qr1);
    ps1.setString(1,dqid);
    ps1.executeUpdate();
    %>
    <div style='margin-top:50px' align='center'>
     <h2 style='color:red'>Question deleted successfully.</h2>
    </div> 
   <%
   return;
  }
  %> 
<form>
 <table style='border:2px solid blue;font-size:20px;background-color:#E0E0E0;margin-top:30px' cellpadding='3px' align='center'>
  <tr>
    <td>Enter Question ID</td>
    <%
     String qid=request.getParameter("qid");
    %>
    <td><input type='text' name='qid' value='<%=qid==null?"":qid%>' required></td>
    <td><input type='submit' value='Show Record' style='border-radius:4px;font-size:17px;border-color:blue;background-color:#000;color:white'></td>
   </tr>
 </table>
</form>
<%
if(qid!=null)
{
String qr="select qid,paper,question,ans1,ans2,ans3,ans4,correctans from  questionbank q join papers p on p.paperid=q.paperid  where qid=?";
PreparedStatement ps=cn.prepareStatement(qr);
ps.setString(1,qid);
ResultSet rst=ps.executeQuery();
if(!rst.next())
{
  %>
  <div style='margin-top:50px' align='center'>
   <h2 style='color:red'>Question id does not exist.</h2>
  </div> 
  <%
  return;  
}
%>
 <table border='2px' style='border-collapse:collapse;margin-top:50px' align='center' cellpadding='4px'>
 <thead>
  <th>QID</th><th>Paper</th><th>Question</th><th>Ans1</th><th>Ans2</th><th>Ans3</th><th>Ans4</th><th>Correct Ans</th>
 </thead>
<tr>
      <td><%=rst.getString(1)%></td>
      <td><%=rst.getString(2)%></td>
      <td><%=rst.getString(3)%></td>
      <td><%=rst.getString(4)%></td>
      <td><%=rst.getString(5)%></td>
      <td><%=rst.getString(6)%></td>
      <td><%=rst.getString(7)%></td>
      <td><%=rst.getString(8)%></td>
</tr>
</table>
<div align='center' style='margin-top:27px'>
 <input type='button' value='Delete Question' id="<%=rst.getString(1)%>" style='border-radius:4px;font-size:15px;border-color:black' onclick="delq(this.id)">
</div>
<%}%>

