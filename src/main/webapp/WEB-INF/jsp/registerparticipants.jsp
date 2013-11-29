<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "no-cache");
%>
<link rel="stylesheet" url="resources/js/jquery.js" />
<script src="/BePhitResearchApp/resources/js/jquery.js"></script>


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




<script type="text/javascript">
function doAjaxPost() {  
	  // get the form values  
	  var name = $('#Provider_name').val();
	 /*   var education = $('#education').val();	 */   
	  $.ajax({  
	    type: "POST",  
	    url: "/BePhitResearchApp/AddUser.htm",  
	    data: "Provider_name=" + name,  
	    success: function(response){  
	      // we have the response  
	      $('#info').html(response);
	      /*     $('#education').val(''); */
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	}  
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

<Script>
function empty()
{		var fld = document.getElementById('group_name');
		fld.innerHTML = "";
		
	}
</Script>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.2.min.js">
</head>
<body>

<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />"
	rel="stylesheet" type="text/css" />

<div class="logo">
				<a href="#"><img src="<c:url value="/resources/images/logo.png" />" alt="Company Logo" /></a>
			</div>
<div id="right_content">

	<form action="registerparticipants" method="POST" name="update" id="update">

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
							<h2>Register Participants</h2>
						</div>
						
						
						<div class="contentbox">
						<div id="time"></div>
<c:choose>
						<c:when test="${empty participants }">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td align="left" valign="top" width="50%" style="padding-right: 25px;">
										<h2 class="quck-txt">Quick Info</h2>
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name :</td>
												<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="fname" onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="fname" /><br />
													<font color="Red" size="+1"> <span id="spnfname">
															<form:errors path="participant.fname"></form:errors>
													</span></font></td>

											</tr>

											
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span><span
													class="err"></span> User Name :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="username"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="username" /> </br>
													 <c:if test="${user_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>User name already exists  <form:errors
															path="participant.username"></form:errors></c:if> </font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Mobile No :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="mno"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"
													value="${mobile_num}" name="mobile_num" /></br> 
												<c:if test="${mobile_exists ==true}">
													<font
													color="Red" size="+1"><span id="spnmno"></span>Mobile name already exists </font>
													</c:if>	
															
												<font
													color="Red" size="+1"><span id="spnmno"><form:errors
																path="participant.mobile_num"></form:errors> </span></font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Email-Id :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="eid"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="email_id" /></br>
												<c:if test="${email_exists ==true}">
													<font
													color="Red" size="+1"><span id="spnlname"></span>Email id already exists </font>
													</c:if>	
													<font color="Red" size="+1"><span id="spneid"><form:errors
																path="participant.email_id"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Gender :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="radio" name="gender" value="0" class="input_txt"
													checked="true">Male&nbsp;&nbsp;&nbsp;<input
													type="radio" name="gender" value="1" class="input_txt">Female&nbsp;&nbsp;&nbsp;</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> <%--  Age :<c:forEach begin="1" end="100" var="i">
                                 <option value="${i}" <c:if test ="${participantsDetails.age == i}">select</c:if>>${i}</option>
                                                       </c:forEach>   --%>
													Age:</td>
												<td valign="top" align="left" class="input_txt"><select
													name="age" class="input_cmbbx1">
														<option selected="selected" value="">Below 12</option>
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

											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> City :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="city"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="city" /></br> <font
													color="Red" size="+1"><span id="spncity"><form:errors
																path="participant.city"></form:errors> </span></font></td>
											</tr>
											<tr class="row2">
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
											<tr class="row1">
												<td valign="top" align="left" class="input_txt"><span
													class="err"></span> Medical
													Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													:</td>
												<td valign="top" align="left" class="input_txt"><textarea
														class="input_txtbx1" id="det"
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
																								
												<font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.time1"></form:errors> </span></font></td>
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
																							<font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.time2"></form:errors> </span></font></td>
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
												<font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.time3"></form:errors> </span></font></td>
											</tr>
											
											<tr>
												<td><p class="quck-txt">Provider</p></td>
											</tr>
<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Provider Name
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													:</td>
												<td valign="top" align="left" class="input_txt">
												<select onchange="doAjaxPost()" name="Provider_name" id="Provider_name"  class="input_cmbbx1"> <option value="null">--Select--</option>
														<c:forEach
															items="${adminuserform.adminuser}"
															var="adminuser" varStatus="status">
															<option value="${adminuser.admin_username}">${adminuser.admin_username}</option>
														</c:forEach>

												</select>
												 </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.Provider_name"></form:errors> </span></font></td>
											</tr>
											<tr>
												<td><p class="quck-txt">Group</p></td>
											</tr>											
											<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Select
													Group&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													:</td>
												<td valign="top" align="left" class="input_txt">
												<%-- <select
													name="group_name" multiple="multiple">
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select> --%>
							
												<div id="info" style="color: green;"><select id="group_name" multiple="multiple" class="input_cmbbx1"><option></option></select></div>
												
												
												 </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr class="row1" width="1000">
									<td valign="top" align="center">&nbsp;</td>
									<td valign="top" align="left"> 
										<span id="spnsub"> </span></td>
									 
								</tr>
							</table>
							</c:when>
							<c:otherwise>
							</br>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td align="left" valign="top" width="50%" style="padding-right: 25px;">
										<h2 class="quck-txt">Quick Info</h2>
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> First Name :</td>
													<input type="hidden" class="input_txtbx1" id="inp_id" value="${participants.participants_id }" name="participants_id" />
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="fname" name="fname" value="${participants.fname }"/><br />
													<font color="Red" size="+1"> <span id="spnfname">
															<form:errors path="participant.fname"></form:errors>
													</span></font></td>

											</tr>											
												<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span><span
													class="err"></span> User Name :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="lname"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="username"  value="${participants.username}"/> </br><font color="Red" size="+1"> <c:if test="${user_exists ==true}"><span id="spnlname"></span>User name already exists </c:if> <form:errors
															path="participant.username"></form:errors></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Mobile No :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="mno"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"
													name="mobile_num" value="${participants.mobile_num}" /></br> <font
													color="Red" size="+1"><span id="spnmno"><c:if test="${mobile_exists ==true}">Mobile number already exists</c:if><form:errors
																path="participant.mobile_num"></form:errors> </span></font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Email-Id :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="eid"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="email_id" value="${participants.email_id}" /></br>
													 <font color="Red" size="+1"><span id="spnlname"><c:if test="${email_exists ==true}">Email-id already exists</c:if></span><form:errors
															path="participant.email_id"></form:errors></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span class="err"></span> Gender :</td>
												<td valign="top" align="left" class="input_txt"><input type="radio" name="gender" value="0"  class="input_txt" <c:if test="${participants.gender=='0'}"><c:out value="checked=checked"/></c:if>>Male&nbsp;&nbsp;&nbsp;
                  <input type="radio" name="gender" value="1"  class="input_txt" <c:if test="${participants.gender=='1'}"><c:out value="checked=checked"/></c:if>> Female</td></tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> <%--  Age :<c:forEach begin="1" end="100" var="i">
                                 <option value="${i}" <c:if test ="${participantsDetails.age == i}">select</c:if>>${i}</option>
                                                       </c:forEach>   --%>
													Age:</td>
												<td valign="top" align="left" class="input_txt"><select
													name="age" class="input_cmbbx1">
														<option value="" <c:if test="${participants.age=='Below 12'}"><c:out value="selected"/></c:if>>Below 12</option>
                 <option value="12-20 years" <c:if test="${participants.age=='12-20 years'}"><c:out value="selected"/></c:if>>12-20 &#160 years</option>
                 <option value="20-30 years" <c:if test="${participants.age=='20-30 years'}"><c:out value="selected"/></c:if>>20-30 &#160 years</option>
                 <option value="30-40 years" <c:if test="${participants.age=='30-40 years'}"><c:out value="selected"/></c:if>>30-40 &#160 years</</option>                  
                 <option value="40-50 years" <c:if test="${participants.age=='40-50 years'}"><c:out value="selected"/></c:if>>40-50 &#160 years</option>
                 <option value="50-60 years"  <c:if test="${participants.age=='50-60 years'}"><c:out value="selected"/></c:if>>50-60 &#160 years</option>
                 <option value="60-70 years" <c:if test="${participants.age=='60-70 years'}"><c:out value="selected"/></c:if>>60-70 &#160 years</option>
                 <option value="70-80 years" <c:if test="${participants.age=='70-80 years'}"><c:out value="selected"/></c:if>>70-80 &#160 years</option>
                 <option value="80-90 years" <c:if test="${participants.age=='80-90 years'}"><c:out value="selected"/></c:if>>80-90 &#160 years</option>
                   <option value="90-100 years" <c:if test="${participants.age=='90-100 years'}"><c:out value="selected"/></c:if>>90-100 years</option>
                 
														
														<span id="spnage"><form:errors
																path="participant.age"></form:errors> </span>
														</font></td>
											</tr>

											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> City :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="city"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="city" value="${participants.city}" /></br> <font
													color="Red" size="+1"><span id="spncity"><form:errors
																path="participant.city"></form:errors> </span></font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Education :</td>
												<td valign="top" align="left" class="input_txt"><select
													name="education" class="input_cmbbx1">
														<option selected="selected" value="">--Select--</option>
														 <option value="School" <c:if test="${participants.education=='School'}"><c:out value="selected"/></c:if>>School</option>
			<option value="Some College" <c:if test="${participants.education=='Some College'}"><c:out value="selected"/></c:if> >Some College</option>
			<option value="Professional Degree" <c:if test="${participants.education=='Professional Degree'}"><c:out value="selected"/></c:if>>Professional Degree</option>
			<option value="Master Degree" <c:if test="${participants.education=='Master Degree'}"><c:out value="selected"/></c:if>>Master Degree</option>
												</select> <br /> <font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.education"></form:errors> </span></font></td>

											</tr>
											<tr class="row1">
												<td valign="top" align="left" class="input_txt"><span
													class="err"></span> Medical
													Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													:</td>
												<td valign="top" align="left" class="input_txt"><textarea
														class="input_txtbx1" id="det"
														onmouseover="showTooltip('tooltip_id','inp_id3');"
														onmouseout="hideTooltip('tooltip_id');"
														style="width: 177px; height: 89px;" name="medical_details" />${participants.medical_details }</textarea>
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
												<option value="null" selected>--Select--</option> 
					  <option value="00-01" <c:if test="${participants.time1=='00-01'}"><c:out value="selected"/></c:if>>00-01</option>
                   <option value="01-02"  <c:if test="${participants.time1=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${participants.time1=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${participants.time1=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${participants.time1=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${participants.time1=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${participants.time1=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${participants.time1=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${participants.time1=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${participants.time1=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
					<option value="10-11"  <c:if test="${participants.time1=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${participants.time1=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${participants.time1=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${participants.time1=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${participants.time1=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${participants.time1=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${participants.time1=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${participants.time1=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${participants.time1=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${participants.time1=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${participants.time1=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${participants.time1=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${participants.time1=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${participants.time1=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   
															
												</select><span>     Hours</span><br/>
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time2:</td>
												<td valign="top" align="left" class="input_txt" >
												<select name="time2" class="input_cmbbx1" id="msg"">
												<option value="null" selected>--Select--</option> 
                   <option value="00-01" <c:if test="${participants.time2=='00-01'}"><c:out value="selected"/></c:if>>00-01</option>
                   <option value="01-02"  <c:if test="${participants.time2=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${participants.time2=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${participants.time2=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${participants.time2=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${participants.time2=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${participants.time2=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${participants.time2=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${participants.time2=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${participants.time2=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
					<option value="10-11"  <c:if test="${participants.time2=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${participants.time2=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${participants.time2=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${participants.time2=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${participants.time2=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${participants.time2=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${participants.time2=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${participants.time2=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${participants.time2=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${participants.time2=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${participants.time2=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${participants.time2=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${participants.time2=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${participants.time2=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   										
												</select><span>     Hours</span><br/>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time3:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
												<option value="null" selected>--Select--</option> 
														<option value="00-01" <c:if test="${participants.time3=='00-01'}"><c:out value="selected"/></c:if>>00-01</option>
                   <option value="01-02"  <c:if test="${participants.time3=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${participants.time3=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${participants.time3=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${participants.time3=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${participants.time3=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${participants.time3=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${participants.time3=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${participants.time3=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${participants.time3=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
					<option value="10-11"  <c:if test="${participants.time3=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${participants.time3=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${participants.time3=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${participants.time3=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${participants.time3=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${participants.time3=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${participants.time3=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${participants.time3=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${participants.time3=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${participants.time3=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${participants.time3=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${participants.time3=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${participants.time3=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${participants.time3=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   	
                   
															
												</select><span>     Hours</span><br/>
												</td>
											</tr>
											
											<tr>
												<td><p class="quck-txt">Provider</p></td>
											</tr>
<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Provider Name
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													:</td>
												<td valign="top" align="left" class="input_txt">
												<select onchange="doAjaxPost()" id="Provider_name"	name="Provider_name" class="input_cmbbx1">
													<option value="null">--Select--</option>
														<c:forEach items="${adminuserform.adminuser}"
															var="adminuser" varStatus="status">
															
															<option value="${adminuser.admin_username}" <c:if test="${provider==adminuser.admin_username}"><c:out value="selected"/></c:if>>${adminuser.admin_username}</option>
														</c:forEach>

												</select>
												</br> <font color="Red" size="+1"><span id="spngrp">
												<c:if test="${provider=='null'}">												
												<form:errors path="participant.group_name"></form:errors>			
												</c:if> </span></font>
												 </td>
											</tr>
											<tr>
												<td><p class="quck-txt">Group</p></td>
											</tr>											
											<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Select
													Group&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													:</td>
												<td valign="top" align="left" class="input_txt">
												<%-- <select
													name="group_name" multiple>
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select> --%>
												
												<div id="info" style="color: green;"><select class="input_cmbbx1" multiple="multiple" name="group_name" id="group_name" value="${groups}">
												
												<c:forEach items="${groups}"
															var="group" varStatus="status">
															<option value="${group}">${group}</option>
														</c:forEach>
												
												
												</select></div>
												
												 </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font></td>
											</tr>
										</table>
									</td>
								</tr>			
					
							
									
							
					
							
							</c:otherwise>
						</c:choose>
						
						
						
							<table align="right"><tr><td valign="middle"  style="padding-left:500px;"><input type="submit" class="submit_btn" value="Register" onclick="return validate('this')"></td>
							<td valign="middle" style="padding-left:10px;"><input type="reset" value="Reset" onclick="empty()" class="submit_btn"></td>
							<td valign="middle" style="padding-left:10px;" ><a href="login" class="submit_btn" style="color:white" text-decoration: none;>Cancel</a></td></tr></table>
					</table>
			

<jsp:include page="footer.jsp"></jsp:include>