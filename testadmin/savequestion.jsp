<%@ include file="conn.jsp"%>
<%
  String subject=request.getParameter("paper");
  if(subject.equals("cp"))
       subject="C++";
  String query1="select paperid from papers where paper=?";
  PreparedStatement ps1=cn.prepareStatement(query1);
  ps1.setString(1,subject);
  ResultSet rst=ps1.executeQuery();
  rst.next();
  subject=rst.getString(1);
  String query2="insert into QuestionBank(paperid,question,ans1,ans2,ans3,ans4,correctans) values(?,?,?,?,?,?,?)";
  PreparedStatement ps=cn.prepareStatement(query2);
  ps.setString(1,subject);
  ps.setString(2,request.getParameter("que"));
  ps.setString(3,request.getParameter("a1"));
  ps.setString(4,request.getParameter("a2"));
  ps.setString(5,request.getParameter("a3"));
  ps.setString(6,request.getParameter("a4"));
  ps.setString(7,request.getParameter("corr"));
  ps.executeUpdate();
%>
<h3 style="color:blue;">Question added successfully....</h3>