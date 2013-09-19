<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
<form action="addparticipants" method="POST" name="update" id="update" >

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" id="su" >

    <c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
      
      </table>
      <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left">
        	<div>
	            <div class="headings altheading">
	              <h2>Add Participants</h2>
	            </div>
            <div class="contentbox">
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				<tr>
    				<td align="left" valign="top" width="50%" style="padding-right:25px;">
    					<h2 class="quck-txt">Quick Info</h2>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%">
                        		<tr class="row1">
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="input_txtbx1" id="fname" name="fname" /><br/>
				                  	<font color="Red" size="+1">
				                  	<span id="spnfname" >
				                  			  <form:errors path="participant.fname"></form:errors>      	
				                  	</span></font>
				                  	         </td>
				                  
				                </tr>

								 <tr class="row2">
						         	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Last Name :</td>
						            <td valign="top" align="left" class="input_txt">
						            	<input type="text" class="input_txtbx1" id="lname" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="lname"/>
						            	</br><font color="Red" size="+1"><span id="spnlname" ></span>
						            	<form:errors path="participant.lname"></form:errors> </font>
						            	</td>
						         </tr> 
								<tr class="row1">
				                	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Mobile No :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="mno" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${mobile_num}"  name="mobile_num" /></br>
				                  	<font color="Red" size="+1"><span id="spnmno" ><form:errors path="participant.mobile_num"></form:errors> </span></font></td>
				                </tr> 
								<tr class="row2">
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Email-Id :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="eid" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="email_id" /></br>
				                  	<font color="Red" size="+1"><span id="spneid" ><form:errors path="participant.email_id"></form:errors> </span></font></td>
				                </tr>	
								<tr class="row1">
					            	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Gender :</td>
					                <td valign="top" align="left" class="input_txt"><input type="radio" name="gender" value="0" class="input_txt" checked="true">Male&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="1" class="input_txt">Female&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="2" class="input_txt">Transgender</td>
				                </tr>
								<tr class="row2">
				                 	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Age :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="age" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="age" /></br>
				                  	<font color="Red" size="+1"><span id="spnage" ><form:errors path="participant.age"></form:errors> </span></font></td>
				               	</tr>
						
				                <tr class="row1">
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> City :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="city" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="city"/></br>
				                  	<font color="Red" size="+1"><span id="spncity" ><form:errors path="participant.city"></form:errors> </span></font></td>
				                </tr>
								 <tr class="row2">
				                 	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Education :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  		<select name="education" class="input_cmbbx1">
				                  		<option selected="selected" value="">--select--</option>
						                    <option value="School" id="edu" >School</option>
											<option value="Some Collage" id="edu" >Some College</option>
											<option value="Professional Degree" id="edu" >Professional Degree</option>
											<option value="Master Degree" id="edu" >Master Degree</option>
				                   		</select>
				                   		<br/>
				                   		<font color="Red" size="+1"><span id="spnedu" ><form:errors path="participant.education"></form:errors> </span></font>
				                   	</td>
				                   	
				                </tr>
								<tr class="row1">
				                	<td valign="top" align="left" class="input_txt"><span class="err">*</span> Note :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  		<textarea class="input_txtbx1" id="note" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"/></textarea>
				                  		<br/><font color="Red" size="+1"><span id="spnnote"><form:errors path="participant.note"></form:errors> </span></font>
									</td>
						       	</tr>
						                 
              				</table>
              			</td>
    					<td align="left" valign="top"> <h2 class="quck-txt">More Info</h2>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
			                <tr class="row1">
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Medical Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
			                  <td valign="top" align="left" class="input_txt">
			                  	<textarea class="input_txtbx1" id="det" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="medical_details"/></textarea>
			                  	</br><font color="Red" size="+1"><span id="spndet" ><form:errors path="participant.medical_details"></form:errors> </span></font></td>
			                  	
			                </tr>


							<tr>
								<td><p class="quck-txt">Texting&nbsp;Preference</p>
								</td>
							</tr>



		  					<tr class="row2">
                  				<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Messaging Frequency:</td>
                  				<td valign="top" align="left" class="input_txt">
                  					<select name="messaging_frequency" class="input_cmbbx1" id="msg">
                  					<option selected="selected" value="">--Select--</option>
                   						<option value="Daily Twice" id="msg">Daily Twice</option>
										<option value="Once a Day" id="msg">Once a Day</option>
										<option value="Once in a week" id="msg">Once in a week</option>
										<option value="No Preference" id="msg">No Preference</option>
							      	</select>
							    </td>
							    </br><font color="Red" size="+1"><span id="spnmsg" ><form:errors path="participant.messaging_frequency"></form:errors> </span>
                			</tr>

							<tr><td><p class="quck-txt">Group</p></td></tr>
							<tr class="row1"><td colspan="2"><p style=" line-height: 18px; padding: 1px 0pt; text-align: justify">Group is the internal classification for the better understanding of Participant's Demographics.<a href="addparticipantgroups" onclick="javascript:CreateGroup()">[Create New Group]</a></p></td></tr>
							<tr class="row2">
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Select Group&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
			                  <td valign="top" align="left" class="input_txt">
			                  <select name="group_name">
			                  <c:forEach items="${participantGroupForm.participantGroups}" var="participantGroups" varStatus="status">
			                   <option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
			                   </c:forEach>
			                  
			                  </select>
			                  
			                  
			                  
			                  </br><font color="Red" size="+1"><span id="spnmsg" ><form:errors path="participant.group_name"></form:errors> </span></font></td>
			                </tr>
			         	</table>
			    	</td>
              	</tr>
                <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" name="insert" class="submit_btn2" value="Add Participant">
                  <span id="spnsub" > </span></td>
                </tr>
              </table>
         	</td>
  		</tr>
 	</table>
