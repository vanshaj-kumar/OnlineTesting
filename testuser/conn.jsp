<%@ page import="java.sql.*" %>
<%
Connection cn=null;
Statement st=null;
try
{
  Class.forName("com.mysql.jdbc.Driver");
  cn=DriverManager.getConnection("jdbc:mysql://localhost/onlineexamination","root","MySql");
  st=cn.createStatement();
}
catch(Exception ex)
{
  out.println(ex);
}
%>