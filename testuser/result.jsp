<%
if(session.isNew())
{
  response.sendRedirect("/JSP1-3/onlineexamination/testuser");
  return;
}
%>
<script>
function showq(qn)
{
        var obj=new XMLHttpRequest();
        obj.onreadystatechange=function()
        { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("showq").innerHTML=res; 	
         }
        };
        var url="showcorrectq.jsp?qn="+qn;
        obj.open("GET",url);
        obj.send();
}
</script>
<%@ include file="conn.jsp"%>
 <div>
         <img src='../images/res1.png' width="100%" height="30%"/>
  </div>
<hr style='border:2px solid green'>
<table width="100%" style='font-weight:bold;font-size:22px;color:#55AAFF'>
   <tr>
    <td>Total question:<%=session.getAttribute("tq")%></td>
    <td align='center' style='color:orange'>Hi,<%=session.getAttribute("name")%></td>
    <td align='right'><a href='userhome.jsp' style='margin-right:10px;font-size:20px'>Home</td>
    <td align='right'><a href='logout.jsp' style='margin-right:10px;font-size:20px'>Log out</td>
    </tr>
  </table>
<hr style='border:2px solid green'>
<%
int []cans=(int[])session.getAttribute("answer");
int tq=cans.length;
java.sql.ResultSet rst=(java.sql.ResultSet)session.getAttribute("rst");
rst.beforeFirst();
int []answers=new int[cans.length];
session.setAttribute("answers",answers);
int i=-1,ca=0;
while(rst.next())
{
  answers[++i]=rst.getInt(8);
}
for(int c=0;c<tq;c++)
{
  if(cans[c]==answers[c]){
   ca++;
  %>
   <input type='button' onclick="showq(this.value)" value='<%=(c+1)%>' style='background-color:green;color:white;font-size:20px;width:40px;height:35px'>
  <%}else{%>
   <input type='button' onclick="showq(this.value)"  value='<%=(c+1)%>' style='background-color:red;color:white;font-size:20px;width:40px;height:35px'>
  <%}
}
 int p=(int)((ca/(float)tq)*100); 
%>
<h3 style="color:green">Total correct answers:<%=ca%></h3>
<h3 style="color:red">Total incorrect answers:<%=(tq-ca)%></h3>
<h3 style='color:<%=p>=50?"green":"red"%>'>Correct percentage:<%=p%>%</h3>
<%
  String query="insert into ResultInfo(user_id,paper,total_question,correct_answer,percentage,test_date) values('"+session.getAttribute("userid")+"','"+session.getAttribute("paper")+"',"+tq+","+ca+","+p+",curDate())";
  st.executeUpdate(query);
  String qrdel="delete from schedulerequest where userid=? and test_code=?";
  PreparedStatement ps=cn.prepareStatement(qrdel);
  ps.setString(1,(String)session.getAttribute("userid"));
  ps.setString(2,(String)session.getAttribute("testcode"));
  ps.executeUpdate();  
%>
<hr style='margin-top:10;border:2px solid red'>
<div id='showq'>
</div>
