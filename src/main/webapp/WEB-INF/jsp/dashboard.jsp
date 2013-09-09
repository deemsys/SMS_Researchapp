<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
	<form action="?do=viewparticipants" name="dashboard" method="POST">
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">

			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Participants Stat</h2>
						</div>
						<div class="contentbox">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="10%">First&nbsp;Name</td>
									<td valign="top" align="left" width="15%">Mobile Number</td>
									<td valign="top" align="left" width="10%">City</td>
									<td valign="top" align="left" width="10%">Age</td>

									<td valign="top" align="left" width="15%">Associated&nbsp;Streams</td>
									<td valign="top" align="left" width="15%">Education</td>
									<td valign="top" align="left" width="15%">Date Of Join</td>


								</tr>

								<!-- Display Admin Userd here  Suresh--> 
									<c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
							       		<tr class="row1" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left"  width="10%">${participantsDetails.fname}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.mobile_num}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.city}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.age}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.age}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.education}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.date_of_join}</td>
										</tr>
							    	</c:forEach>
						    	

								<tr><td colspan="7">  <div class="extrabottom">
              						<ul class="pagination">
                						<li class="text"><input type="submit" name="view" value="View All" class="submit_btn"></li>
                						<li class="text"></li>
                					</ul></div></td></tr>

								</table>

								<div style="clear: both;"></div>
								</div>
								</div>
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
								
							</table>
							</form>
						</div>
<jsp:include page="footer.jsp"></jsp:include>