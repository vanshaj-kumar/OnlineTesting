<head>
<script type="text/javascript">
function enable(field,element)
{
     if(element.value=="Save")
     { 
       save(field,element);  
       return; 		
     }  	
     document.getElementById(field).disabled=false;
     element.value="Save";
     element.blur();
}
function save(field,element)
{
     var dt=document.getElementById(field).value;    	
     var obj=new XMLHttpRequest();
     obj.onreadystatechange=function()
     { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("msg").innerHTML=res;           
         }
     };
     var url="saveedit.jsp?col="+field+"&val="+dt;
     obj.open("POST",url);
     obj.send();

}
</script>
</head>
<style>
 input[type='text'] 
 {
   border-radius:5px;
   font-size:18px;
   width:170px;
   height:30px;
 }
 input[type='button'] 
 {
   border:none;
   color:blue;
   text-decoration:underline;
   background-color:white;
   font-size:18px;
   cursor:hand;
 }
</style>
<%@ include file='questionsmenu.jsp' %>
<%@ include file='conn.jsp' %>
<form>
 <table style='margin-top:34px;border:2px solid blue;font-size:20px;background-color:#E0E0E0' cellpadding='3px' align='center'>
  <tr>
    <td>Enter Question id</td>
  <%
   String qid=request.getParameter("qid"); 
  %>
    <td><input type='text' name='qid' value='<%=qid==null?"":qid%>' required></td>
    <td><input type='submit' value='Show Record' style='border-radius:4px;font-size:17px;border-color:red;background-color:#000;color:white'></td>
   </tr>
 </table>
<%
 if(qid!=null)
 {
    session.setAttribute("qid",qid); 	
    PreparedStatement ps=cn.prepareStatement("select question,ans1,ans2,ans3,ans4,correctans from questionbank where qid=?");	
    ps.setString(1,qid);
    ResultSet rst=ps.executeQuery();
    if(rst.next())
    {
      %>
      <form name="frm">
       <table align='center'  cellpadding='5px' style='margin-top:37px;font-size:22px'>
        <tr style='background-color:#99FF99;color:darkred'>
         <th>Question</th>
         <th>Ans1</th>
         <th>Ans2</th>
         <th>Ans3</th>
         <th>Ans4</th>
         <th>CorrectAns</th>
        </tr>
 	<tr>
         <td><input type='text' id='question' name='question' disabled value='<%=rst.getString(1)%>'></td>
         <td><input type='text' id='ans1' name='ans1' disabled value='<%=rst.getString(2)%>'></td>
         <td><input type='text' id='ans2' name='ans2' disabled value='<%=rst.getString(3)%>'></td>
         <td><input type='text' id='ans3' name='ans3' disabled value='<%=rst.getString(4)%>'></td>
         <td><input type='text' id='ans4' name='ans4' disabled value='<%=rst.getString(5)%>'></td>
         <td><input type='text' id='correctans' name='correctans' disabled value='<%=rst.getString(6)%>'></td>
        </td>
        <tr> 	
         <td><input type='button' value='Edit' onclick="enable('question',this)"></td>
         <td><input type='button' value='Edit' onclick="enable('ans1',this)"></td>
         <td><input type='button' value='Edit' onclick="enable('ans2',this)"></td>
         <td><input type='button' value='Edit' onclick="enable('ans3',this)"></td>
         <td><input type='button' value='Edit' onclick="enable('ans4',this)"></td>
         <td><input type='button' value='Edit' onclick="enable('correctans',this)"></td>
        </tr>
       </table>
       </form>
      <% 	
    }
    else
    {
      %>
       <div align='center' style='margin-top:50px'>
         <h2 style='color:red'>Question not found...</h2>
       </div>
    <%
    }
 }  
%>
</form>
<div id='msg'>
</div>