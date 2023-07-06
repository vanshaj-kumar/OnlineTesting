<%@ include file="conn.jsp"%>
<%
  String code=request.getParameter("code");
  String query="select * from schedulerequest where userid=? and test_code=? and status=?";
  PreparedStatement ps=cn.prepareStatement(query);
  ps.setString(1,(String)session.getAttribute("userid"));
  ps.setString(2,code);
  ps.setString(3,"Approved");
  ResultSet rst=ps.executeQuery();
  if(rst.next())
  {
    session.setAttribute("paper",rst.getString(3));
    session.setAttribute("testcode",code);
    out.println("1");
  }
  else
   out.println("Sorry !!! invalid test code");
%>

