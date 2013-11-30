<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" url="resources/js/jquery.js" />
<script src="/BePhitResearchApp/resources/js/jquery.js"></script>
<div id="right_content">

<script type="text/javascript">
$(window).load(function(){
var oldValue = "";
$("#mno").keyup(function() {
	$("#spnmno").html('');
	var intRegex = /^\d+$/;
	if(intRegex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();
		var $newdiv="";
	  var $i=0;
	  if($in.length>10)
		  {
		  $("#spnmno").html('Mobile number is not valid. Should be of length 10!!');		
		   }	
			
	}
	else if($(this).val()!='')
		{
		
		$("#spnmno").html('Kindly give numbers only!!');
		}
}).keydown(function() {
    oldValue = $(this).val();
})
});
</script>



<script>
   function validate(){
var fld = document.getElementById('group_name');
var values = [];
for (var i = 0; i < fld.options.length; i++) {
  if (fld.options[i].selected) {
    values.push(fld.options[i].value);
  }
}

if(values.length>4)
{
alert("You can select only 4 groups");
return false;
}
else
return true;
}
</script>


	<form action="addparticipants" method="POST" name="update" id="update">

		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table" id="su">

			<c:if test="${success==true}">
				<tr>
					<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
						<div id="success_statusbar" class="status success">
							<p class="closestatus">
								<a title="Close" href="">x</a>
							</p>
							<p>
								<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
							</p>
						</div>
				</tr>
			</c:if>

		</table>
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
			<tr>
				<td valign="top" align="left">
					<div>
						<div class="headings altheading">
							<h2>Add Participant</h2>
						</div>
						<div class="contentbox">
