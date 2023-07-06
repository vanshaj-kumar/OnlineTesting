<%@ include file='conn.jsp' %>
<%
String qr="select qid,question,ans1,ans2,ans3,ans4,correctans from  questionbank where paperid=?";
PreparedStatement ps=cn.prepareStatement(qr);
ps.setString(1,request.getParameter("pid"));
ResultSet rst=ps.executeQuery();
%>
 <table border='2px' style='border-collapse:collapse;margin-top:30px' align='center' cellpadding='4px'>
 <thead>
  <th>QID</th><th>Question</th><th>Ans1</th><th>Ans2</th><th>Ans3</th><th>Ans4</th><th>Correct Ans</th>
 </thead>
 <%
  while(rst.next())
  {
    
      String qid=rst.getString(1);
      String question=rst.getString(2);
      String ans1=rst.getString(3);
      String ans2=rst.getString(4);
      String ans3=rst.getString(5);
      String ans4=rst.getString(6);
      String correctans=rst.getString(7);
    %> 
    <tr>
      <td><%=qid%></td>
      <td><%=question%></td>
      <td><%=ans1%></td>
      <td><%=ans2%></td>
      <td><%=ans3%></td>
      <td><%=ans4%></td>
      <td><%=correctans%></td>
     </tr>
  <%}
 %>  