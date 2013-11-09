<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">

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

							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td align="left" valign="top" width="50%"
										style="padding-right: 25px;">
										<h2 class="quck-txt">Quick Info</h2>
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> First Name :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="fname" name="fname" /><br />
													<font color="Red" size="+1"> <span id="spnfname">
															<form:errors path="participant.fname"></form:errors>
													</span></font></td>

											</tr>

											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Last Name :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="lname"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="lname" /> </br> <font
													color="Red" size="+1"><span id="spnlname"></span> <form:errors
															path="participant.lname"></form:errors> </font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Mobile No :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="mno"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"
													value="${mobile_num}" name="mobile_num" /></br> <font
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
													name="age" class="input_cmbbx2">
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
														<option selected="selected" value="">--select--</option>
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
													class="err">*</span> Time1:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
														<option selected="selected" value="">--Select--</option>
														
														<option value="1-2" id="time">1-2</option>
														<option value="2-3" id="time">2-3</option>
														<option value="3-4" id="time">3-4</option>
														<option value="4-5" id="time">4-5</option>
														<option value="5-6" id="time">5-6</option>
														<option value="6-7" id="time">6-7</option>
														<option value="7-8" id="time">7-8</option>
														<option value="8-9" id="time">8-9</option>
														<option value="9-10" id="time">9-10</option>
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
														
															
												</select><br/>
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Time2:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time2" class="input_cmbbx1" id="msg">
														<option selected="selected" value="">--Select--</option>
														
														<option value="1-2" id="time">1-2</option>
														<option value="2-3" id="time">2-3</option>
														<option value="3-4" id="time">3-4</option>
														<option value="4-5" id="time">4-5</option>
														<option value="5-6" id="time">5-6</option>
														<option value="6-7" id="time">6-7</option>
														<option value="7-8" id="time">7-8</option>
														<option value="8-9" id="time">8-9</option>
														<option value="9-10" id="time">9-10</option>
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
														
															
												</select><br/>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Time3:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
														<option selected="selected" value="">--Select--</option>
														
														<option value="1-2" id="time">1-2</option>
														<option value="2-3" id="time">2-3</option>
														<option value="3-4" id="time">3-4</option>
														<option value="4-5" id="time">4-5</option>
														<option value="5-6" id="time">5-6</option>
														<option value="6-7" id="time">6-7</option>
														<option value="7-8" id="time">7-8</option>
														<option value="8-9" id="time">8-9</option>
														<option value="9-10" id="time">9-10</option>
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
														
															
												</select><br/>
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
											<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Select
													Group&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													:</td>
												<td valign="top" align="left" class="input_txt"><select
													name="group_name">
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
								<tr class="row1">
									<td valign="top" align="center">&nbsp;</td>
									<td valign="top" align="left"><input type="submit"
										name="insert" class="submit_btn2" value="Add Participant">
										<span id="spnsub"> </span></td>
								</tr>
							</table>
				<%-- </td>
			</tr>
		</table>
	</form>
</div> --%>

<jsp:include page="footer.jsp"></jsp:include>