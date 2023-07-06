<head>
  <script>
    function cc()
    {
	document.getElementById('home').style.color='red';
    } 
</script>
</head>
<%@ include file='menu.jsp' %>
<body onload='cc()'>
<%
if(session.isNew())
{
   response.sendRedirect("index.jsp");
}
%>
<div align="center" style="margin-top:10px;font-size:18px">
   <img src="../images/ad.jpg" width="100%" height="30%">
  <h1><b>Welcome to the Online Examination System</b></h1>
</div>
<div style="margin-top:0px">
   <img src="../images/ad.jpg" width="100%" height="30%">
</div>


