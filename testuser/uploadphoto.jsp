<form action="upload.jsp" method='post' enctype="multipart/form-data">
<div align='center' style='margin-top:20px'>
  <%
  String pic=request.getParameter("file");
  if(pic!=null)
  {
  %><img src='profilepic/<%=pic%>' height="150px"><%
  }else{%>
  <img src='dummy.png'>
  <%}%>
</div>
<div align='center' style='margin-top:40px'>
  <h2>Upload your photo..</h2>
</div>
<div align='center'>
   <input type='hidden' name='photo' value='click style='margin-top:20px'>
  <input type='file' name='pic' style='font-size:18px;margin-left:130px'>
</div>
<div align='center'>
  <input type='submit' value='Upload' style='margin-top:25px;font-size:1.3em;font-family:lucida;border-radius:0.3em;background-color:lightgrey'>
</div>
<div align='center' style='margin-top:20px'>
  <a href='userhome.jsp' style='margin-right:50px;font-family:lucida;font-size:1.3em'>CONTINUE!!!!</a>
  <a href='userhome.jsp' style='font-family:lucida;font-size:1.3em'>SKIP</a>
</div>
</form>
