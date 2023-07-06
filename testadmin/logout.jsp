<%
if(session.isNew())
{
  response.sendRedirect("/onlinetesting/admin/index.jsp");
  return;
}
%>
<div>
    <img src='../images/th.png' width="100%" height="35%"/>
  </div>
<hr style='border:2px solid green'>
<div style='margin-top:32px' align='center'>
 <h2>You have successfully logged out...</h2>
</div>
<div style='margin-top:34px' align='center'>
  <a href='/onlinetesting/testadmin/index.jsp' style='font-size:22px'>Click to Re-login<a>
</div> 
<%
session.invalidate();
%>