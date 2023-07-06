<%@ include file="conn.jsp"%>
<%
  String userid=request.getParameter("userid");
  String password=request.getParameter("password");
  String query="select userid,password,firstname,lastname,profilepics from registration where userid=?";
  PreparedStatement ps=cn.prepareStatement(query);
  ps.setString(1,userid);
  ResultSet rst=ps.executeQuery();
  if(rst.next())
  {
    String uid=rst.getString(1);
    if(!userid.equals(uid))
    {
      out.println("1");
      return;    
    }
    if(!password.equals(rst.getString(2)))
    {
      out.println("2");
      return; 
    }
    session.setAttribute("userid",userid);
    session.setAttribute("name",rst.getString(3)+" "+rst.getString(4));
    session.setAttribute("pic",rst.getString(5));
  }
  else
   out.println("3");
%>

