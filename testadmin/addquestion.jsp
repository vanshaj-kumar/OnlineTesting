<head>
  <script>
    function cc()
    {
	document.getElementById('addq').style.color='red';
    }
    function addQuestion()
    { 
        var obj=new XMLHttpRequest();
        obj.onreadystatechange=function()
        { 
         if(obj.readyState==4)
         {
           var res=obj.responseText;
           document.getElementById("addquestion").innerHTML=res;
         }
        };
        var sub=document.getElementById("paper").value;
        if(sub=="C++")
           sub="cp";
        var que=document.getElementById("question").value; 
        var a1=document.getElementById("ans1").value;
        var a2=document.getElementById("ans2").value;
        var a3=document.getElementById("ans3").value;
        var a4=document.getElementById("ans4").value;
        var corr=document.getElementById("correctans").value;
        var url="savequestion.jsp?paper="+sub+"&que="+que+"&a1="+a1+"&a2="+a2+"&a3="+a3+"&a4="+a4+"&corr="+corr;
        obj.open("POST",url);
        obj.send();
    }
  </script>
</head>
<%@ include file="questionsmenu.jsp"%>
<%@ include file="conn.jsp"%>
<body onload='cc()'>
<form>
  <table align="center" style="margin-top:32px;font-size:20px;border:2px solid red" cellpadding="7">
    <tr>
      <td>Select Paper</td>
      <td><select id="paper" style="font-size:19px;border-radius:0.2em">
              <%
	    Statement st1=cn.createStatement();
	    ResultSet rst=st.executeQuery("select paper from papers");
	    while(rst.next())
	    {
              %>
                  <option><%=rst.getString(1)%></option>
                 <% } %>
             </select>
     </td>
    </tr>
    <tr>
     <td><b>Enter question</b></td>
     <td><textarea style="width:300px;height:50px;font-size:18px" id="question"></textarea></td>
    </tr>
    <tr>
     <td><b>Enter answer1</b></td>
     <td><textarea style="width:300px;height:30px;font-size:18px" id="ans1"></textarea></td>
    </tr>
    <tr>
     <td><b>Enter answer2</b></td>
     <td><textarea style="width:300px;height:30px;font-size:18px" id="ans2"></textarea></td>
    </tr>
    <tr>
     <td><b>Enter answer3</b></td>
     <td><textarea style="width:300px;height:30px;font-size:18px" id="ans3"></textarea></td>
    </tr>
    <tr>
     <td><b>Enter answer4</b></td>
     <td><textarea style="width:300px;height:30px;font-size:18px" id="ans4"></textarea></td>
    </tr>
    <tr>
     <td><b>Select correct answer</b></td>
     <td><select style="font-size:21px" id="correctans">
             <option>1</option><option>2</option><option>3</option><option>4</option>
     </select></td>
    </tr>
    <tr>
     <td colspan="2" align="center">
      <input type="button" value="Save question" onclick="addQuestion()" style="height:33px;font-size:1em;border-radius:0.2em">&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="Clear" style="width:67px;height:33px;font-size:1em;border-radius:0.2em">
     </td>
    </tr>
   </table>
   <div align="center" id="addquestion" style="margin-top:20px"></div>
</form>
</body>