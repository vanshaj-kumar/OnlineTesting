<head>
<script type='text/javascript'>
function showQ()
{ 
     var obj=new XMLHttpRequest();
     obj.onreadystatechange=function()
     { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("questions").innerHTML=res;           
         }
     };
     var url="showquestions.jsp?pid="+document.getElementById("paper").value;
     obj.open("POST",url);
     obj.send();
}
function cc()
{
  document.getElementById('editq').style.color='red';
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
</style>
<%@ include file='questionsmenu.jsp' %>
<%@ include file='conn.jsp' %>
<body onload='cc()'>
<form>
 <table style='border:2px solid blue;font-size:20px;background-color:#E0E0E0;margin-top:32px' cellpadding='3px' align='center'>
  <tr>
    <td>Select Paper</td>
      <td><select id="paper" style="font-size:19px;border-radius:0.2em">
              <%
	    Statement st1=cn.createStatement();
	    ResultSet rst=st.executeQuery("select distinct q.paperid,paper from questionbank q join papers p on q.paperid=p.paperid");
	    while(rst.next())
	    {
              %>
                  <option value='<%=rst.getString(1)%>'><%=rst.getString(2)%></option>
                 <% } %>
             </select>
     </td>
    <td><input type='button' onclick="showQ()" value='Show Record' style='border-radius:4px;font-size:17px;border-color:blue;background-color:#000;color:white'></td>
   </tr>
 </table>
</form>
<div align='center' style='margin-top:20px' id='questions'>
</div>