<c:choose>
<c:when test="${empty addparticipants}">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td align="left" valign="top" width="50%"
										style="padding-right: 25px;">
										<h2 class="quck-txt">Quick Info</h2>
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> First Name :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="fname" name="fname" /><br />
													<font color="Red" size="+1"> <span id="spnfname">
															<form:errors path="participant.fname"></form:errors>
													</span></font></td>

											</tr>

											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> User Name :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="lname"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="username" /> </br> <font
													color="Red" size="+1"><span id="spnlname"></span>
													 <c:if test="${user_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>User name already exists </font>	<br/></c:if>
													 <form:errors
															path="participant.username"></form:errors> </font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Mobile No :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="mno"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"
													value="${mobile_num}" name="mobile_num" /></br> <font
													color="Red" size="+1"><span id="spnmno">
													 <c:if test="${mobile_exists ==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number already exists </font>	<br/></c:if>
													<font color="Red" size="+1"><span id="spnmno">
													<form:errors path="participant.mobile_num"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Email-Id :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="eid"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="email_id" /></br>
													<font color="Red" size="+1"><span id="spneid">
																			 <c:if test="${email_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>Email already exists </font>	<br/></c:if>
																				
													<form:errors
																path="participant.email_id"></form:errors> </span></font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Gender :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="radio" name="gender" value="0" class="input_txt"
													checked="true">Male&nbsp;&nbsp;&nbsp;<input
													type="radio" name="gender" value="1" class="input_txt">Female&nbsp;&nbsp;&nbsp;</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> <%--  Age :<c:forEach begin="1" end="100" var="i">
                                 <option value="${i}" <c:if test ="${participantsDetails.age == i}">select</c:if>>${i}</option>
                                                       </c:forEach>   --%>
													Age:</td>
												<td valign="top" align="left" class="input_txt"><select
													name="age" class="input_cmbbx1">
													    <option>--Select--</option>
														<option value="below 12" id="age">Below 12</option>
														<option value="12-20 years" id="age">12-20 &#160 years</option>
														<option value="20-30 years" id="age">20-30 &#160 years</option>
														<option value="30-40 years" id="age">30-40 &#160 years</option>
														<option value="40-50 years" id="age">40-50 &#160 years</option>
														<option value="50-60 years" id="age">50-60 &#160 years</option>
														<option value="60-70 years" id="age">60-70 &#160 years</option>
														<option value="70-80 years" id="age">70-80 &#160 years</option>
														<option value="80-90 years" id="age">80-90 &#160 years</option>
														<option value="90-100 years" id="age">90-100
															years</option>
														
														<span id="spnage"><form:errors
																path="participant.age"></form:errors> </span>
														</font></td>
											</tr>

											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> City :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="city"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="city" /></br> <font
													color="Red" size="+1"><span id="spncity"><form:errors
																path="participant.city"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Education :</td>
												<td valign="top" align="left" class="input_txt"><select
													name="education" class="input_cmbbx1">
														<option selected="selected" value="">--Select--</option>
														<option value="School" id="edu">School</option>
														<option value="Some Collage" id="edu">Some
															College</option>
														<option value="Professional Degree" id="edu">Professional
															Degree</option>
														<option value="Master Degree" id="edu">Master
															Degree</option>
												</select> <br /> <font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.education"></form:errors> </span></font></td>

											</tr>
											<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err"></span> Medical
													Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													:</td>
												<td valign="top" align="left" class="input_txt"><textarea
														class="input_txtbx1"  id="det"
														onmouseover="showTooltip('tooltip_id','inp_id3');"
														onmouseout="hideTooltip('tooltip_id');"
														style="width: 177px; height: 89px;" name="medical_details" /></textarea>
													</br> <font color="Red" size="+1"><span id="spndet"><form:errors
																path="participant.medical_details"></form:errors> </span></font></td>

											</tr>

										</table>
									</td>
									<td align="left" valign="top">
										
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											


											
                                              <tr>
												<td><p class="quck-txt">Preferred&nbsp;Timings</p></td>
											</tr>

                                            <tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time1:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
														<option selected="selected" value="">--Select--</option>
														<option value="00-01" id="time">00-01</option>
														<option value="01-02" id="time">01-02</option>
														<option value="02-03" id="time">02-03</option>
														<option value="03-04" id="time">03-04</option>
														<option value="04-05" id="time">04-05</option>
														<option value="05-06" id="time">05-06</option>
														<option value="06-07" id="time">06-07</option>
														<option value="07-08" id="time">07-08</option>
														<option value="08-09" id="time">08-09</option>
														<option value="09-10" id="time">09-10</option>
														<option value="10-11" id="time">10-11</option>
														<option value="11-12" id="time">11-12</option>
														<option value="12-13" id="time">12-13</option>
														<option value="13-14" id="time">13-14</option>
														<option value="14-15" id="time">14-15</option>
														<option value="15-16" id="time">15-16</option>
														<option value="16-17" id="time">16-17</option>
														<option value="17-18" id="time">17-18</option>
														<option value="18-19" id="time">18-19</option>
														<option value="19-20" id="time">19-20</option>
														<option value="21-22" id="time">21-22</option>
														<option value="22-23" id="time">22-23</option>
														<option value="23-00" id="time">23-00</option>
														
															
												</select><span>     Hours</span><br/>
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time2:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time2" class="input_cmbbx1" id="msg">
														<option selected="selected" value="">--Select--</option>
														<option value="00-01" id="time">00-01</option>
														<option value="01-02" id="time">01-02</option>
														<option value="02-03" id="time">02-03</option>
														<option value="03-04" id="time">03-04</option>
														<option value="04-05" id="time">04-05</option>
														<option value="05-06" id="time">05-06</option>
														<option value="06-07" id="time">06-07</option>
														<option value="07-08" id="time">07-08</option>
														<option value="08-09" id="time">08-09</option>
														<option value="09-10" id="time">09-10</option>
														<option value="10-11" id="time">10-11</option>
														<option value="11-12" id="time">11-12</option>
														<option value="12-13" id="time">12-13</option>
														<option value="13-14" id="time">13-14</option>
														<option value="14-15" id="time">14-15</option>
														<option value="15-16" id="time">15-16</option>
														<option value="16-17" id="time">16-17</option>
														<option value="17-18" id="time">17-18</option>
														<option value="18-19" id="time">18-19</option>
														<option value="19-20" id="time">19-20</option>
														<option value="21-22" id="time">21-22</option>
														<option value="22-23" id="time">22-23</option>
														<option value="23-00" id="time">23-00</option>
														
															
												</select><span>     Hours</span><br/>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time3:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
														<option selected="selected" value="">--Select--</option>
														<option value="00-01" id="time">00-01</option>
														<option value="01-02" id="time">01-02</option>
														<option value="02-03" id="time">02-03</option>
														<option value="03-04" id="time">03-04</option>
														<option value="04-05" id="time">04-05</option>
														<option value="05-06" id="time">05-06</option>
														<option value="06-07" id="time">06-07</option>
														<option value="07-08" id="time">07-08</option>
														<option value="08-09" id="time">08-09</option>
														<option value="09-10" id="time">09-10</option>
														<option value="10-11" id="time">10-11</option>
														<option value="11-12" id="time">11-12</option>
														<option value="12-13" id="time">12-13</option>
														<option value="13-14" id="time">13-14</option>
														<option value="14-15" id="time">14-15</option>
														<option value="15-16" id="time">15-16</option>
														<option value="16-17" id="time">16-17</option>
														<option value="17-18" id="time">17-18</option>
														<option value="18-19" id="time">18-19</option>
														<option value="19-20" id="time">19-20</option>
														<option value="21-22" id="time">21-22</option>
														<option value="22-23" id="time">22-23</option>
														<option value="23-00" id="time">23-00</option>
														
															
												</select><span>     Hours</span><br/>
												</td>
											</tr>


											<tr>
												<td><p class="quck-txt">Group</p></td>
											</tr>
											<tr class="row1">
												<td colspan="2"><p
														style="line-height: 18px; padding: 1px 0pt; text-align: justify">
														Group is the internal classification for the better
														understanding of Participant's Demographics.<a
															href="addparticipantgroups"
															onclick="javascript:CreateGroup()">[Create New Group]</a>
													</p></td>
											</tr>
											<tr><td><input type="hidden" id="Provider_name" name="Provider_name" value="<sec:authentication property="principal.username"/>"/></tr>
											
											<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Select
													Group&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													:</td>
												<td valign="top" align="left" class="input_txt">
												<select class="input_cmbbx2" id="group_name"
													name="group_name" multiple="multiple">
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select> </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font></td>
											</tr>
										</table>	<div>Note:	To Select Multiple Groups use ctrl+click</div>	
									</td>
								</tr></table>
								
							
								
								<table align="right" border="0" cellspacing="0" cellpadding="0">
								<tr class="row1">
									<td valign="top" align="left" border="0"><input type="submit" onclick="return validate('this')"
										name="insert" class="submit_btn2" value="Add Participant">
										<span id="spnsub"> </span></td>
										<td valign="middle" style="padding-left:10px;" ><input type="reset" class="submit_btn" value="Reset"></td>
										 <td valign="middle" style="padding-left:10px;" ><a href="viewparticipants" class="submit_btn" style="color:white ;font-size:14px;text-decoration: none;">Cancel</a>
										
								</tr>
							</table>
							</c:when>
							<c:otherwise>
							 <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
    <td align="left" valign="top" width="50%" style="padding-right:25px;">
    <h2 class="quck-txt">Quick Info</h2>
    
   
     <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.fname }" name="fname" /></br><span class="err"><form:errors path="participant.fname"></form:errors></span></td>
                </tr>

		 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> User Name :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.username }" name="username"/></br><font color="Red" size="+1"><span class="err"><c:if test="${user_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>Username already exists </font>	<br/></c:if><form:errors path="participant.username"></form:errors></font></td>
                </tr> 
		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Mobile No :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" id="mno" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.mobile_num}" name="mobile_num" /></br><font color="Red" size="+1"><span class="err"><c:if test="${mobile_exists ==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number already exists </font>	<br/></c:if><font color="Red" size="+1"><span id="spnmno"><form:errors path="participant.mobile_num"></form:errors></span> </font></td>
                </tr> 
		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Email-Id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.email_id}" name="email_id" /></br><font color="Red" size="+1"><span class="err"><c:if test="${email_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>Email already exists </font>	<br/></c:if><form:errors path="participant.email_id"></form:errors></span> </font></td>
                </tr> 

		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err"></span> Gender :</td>
                  <td valign="top" align="left" class="input_txt">
                  <input type="radio" name="gender" value="0"  class="input_txt" <c:if test="${addparticipants.gender=='0'}"><c:out value="checked=checked"/></c:if>>Male
                  <input type="radio" name="gender" value="1"  class="input_txt" <c:if test="${addparticipants.gender=='1'}"><c:out value="checked=checked"/></c:if>> Female</td>
                </tr>
		 <tr class="row1">
                 <td valign="middle" align="left" class="input_txt"><span class="err"></span> Age :</td>
                 <td valign="top" align="left" class="input_txt"><select name="age" class="input_cmbbx1">
                 <option <c:if test="${participantsDetails.age=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
                 <option value="Below 12" <c:if test="${participantsDetails.age=='Below 12'}"><c:out value="selected"/></c:if>>Below 12</option>
                 <option value="12-20 years" <c:if test="${participantsDetails.age=='12-20 years'}"><c:out value="selected"/></c:if>>12-20 &#160 years</option>
                 <option value="20-30 years" <c:if test="${participantsDetails.age=='20-30 years'}"><c:out value="selected"/></c:if>>20-30 &#160 years</option>
                 <option value="30-40 years" <c:if test="${participantsDetails.age=='30-40 years'}"><c:out value="selected"/></c:if>>30-40 &#160 years</</option>                  
                 <option value="40-50 years" <c:if test="${participantsDetails.age=='40-50 years'}"><c:out value="selected"/></c:if>>40-50 &#160 years</option>
                 <option value="50-60 years"  <c:if test="${participantsDetails.age=='50-60 years'}"><c:out value="selected"/></c:if>>50-60 &#160 years</option>
                 <option value="60-70 years" <c:if test="${participantsDetails.age=='60-70 years'}"><c:out value="selected"/></c:if>>60-70 &#160 years</option>
                 <option value="70-80 years" <c:if test="${participantsDetails.age=='70-80 years'}"><c:out value="selected"/></c:if>>70-80 &#160 years</option>
                 <option value="80-90 years" <c:if test="${participantsDetails.age=='80-90 years'}"><c:out value="selected"/></c:if>>80-90 &#160 years</option>
                   <option value="90-100 years" <c:if test="${participantsDetails.age=='90-100 years'}"><c:out value="selected"/></c:if>>90-100 years</option>
                  
                  </select><%-- <input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.age}" name="age" /></br><span class="err"><form:errors path="participant.age"></form:errors></span> --%></td>
                </tr>
		
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err"></span> City :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.city}" name="city"/></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.city"></form:errors></span> </font></td>
                </tr>
		 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err"></span> Education :</td>
                  <td valign="top" align="left" class="input_txt"><select name="education" class="input_cmbbx1">
                          <option <c:if test="${participantsDetails.education=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
                    <option value="School" <c:if test="${addparticipants.education=='School'}"><c:out value="selected"/></c:if>>School</option>
			<option value="Some College" <c:if test="${addparticipants.education=='Some College'}"><c:out value="selected"/></c:if> >Some College</option>
			<option value="Professional Degree" <c:if test="${addparticipants.education=='Professional Degree'}"><c:out value="selected"/></c:if>>Professional Degree</option>
			<option value="Master Degree" <c:if test="${addparticipants.education=='Master Degree'}"><c:out value="selected"/></c:if>>Master Degree</option>
                   </select></td>
                </tr>

                <tr class="row2">
                  <td valign="top" align="left" class="input_txt"><span class="err"></span> Medical Details :</td>
                  <td valign="top" align="left" class="input_txt"><textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 220px; height: 89px;" name="medical_details"/>${addparticipants.medical_details }</textarea></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.medical_details"></form:errors></span></font></td>
                </tr>


		              </table> 
              </td>
    <td align="left" valign="top">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
              
             
