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
							<h2>Add Participants</h2>
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
													class="err">*</span> Last Name :</td>
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
													class="err">*</span> Gender :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="radio" name="gender" value="0" class="input_txt"
													checked="true">Male&nbsp;&nbsp;&nbsp;<input
													type="radio" name="gender" value="1" class="input_txt">Female&nbsp;&nbsp;&nbsp;<input
													type="radio" name="gender" value="2" class="input_txt">Transgender</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> <%--  Age :<c:forEach begin="1" end="100" var="i">
                                 <option value="${i}" <c:if test ="${participantsDetails.age == i}">select</c:if>>${i}</option>
                                                       </c:forEach>   --%>
													Age:</td>
												<td valign="top" align="left" class="input_txt"><select
													name="age" class="input_cmbbx2">
														<option selected="selected" value="">Below 12</option>
														<option value="12-20 years" id="age">12-20 years</option>
														<option value="20-30 years" id="age">20-30 years</option>
														<option value="30-40 years" id="age">30-40 years</option>
														<option value="40-50 years" id="age">40-50 years</option>
														<option value="50-60 years" id="age">50-60 years</option>
														<option value="60-70 years" id="age">60-70 years</option>
														<option value="70-80 years" id="age">70-80 years</option>
														<option value="80-90 years" id="age">80-90 years</option>
														<option value="90-100 years" id="age">90-100
															years</option>
														<option value="100-110 years" id="age">100-110
															years</option>
														<option value="110-120 years" id="age">110-120
															years</option>
														<option value="120-130 years" id="age">120-130
															years</option>
														<option value="130-140 years" id="age">130-140
															years</option>
														<option value="140-150 years" id="age">140-150
															years</option>

														<!-- <td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="age"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="age" /></br> <font
													color="Red" size="+1"> -->
														<span id="spnage"><form:errors
																path="participant.age"></form:errors> </span>
														</font></td>
											</tr>

											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> City :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="city"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="city" /></br> <font
													color="Red" size="+1"><span id="spncity"><form:errors
																path="participant.city"></form:errors> </span></font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Education :</td>
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
													class="err">*</span> Note :</td>
												<td valign="top" align="left" class="input_txt"><textarea
														class="input_txtbx1" id="note"
														onmouseover="showTooltip('tooltip_id','inp_id3');"
														onmouseout="hideTooltip('tooltip_id');"
														style="width: 177px; height: 89px;" name="note" /></textarea> <br />
													<font color="Red" size="+1"><span id="spnnote"><form:errors
																path="participant.note"></form:errors> </span></font></td>
											</tr>

										</table>
									</td>
									<td align="left" valign="top">
										<h2 class="quck-txt">More Info</h2>
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Medical
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


											<tr>
												<td><p class="quck-txt">Texting&nbsp;Preference</p></td>
											</tr>



											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Messaging Frequency:</td>
												<td valign="top" align="left" class="input_txt"><select
													name="messaging_frequency" class="input_cmbbx1" id="msg">
														<option selected="selected" value="">--Select--</option>
														<option value="Daily Twice" id="msg">Daily Twice</option>
														<option value="Once a Day" id="msg">Once a Day</option>
														<option value="Once in a week" id="msg">Once in a
															week</option>
														<option value="No Preference" id="msg">No
															Preference</option>
												</select></td>
												</br>
												<font color="Red" size="+1"><span id="spnmsg"><form:errors
															path="participant.messaging_frequency"></form:errors> </span>
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

												</select> </br> <font color="Red" size="+1"><span id="spnmsg"><form:errors
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