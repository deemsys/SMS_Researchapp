<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:include page="participantheader.jsp"></jsp:include>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />"
	rel="stylesheet" type="text/css" />

<div id="right_content">

	<form action="updateregisterparticipant" method="POST" name="update" id="update">

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
 <c:set value="${participantsDetailsForm.participantsDetails[0]}" var="participantsDetails"/>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td align="left" valign="top" width="50%"
										style="padding-right: 25px;">
										<h2 class="quck-txt">Quick Info</h2>
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> First Name :</td>
													<input type="hidden" class="input_txtbx1" id="inp_id" value="${participantsDetails.participants_id }" name="participants_id" />
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="fname" name="fname" value="${participantsDetails.fname }"/><br />
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
													onmouseout="hideTooltip('tooltip_id');" name="username"  value="${participantsDetails.username}"/> </br> <c:if test="${user_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>User name already exists  <form:errors
															path="participant.username"></form:errors></c:if></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Mobile No :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="mno"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"
													name="mobile_num" value="${participantsDetails.mobile_num}" /></br> <font
													color="Red" size="+1"><span id="spnmno"><form:errors
																path="participant.mobile_num"></form:errors> </span></font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Email-Id :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="eid"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="email_id" value="${participantsDetails.email_id}" /></br>
													<c:if test="${user_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>Email-id already exists  <form:errors
															path="participant.email_id"></form:errors></c:if></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span class="err"></span> Gender :</td>
												<td valign="top" align="left" class="input_txt"><input type="radio" name="gender" value="0"  class="input_txt" <c:if test="${participantsDetails.gender=='0'}"><c:out value="checked=checked"/></c:if>>Male&nbsp;&nbsp;&nbsp;  <c:out value="${participantDetails.gender}"/>
                  <input type="radio" name="gender" value="1"  class="input_txt" <c:if test="${participantsDetails.gender=='1'}"><c:out value="checked=checked"/></c:if>> Female</td></tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> <%--  Age :<c:forEach begin="1" end="100" var="i">
                                 <option value="${i}" <c:if test ="${participantsDetails.age == i}">select</c:if>>${i}</option>
                                                       </c:forEach>   --%>
													Age:</td>
												<td valign="top" align="left" class="input_txt"><select
													name="age" class="input_cmbbx2">
														<option value="" <c:if test="${participantsDetails.age=='Below 12'}"><c:out value="selected"/></c:if>>Below 12</option>
                 <option value="12-20 years" <c:if test="${participantsDetails.age=='12-20 years'}"><c:out value="selected"/></c:if>>12-20 &#160 years</option>
                 <option value="20-30 years" <c:if test="${participantsDetails.age=='20-30 years'}"><c:out value="selected"/></c:if>>20-30 &#160 years</option>
                 <option value="30-40 years" <c:if test="${participantsDetails.age=='30-40 years'}"><c:out value="selected"/></c:if>>30-40 &#160 years</</option>                  
                 <option value="40-50 years" <c:if test="${participantsDetails.age=='40-50 years'}"><c:out value="selected"/></c:if>>40-50 &#160 years</option>
                 <option value="50-60 years"  <c:if test="${participantsDetails.age=='50-60 years'}"><c:out value="selected"/></c:if>>50-60 &#160 years</option>
                 <option value="60-70 years" <c:if test="${participantsDetails.age=='60-70 years'}"><c:out value="selected"/></c:if>>60-70 &#160 years</option>
                 <option value="70-80 years" <c:if test="${participantsDetails.age=='70-80 years'}"><c:out value="selected"/></c:if>>70-80 &#160 years</option>
                 <option value="80-90 years" <c:if test="${participantsDetails.age=='80-90 years'}"><c:out value="selected"/></c:if>>80-90 &#160 years</option>
                   <option value="90-100 years" <c:if test="${participantsDetails.age=='90-100 years'}"><c:out value="selected"/></c:if>>90-100 years</option>
                 
														
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
													onmouseout="hideTooltip('tooltip_id');" name="city" value="${participantsDetails.city}" /></br> <font
													color="Red" size="+1"><span id="spncity"><form:errors
																path="participant.city"></form:errors> </span></font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Education :</td>
												<td valign="top" align="left" class="input_txt"><select
													name="education" class="input_cmbbx1">
														<option selected="selected" value="">--select--</option>
														 <option value="School" <c:if test="${participantsDetails.education=='School'}"><c:out value="selected"/></c:if>>School</option>
			<option value="Some College" <c:if test="${participantsDetails.education=='Some College'}"><c:out value="selected"/></c:if> >Some College</option>
			<option value="Professional Degree" <c:if test="${participantsDetails.education=='Professional Degree'}"><c:out value="selected"/></c:if>>Professional Degree</option>
			<option value="Master Degree" <c:if test="${participantsDetails.education=='Master Degree'}"><c:out value="selected"/></c:if>>Master Degree</option>
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
														style="width: 177px; height: 89px;" name="medical_details" />${participantsDetails.medical_details }</textarea>
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
													class="err">*</span> Time1:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
														<option value="00-1" id="time">00-1</option> <c:if test="${participantsDetails.time1=='00-1'}"><c:out value="selected"/></c:if>00-1</option>
                   <option value="1-2" id="time">1-2</option> <c:if test="${participantsDetails.time1=='1-2'}"><c:out value="selected"/></c:if>1-2</option>
				   <option value="2-3" id="time">2-3</option> <c:if test="${participantsDetails.time1=='2-3'}"><c:out value="selected"/></c:if>2-3</option>
				   <option value="3-4" id="time">3-4</option> <c:if test="${participantsDetails.time1=='3-4'}"><c:out value="selected"/></c:if>3-4</option>
				   <option value="4-5" id="time">4-5</option><c:if test="${participantsDetails.time1=='4-5'}"><c:out value="selected"/></c:if>4-5</option>
				   <option value="5-6" id="time">5-6</option><c:if test="${participantsDetails.time1=='5-6'}"><c:out value="selected"/></c:if>5-6</option>
				   <option value="6-7" id="time">6-7</option><c:if test="${participantsDetails.time1=='6-7'}"><c:out value="selected"/></c:if>6-7</option>
				   <option value="7-8" id="time">7-8</option> <c:if test="${participantsDetails.time1=='7-8'}"><c:out value="selected"/></c:if>7-8</option>
					<option value="8-9" id="time">8-9</option><c:if test="${participantsDetails.time1=='8-9'}"><c:out value="selected"/></c:if>8-9</option>
					<option value="9-10" id="time">9-10</option> <c:if test="${participantsDetails.time1=='9-10'}"><c:out value="selected"/></c:if>9-10</option>
					<option value="10-11" id="time">10-11</option> <c:if test="${participantsDetails.time1=='10-11'}"><c:out value="selected"/></c:if>10-11</option>
					<option value="11-12" id="time">11-12</option> <c:if test="${participantsDetails.time1=='11-12'}"><c:out value="selected"/></c:if>11-12</option>
					<option value="12-13" id="time">12-13</option> <c:if test="${participantsDetails.time1=='12-13'}"><c:out value="selected"/></c:if>12-13</option>
					<option value="13-14" id="time">13-14</option> <c:if test="${participantsDetails.time1=='13-14'}"><c:out value="selected"/></c:if>13-14</option>
				    <option value="14-15" id="time">14-15</option> <c:if test="${participantsDetails.time1=='14-15'}"><c:out value="selected"/></c:if>14-15</option>
				  <option value="15-16" id="time">15-16</option> <c:if test="${participantsDetails.time1=='15-16'}"><c:out value="selected"/></c:if>15-16</option>
				<option value="16-17" id="time">16-17</option> <c:if test="${participantsDetails.time1=='16-17'}"><c:out value="selected"/></c:if>16-17</option>
				<option value="17-18" id="time">17-18</option> <c:if test="${participantsDetails.time1=='17-18'}"><c:out value="selected"/></c:if>17-18</option>
			    <option value="18-19" id="time">18-19</option> <c:if test="${participantsDetails.time1=='18-19'}"><c:out value="selected"/></c:if>18-19</option>
				<option value="19-20" id="time">19-20</option> <c:if test="${participantsDetails.time1=='19-20'}"><c:out value="selected"/></c:if>19-20</option>
				<option value="20-21" id="time">20-21</option> <c:if test="${participantsDetails.time1=='20-21'}"><c:out value="selected"/></c:if>20-21</option>
				<option value="21-22" id="time">21-22</option> <c:if test="${participantsDetails.time1=='21-22'}"><c:out value="selected"/></c:if>21-22</option>
				<option value="22-23" id="time">22-23</option><c:if test="${participantsDetails.time1=='22-23'}"><c:out value="selected"/></c:if>22-23</option>
				<option value="23-00" id="time">23-00</option><c:if test="${participantsDetails.time1=='23-00'}"><c:out value="selected"/></c:if>23-00</option>
                   
															
												</select><br/>
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Time2:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time2" class="input_cmbbx1" id="msg">
														<option value="00-1" id="time">00-1</option> <c:if test="${participantsDetails.time1=='00-1'}"><c:out value="selected"/></c:if>00-1</option>
                   <option value="1-2" id="time">1-2</option> <c:if test="${participantsDetails.time1=='1-2'}"><c:out value="selected"/></c:if>1-2</option>
				   <option value="2-3" id="time">2-3</option> <c:if test="${participantsDetails.time1=='2-3'}"><c:out value="selected"/></c:if>2-3</option>
				   <option value="3-4" id="time">3-4</option> <c:if test="${participantsDetails.time1=='3-4'}"><c:out value="selected"/></c:if>3-4</option>
				   <option value="4-5" id="time">4-5</option><c:if test="${participantsDetails.time1=='4-5'}"><c:out value="selected"/></c:if>4-5</option>
				   <option value="5-6" id="time">5-6</option><c:if test="${participantsDetails.time1=='5-6'}"><c:out value="selected"/></c:if>5-6</option>
				   <option value="6-7" id="time">6-7</option><c:if test="${participantsDetails.time1=='6-7'}"><c:out value="selected"/></c:if>6-7</option>
				   <option value="7-8" id="time">7-8</option> <c:if test="${participantsDetails.time1=='7-8'}"><c:out value="selected"/></c:if>7-8</option>
					<option value="8-9" id="time">8-9</option><c:if test="${participantsDetails.time1=='8-9'}"><c:out value="selected"/></c:if>8-9</option>
					<option value="9-10" id="time">9-10</option> <c:if test="${participantsDetails.time1=='9-10'}"><c:out value="selected"/></c:if>9-10</option>
					<option value="10-11" id="time">10-11</option> <c:if test="${participantsDetails.time1=='10-11'}"><c:out value="selected"/></c:if>10-11</option>
					<option value="11-12" id="time">11-12</option> <c:if test="${participantsDetails.time1=='11-12'}"><c:out value="selected"/></c:if>11-12</option>
					<option value="12-13" id="time">12-13</option> <c:if test="${participantsDetails.time1=='12-13'}"><c:out value="selected"/></c:if>12-13</option>
					<option value="13-14" id="time">13-14</option> <c:if test="${participantsDetails.time1=='13-14'}"><c:out value="selected"/></c:if>13-14</option>
				    <option value="14-15" id="time">14-15</option> <c:if test="${participantsDetails.time1=='14-15'}"><c:out value="selected"/></c:if>14-15</option>
				  <option value="15-16" id="time">15-16</option> <c:if test="${participantsDetails.time1=='15-16'}"><c:out value="selected"/></c:if>15-16</option>
				<option value="16-17" id="time">16-17</option> <c:if test="${participantsDetails.time1=='16-17'}"><c:out value="selected"/></c:if>16-17</option>
				<option value="17-18" id="time">17-18</option> <c:if test="${participantsDetails.time1=='17-18'}"><c:out value="selected"/></c:if>17-18</option>
			    <option value="18-19" id="time">18-19</option> <c:if test="${participantsDetails.time1=='18-19'}"><c:out value="selected"/></c:if>18-19</option>
				<option value="19-20" id="time">19-20</option> <c:if test="${participantsDetails.time1=='19-20'}"><c:out value="selected"/></c:if>19-20</option>
				<option value="20-21" id="time">20-21</option> <c:if test="${participantsDetails.time1=='20-21'}"><c:out value="selected"/></c:if>20-21</option>
				<option value="21-22" id="time">21-22</option> <c:if test="${participantsDetails.time1=='21-22'}"><c:out value="selected"/></c:if>21-22</option>
				<option value="22-23" id="time">22-23</option><c:if test="${participantsDetails.time1=='22-23'}"><c:out value="selected"/></c:if>22-23</option>
				<option value="23-00" id="time">23-00</option><c:if test="${participantsDetails.time1=='23-00'}"><c:out value="selected"/></c:if>23-00</option>
                   
															
												</select><br/>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Time3:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
														<option value="00-1" id="time">00-1</option> <c:if test="${participantsDetails.time1=='00-1'}"><c:out value="selected"/></c:if>00-1</option>
                   <option value="1-2" id="time">1-2</option> <c:if test="${participantsDetails.time1=='1-2'}"><c:out value="selected"/></c:if>1-2</option>
				   <option value="2-3" id="time">2-3</option> <c:if test="${participantsDetails.time1=='2-3'}"><c:out value="selected"/></c:if>2-3</option>
				   <option value="3-4" id="time">3-4</option> <c:if test="${participantsDetails.time1=='3-4'}"><c:out value="selected"/></c:if>3-4</option>
				   <option value="4-5" id="time">4-5</option><c:if test="${participantsDetails.time1=='4-5'}"><c:out value="selected"/></c:if>4-5</option>
				   <option value="5-6" id="time">5-6</option><c:if test="${participantsDetails.time1=='5-6'}"><c:out value="selected"/></c:if>5-6</option>
				   <option value="6-7" id="time">6-7</option><c:if test="${participantsDetails.time1=='6-7'}"><c:out value="selected"/></c:if>6-7</option>
				   <option value="7-8" id="time">7-8</option> <c:if test="${participantsDetails.time1=='7-8'}"><c:out value="selected"/></c:if>7-8</option>
					<option value="8-9" id="time">8-9</option><c:if test="${participantsDetails.time1=='8-9'}"><c:out value="selected"/></c:if>8-9</option>
					<option value="9-10" id="time">9-10</option> <c:if test="${participantsDetails.time1=='9-10'}"><c:out value="selected"/></c:if>9-10</option>
					<option value="10-11" id="time">10-11</option> <c:if test="${participantsDetails.time1=='10-11'}"><c:out value="selected"/></c:if>10-11</option>
					<option value="11-12" id="time">11-12</option> <c:if test="${participantsDetails.time1=='11-12'}"><c:out value="selected"/></c:if>11-12</option>
					<option value="12-13" id="time">12-13</option> <c:if test="${participantsDetails.time1=='12-13'}"><c:out value="selected"/></c:if>12-13</option>
					<option value="13-14" id="time">13-14</option> <c:if test="${participantsDetails.time1=='13-14'}"><c:out value="selected"/></c:if>13-14</option>
				    <option value="14-15" id="time">14-15</option> <c:if test="${participantsDetails.time1=='14-15'}"><c:out value="selected"/></c:if>14-15</option>
				  <option value="15-16" id="time">15-16</option> <c:if test="${participantsDetails.time1=='15-16'}"><c:out value="selected"/></c:if>15-16</option>
				<option value="16-17" id="time">16-17</option> <c:if test="${participantsDetails.time1=='16-17'}"><c:out value="selected"/></c:if>16-17</option>
				<option value="17-18" id="time">17-18</option> <c:if test="${participantsDetails.time1=='17-18'}"><c:out value="selected"/></c:if>17-18</option>
			    <option value="18-19" id="time">18-19</option> <c:if test="${participantsDetails.time1=='18-19'}"><c:out value="selected"/></c:if>18-19</option>
				<option value="19-20" id="time">19-20</option> <c:if test="${participantsDetails.time1=='19-20'}"><c:out value="selected"/></c:if>19-20</option>
				<option value="20-21" id="time">20-21</option> <c:if test="${participantsDetails.time1=='20-21'}"><c:out value="selected"/></c:if>20-21</option>
				<option value="21-22" id="time">21-22</option> <c:if test="${participantsDetails.time1=='21-22'}"><c:out value="selected"/></c:if>21-22</option>
				<option value="22-23" id="time">22-23</option><c:if test="${participantsDetails.time1=='22-23'}"><c:out value="selected"/></c:if>22-23</option>
				<option value="23-00" id="time">23-00</option><c:if test="${participantsDetails.time1=='23-00'}"><c:out value="selected"/></c:if>23-00</option>
                   
															
												</select><br/>
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
												<select
													name="Provider_name">
														<c:forEach
															items="${adminuserform.adminuser}"
															var="adminuser" varStatus="status">
															<option value="${adminuser.admin_username}"<c:if test="${participantDetails.Provider_name==adminuser.admin_username}"><c:out value="selected"/></c:if>>${adminuser.admin_username}</option>
														</c:forEach>

												</select>
												 </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font></td>
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
												<select
													name="group_name" multiple>
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select> </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
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
								 <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn2" value="Update Participant" onclick="update.submit()"></td>
                </tr>
							</table>
							
				<%-- </td>
			</tr>
		</table>
	</form>
</div> --%>

<jsp:include page="footer.jsp"></jsp:include>