<tr><td><p class="quck-txt">Preferred&nbsp;Timings
</p></td></tr>



		<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time1:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
												<option  <c:if test="${addparticipants.time1=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
												
					  <option value="00-01" <c:if test="${addparticipants.time1=='00-01'}"><c:out value="selected"/></c:if>>00-01</option>
                   <option value="01-02"  <c:if test="${addparticipants.time1=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${addparticipants.time1=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${addparticipants.time1=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${addparticipants.time1=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${addparticipants.time1=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${addparticipants.time1=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${addparticipants.time1=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${addparticipants.time1=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${addparticipants.time1=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
					<option value="10-11"  <c:if test="${addparticipants.time1=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${addparticipants.time1=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${addparticipants.time1=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${addparticipants.time1=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${addparticipants.time1=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${addparticipants.time1=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${addparticipants.time1=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${addparticipants.time1=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${addparticipants.time1=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${addparticipants.time1=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${addparticipants.time1=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${addparticipants.time1=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${addparticipants.time1=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${addparticipants.time1=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   
															
												</select><span>     Hours</span><br/>
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time2:</td>
												<td valign="top" align="left" class="input_txt" >
												<select name="time2" class="input_cmbbx1" id="msg"">
													<option  <c:if test="${addparticipants.time2=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
                   <option value="00-01" <c:if test="${addparticipants.time2=='00-01'}"><c:out value="selected"/></c:if>>00-01</option>
                   <option value="01-02"  <c:if test="${addparticipants.time2=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${addparticipants.time2=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${addparticipants.time2=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${addparticipants.time2=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${addparticipants.time2=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${addparticipants.time2=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${addparticipants.time2=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${addparticipants.time2=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${addparticipants.time2=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
					<option value="10-11"  <c:if test="${addparticipants.time2=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${addparticipants.time2=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${addparticipants.time2=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${addparticipants.time2=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${addparticipants.time2=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${addparticipants.time2=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${addparticipants.time2=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${addparticipants.time2=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${addparticipants.time2=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${addparticipants.time2=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${addparticipants.time2=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${addparticipants.time2=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${addparticipants.time2=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${addparticipants.time2=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   										
												</select><span>     Hours</span><br/>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time3:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
				<option  <c:if test="${addparticipants.time3=='null'}"><c:out value="selected"/></c:if>>--Select--</option>								
				<option value="00-01" <c:if test="${addparticipants.time3=='00-01'}"><c:out value="selected"/></c:if>>00-01</option>
                   <option value="01-02"  <c:if test="${addparticipants.time3=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${addparticipants.time3=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${addparticipants.time3=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${addparticipants.time3=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${addparticipants.time3=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${addparticipants.time3=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${addparticipants.time3=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${addparticipants.time3=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${addparticipants.time3=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
					<option value="10-11"  <c:if test="${addparticipants.time3=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${addparticipants.time3=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${addparticipants.time3=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${addparticipants.time3=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${addparticipants.time3=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${addparticipants.time3=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${addparticipants.time3=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${addparticipants.time3=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${addparticipants.time3=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${addparticipants.time3=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${addparticipants.time3=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${addparticipants.time3=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${addparticipants.time3=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${addparticipants.time3=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   	
                   
															
												</select><span>     Hours</span><br/>
												</td>
											</tr>
				
                
                <tr><td><input type="hidden" id="Provider_name" name="Provider_name" value="<sec:authentication property="principal.username" />"></tr>

