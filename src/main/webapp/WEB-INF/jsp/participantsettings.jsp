<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:include page="participantheader.jsp"></jsp:include>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />"
	rel="stylesheet" type="text/css" />
 
<div id="right_content">

	<form action="updateparticipantmessage" method="POST" name="update" id="update">

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
							<h2>Settings</h2>
						</div>
						<div class="contentbox">

							<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
								<tr>
									<td align="center" valign="top" width="50%"
										style="padding-right: 25px;">
										
										<table align="center" cellpadding="0" cellspacing="0" border="0" width="1000">
											<tr class="row1">
												<td class="input_text"><span class="err">*</span> Receive Message :</td>
												<td><input type="radio" name="message" value="1" checked="true"/> Start Message</td>
												<td><input type="radio" name="message" value="0">Stop Message<font color="Red" size="+1"> <span id="spnfname">
											  
								</span></font></td>

											</tr>
											<tr><td height="100"></td><tr>

											 
											 
											 
											 
											 
										</table>
									</td>
																		</td>
								</tr>
								 
							</table>
							
							<table align="right"><tr><td><input type="submit" class="submit_btn" value="Submit" name="insert"></td></form>
							<td width="50"></td><td><input type="reset" value="Reset" class="submit_btn"></td><td width="50">
							<td><a href="login" class="submit_btn" style="color:white">Cancel</a></td></tr></table>
				<%-- </td>
			</tr>
		</table>
	</form>
</div> --%>

<jsp:include page="footer.jsp"></jsp:include>