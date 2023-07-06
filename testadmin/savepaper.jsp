<%@ include file="conn.jsp"%>
<%
  String subject=request.getParameter("paper");
  if(subject.equals("cp"))
       subject="C++";
  String query1="select paper from papers where paper=?";
  PreparedStatement ps1=cn.prepareStatement(query1);
  ps1.setString(1,subject);
  ResultSet rst=ps1.executeQuery();
  if(rst.next())
  {
    %>
   <h3 style="color:red">This paper has already been added...</h3>
  <%
    return; 
  }
  String query2="insert into papers(paper) values(?)";
  PreparedStatement ps=cn.prepareStatement(query2);
  ps.setString(1,subject);
  ps.executeUpdate();
%>
<h3 style="color:blue;">Paper added successfully....</h3>