<tr><td><p class="quck-txt">Group</p></td></tr>

<tr class="row1"><td colspan="2"><p style=" line-height: 18px; padding: 1px 0pt; text-align: justify"><span class="err">*</span>Group is the internal classification for the better understanding of Participant's Demographics.<a href="addparticipantgroups" onclick="javascript:CreateGroup()">[Create New Group]</a></p></td></tr>



    <tr class="row1">
                  <td valign="top" align="left" class="input_txt">Select Group :</td>
                  <td valign="top" align="left" class="input_txt">
                  <select name="group_name" multiple="multiple" class="input_cmbbx1" id="group_name">
                  <c:forEach items="${participantGroupForm.participantGroups}" var="participantGroups" varStatus="status">
			                   <option value="${participantGroups.group_name}" <c:if test="${addparticipants.group_name==participantGroups.group_name}"><c:out value="selected"/></c:if>>${participantGroups.group_name}</option>
			                   </c:forEach>
                  
                  </select>
                  
                  
                  </br><font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font></td>
                </tr>            
 </table>
 <div>Note:	To Select Multiple Groups use ctrl+click</div>	

                  </td>
                </tr></table>
                
                 
              <table align="right" cellspacing="0" cellpadding="0" border="0">
								<tr class="row1">
									<td valign="top" align="center">&nbsp;</td>
									<td valign="top" align="left"><input type="submit" onclick="return validate('this')"
										name="insert" class="submit_btn2" value="Add Participant">
										<span id="spnsub"> </span></td>			
										
										 <td valign="middle" style="padding-left:10px;" ><a href="showaddparticipants" class="submit_btn" style="color:white ;font-size:14px;text-decoration: none;">Reset</a></td>
										 <td valign="middle" style="padding-left:10px;" ><a href="viewparticipants" class="submit_btn" style="color:white ;font-size:14px;text-decoration: none;">Cancel</a>
										
								</tr>
							</table>
				</c:otherwise>			
				<%-- </td>
			</tr>
		</table>
	</form>
</div> --%>
</c:choose>
<jsp:include page="footer.jsp"></jsp:include>