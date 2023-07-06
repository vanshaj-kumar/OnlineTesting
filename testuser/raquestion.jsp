<%@ include file="conn.jsp" %>
<%
  String qr1="select paperid from papers where paper=?";
  PreparedStatement ps=cn.prepareStatement(qr1);
  ps.setString(1,(String)session.getAttribute("paper"));
  ResultSet rst1=ps.executeQuery();
  rst1.next();	
  String paperid=rst1.getString(1);
  rst1.close();
  session.setAttribute("paperid",paperid);
  String query="select * from questionbank where paperid="+paperid;
  Statement st1=cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  ResultSet rst=st1.executeQuery(query);
  session.setAttribute("rst",rst);
  rst.last();
  int noq=rst.getRow();
  int qs=15;
  session.setAttribute("tq",qs);
  int [] raq=new int[qs];
  session.setAttribute("raq",raq);
  int ptr=-1;
  java.util.Random ra=new java.util.Random();
  do
  {
	int n=ra.nextInt(noq)+1;  
	int c=0;
	for(;c<=ptr && n!=raq[c];c++);
	if(c>ptr)
	{
	  raq[++ptr]=n;
	  if(ptr==qs-1)
	   break;
	}
  }while(true); 
 %>