<%
int m=(Integer)session.getAttribute("m");
int s=(Integer)session.getAttribute("s");
if(s==0)
{
  s=59;
  m--;
}
else
 s--;
session.setAttribute("m",m);
session.setAttribute("s",s);
%>
<%=m<10?"0"+m:m%>:<%=s<10?"0"+s:s%>
