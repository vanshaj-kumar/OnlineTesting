<%
int an=0;
if(request.getParameter("ans")!=null)
   an=Integer.parseInt(request.getParameter("ans"));
int ai=(Integer)session.getAttribute("ai");
int []cans=(int[])session.getAttribute("answer");
cans[ai]=an;
for(int c=0;c<cans.length;c++)
{
  if(cans[c]==0){
  %>
   <input type='button' name="bt" onclick="pQ(this.value)" value='<%=(c+1)%>' style='background-color:red;color:white;font-size:20px;width:40px;height:35px'>
  <%}else{%>
   <input type='button' name="bt" onclick="pQ(this.value)" value='<%=(c+1)%>' style='background-color:green;color:white;font-size:20px;width:40px;height:35px'>
  <%}
}  
%>