</form>
</div>
 <script language="JavaScript">
 /*function validate()
 {
	 var Fname = document.getElementById("fname").value;
	 var Lname=document.getElementById("lname").value;
	 var mno = document.getElementById("mno").value;
	 var eid = document.getElementById("eid").value; 
	 var age = document.getElementById("age").value;
	 var city = document.getElementById("city").value;
	 var edu = document.getElementById("edu").value;
	 var note = document.getElementById("note").value;
	 var det=document.getElementById("det").value;
	 var msg = document.getElementById("msg").value;

	 
	  if ((Fname == "" && Lname == "")&&(mno == "" && eid == "") && (age == "" && city == ""))
		{
		document.getElementById("spnsub").value="submit";
     document.getElementById("spnfname").innerHTML = "*Firstname is required";
     document.getElementById("spnlname").innerHTML = "*Lastname is required";
     document.getElementById("spnmno").innerHTML = "*Mobile number is required";
     document.getElementById("spneid").innerHTML = "*E mail id is required";
     document.getElementById("spnage").innerHTML = "*age is required";
     document.getElementById("spncity").innerHTML = "*city is required";
     document.getElementById("spnedu").innerHTML = "education is required";
     document.getElementById("spnnote").innerHTML ="pls enter this";
     document.getElementById("spndet").innerHTML="Medical details are required";
     document.getElementById("spnmsg").innerHTML="Messaging frequency is required";
     return false;
		}
	  else if (Fname == null || Fname == "" ) {
         document.getElementById("spnfname").value="fname";
         document.getElementById("spnfname").innerHTML = "*Firstname is required";
         document.getElementById("spnlname").innerHTML="";
         document.getElementById("spnlname").innerHTML = "*Lastname is required";
         document.getElementById("spnmno").innerHTML="";
         document.getElementById("spnmno").innerHTML = "*Mobile number is required";
         document.getElementById("spneid").innerHTML="";
         document.getElementById("spneid").innerHTML = "*E mail id is required";
         document.getElementById("spnage").innerHTML="";
         document.getElementById("spnage").innerHTML = "*age is required";
         document.getElementById("spncity").innerHTML="";
         document.getElementById("spncity").innerHTML = "*city is required";
         document.getElementById("spnedu").innerHTML="";
         document.getElementById("spnedu").innerHTML = "education is required";
         document.getElementById("spnnote").innerHTML="";
         document.getElementById("spnnote").innerHTML="Pls enter this";
         document.getElementById("spndet").innerHTML="";
         document.getElementById("spndet").innerHTML="Medical details are required";
         document.getElementById("spnmsg").innerHTML="";
         document.getElementById("spnmsg").innerHTML="Messaging frequency is required";
       return false;
	 }
	  else if (Lname == null || Lname == "") {
         document.getElementById("spnlname").value="user name";
         document.getElementById("spnlname").innerHTML = "*Lastname is required";
         document.getElementById("spnmno").innerHTML="";
       
       return false;
   }
	  else if (mno == null || mno == "") {
         document.getElementById("spnmno").value="mno";
         document.getElementById("spnmno").innerHTML = "*Mobile number is required";
       return false;
   }
	  else if (eid == null || eid == "") {
         document.getElementById("spneid").value="eid";
         document.getElementById("spneid").innerHTML = "*E mail id is required";
       return false;
   }
	  else if (age == null || age == "")
		  {
		  document.getElementById("spnage").value="age";
		  document.getElementById("spnage").innerHTML = "*age is required";
		  return false;
		  }
	  else if (city == null || city == "")
	  {
	  document.getElementById("spncity").value="city";
	  document.getElementById("spncity").innerHTML = "*city is required";
	  return false;
	  }
	  else if (edu == null || edu == "")
	  {
	  document.getElementById("spnedu").value="education";
	  document.getElementById("spnedu").innerHTML = "*Education is required";
	  return false;
	  }
	  else if (note == null || note == "")
	  {
	  document.getElementById("spnnote").value="*note";
	  document.getElementById("spnnote").innerHTML = "*pls enter this";
	  return false;
	  }
	  else if (det == null || det == "")
		  {
		  document.getElementById("spndet").value="*note";
		  document.getElementById("spndet").value="medical details are required";
		  return false;
		  }
	  else if (msg == null || msg == "")
	  {
	  document.getElementById("spnmsg").value="*note";
	  document.getElementById("spnmsg").value="messages are required";
	  return false;
	  }
		/// document.getElementById('success_statusbar').style.display='inline';
	return true;
 }
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}*/
</script>
<jsp:include page="footer.jsp"></jsp:include>