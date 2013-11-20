<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

<form name="grid" onSubmit="return validate(this)" action=""
	method="POST">

	<div id="right_content">
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">

			<tr>
				<c:if test="${success==true}">
					<tr>
						<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
							<div id="success_statusbar" class="status success">
								<p class="closestatus">
									<a title="Close" href="viewreports">x</a>
								</p>
								<p>
									<img alt="Success"
										src="resources/images/icons/icon_success.png"><span>Success!</span>.
								</p>
							</div>
					</tr>
				</c:if>
				
			
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Broadcast Reports</h2>
						</div>
						<div class="contentbox">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
								<tr class="title">
									<td valign="center" align="left" width="5%"><input
										type="checkbox" value="" name="chkAll"></td>
									<td valign="top" align="left" width="10%">Broadcast&nbsp;Id</td>
									<td valign="top" align="left" width="15%">Stream&nbsp;Name</td>
									<td valign="top" align="left" width="15%">Send&nbsp;to&nbsp;Group</td>
									<td valign="top" align="left" width="15%">Frequency</td>
									<td valign="top" align="left" width="10%">Start&nbsp;Date</td>
									<td valign="top" align="left" width="10%">Status</td>
									<td valign="top" align="left" width="20%">No.&nbsp;of&nbsp;Msg&nbsp;Delivered</td>
								   <td valign="top" align="left" width="10%">Enable/Disable</td>
								   
								</tr>


							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="100%"
								id="user_ajax">
								<c:forEach items="${broadCastReportsForm.broadCastReports}"
									var="broadCastReports" varStatus="status">
									<tr class="row1">
										<td valign="center" align="left" width="5%">
										<input type="checkbox" value="" name="chkUser"></td>
										<td valign="top" align="left" width="10%">${broadCastReports.broad_id}</td>
										<td valign="top" align="left" width="12%">${broadCastReports.stream_name}</td>
										<td valign="top" align="center" width="14%">${broadCastReports.group_name}</td>
										<td valign="top" align="left" width="10%">${broadCastReports.frequency}</td>
										<td valign="top" align="left" width="10%">${broadCastReports.start_date}</td>
										<td valign="top" align="left" width="10%">${broadCastReports.status}</td>

										<td valign="top" align="center" width="15%">${broadCastReports.message_count}</td>
										
										<td valign="top" align="center" width="10%">
										<c:choose>
									     	<c:when test="${broadCastReports.enable==0}">
									     	<a href="viewreports" title=""><img src="resources/images/icons/icon_approve.png" alt="Enable" /></a><a href="#"  style="padding-right:20px;" onclick="myActive(${broadCastReports.broad_id},1)">Enable</a>
										 	</c:when>
										 	<c:when test="${broadCastReports.enable==1}">
										 	<a href="viewreports" title=""><img src="resources/images/icons/icon_unapprove.png" alt="Disable" /></a><a href="#" style="padding-right:10px;" onclick="myActive(${broadCastReports.broad_id},0)">Disable</a>
										 	</c:when>										 	
										 	</c:choose>
										
										
										</td>
										
										
										
										
										
									</tr>
								</c:forEach>
							</table>
							</form>
							<script>
								function myFunction(str) {
									var answer = confirm("Are you sure want to delete this User?")
									if (answer) {
										window.location = "?do=deleteuser&userid="
												+ str;
									} else {
									}
								}
							</script>
							<script type="text/javascript">
								function streamdelete(str) {

									var answer = confirm("Are you sure want to delete this Stream?")
									if (answer) {
										window.location = "?do=deletestream&streamid="
												+ str;
									} else {
										// 		alert("Thanks for sticking around!")
									}
								}
								
								
								function myActive(broad_id,ena) {

									
									if(ena==1)
									{
										var answer = confirm("Are you sure want to enable this broadcast?");
									}
									else
									{
										var answer = confirm("Are you sure want to Disable this broadcast?");
									}
									if (answer){
//								 		
										window.location = "enable_messaging?id="+broad_id+"&enable="+ena;
									}
									else{
//								 		//alert("Thanks for sticking around!")
									}
								}
								
								
								
								
								
								
								
								
								
								
								
								
							</script>
							<script type="text/javascript">
								$(function() {
									$('input[name="chkUser"]')
											.click(
													function() {
														if ($('input[name="chkUser"]').length == $('input[name="chkUser"]:checked').length) {
															$(
																	'input:checkbox[name="chkAll"]')
																	.attr(
																			"checked",
																			"checked");
														} else {
															$(
																	'input:checkbox[name="chkAll"]')
																	.removeAttr(
																			"checked");
														}
													});
									$('input:checkbox[name="chkAll"]').click(
											function() {
												var slvals = []
												if ($(this).is(':checked')) {
													$('input[name="chkUser"]')
															.attr("checked",
																	true);
												} else {
													$('input[name="chkUser"]')
															.attr("checked",
																	false);
													slvals = null;
												}
											});
								})
							</script>
							<script language="javascript">
								function selectall(field) {
									//field.getElementByTagName('checkbox');
									if (document.grid.checkall.checked == true) {
										for (i = 0; i < field.length; i++)
											field[i].checked = true;
									} else {
										for (i = 0; i < field.length; i++)
											field[i].checked = false;
									}
								}

								function validate(fname) {
									// alert(fname);
									var chks = document
											.getElementsByName('checkbox[]');

									var hasChecked = false;
									for ( var i = 0; i < chks.length; i++) {
										if (chks[i].checked) {
											hasChecked = true;
											break;
										}
									}
									if (hasChecked == false) {
										alert("Please select at least one.");
										return false;
									}
									return true;
								}
							</script>