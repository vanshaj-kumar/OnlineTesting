<%
  String uid=request.getParameter("uid");
  String pass=request.getParameter("pass");
   if(!uid.equals("onlineexamination"))
   {
      out.println("1");     
      return; 	
   }
   if(!pass.equals("spectrum"))
   {
      out.println("2");    
      return;	
   }
   session.setAttribute("uid",uid);
%>
