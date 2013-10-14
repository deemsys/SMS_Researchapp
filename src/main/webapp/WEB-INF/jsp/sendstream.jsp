<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/jquery-1.3.2.js"></script>

<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<script src="resources/js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>

<script>
	/*   $(function() {
	 $( "#datepicker" ).datepicker();
	 }); */
	$(function() {
		$("#dateofjointo").datepicker();
	});
</script>



<script type="text/javascript" src="js/ui.datepicker.js"></script>
<link type="text/css" href="css/demos.css" rel="stylesheet" />
<link type="text/css" href="css/ui.all.css" rel="stylesheet" />
<!-- <script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker();
	});
	</script> -->
<div id="right_content">
	<form action="insertsendstream" method="POST">

		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">
					<!-- <div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span></p>
          </div> -->

				</td>
			</tr>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Send Stream</h2>
						</div>
						<div class="contentbox">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="row1">
									<td valign="middle" align="right" class="input_txt" width="200">Broadcast
										Id :</td>
									<td valign="top" align="left" class="input_txt">${currentbroad}</td>
									<input type="hidden" name="broad_id" value="${currentbroad}">
								</tr>
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt">Stream
										Name :</td>
									<td valign="top" align="left" class="input_txt"><select
										name="stream_id">
											<option value="">Select Stream</option>
											<c:forEach items="${streamForm.streamDetails}"
												var="streamDetails" varStatus="status">
												<option value="${streamDetails.streamId}">${streamDetails.streamName}</option>
											</c:forEach>
									</select> </br> <span class="err"></span></td>
								</tr>
								<tr class="row1">
									<td valign="middle" align="right" class="input_txt">Group
										Name :</td>
									<td valign="top" align="left" class="input_txt"><select
										name="group_id">
											<option value="">Select Groups</option>
											<c:forEach items="${participantGroupForm.participantGroups}"
												var="participantGroups" varStatus="status">
												<option value="${participantGroups.group_id}">${participantGroups.group_name}</option>
											</c:forEach>
									</select> </br> <span class="err"></span></td>
								</tr>
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt">Frequency
										:</td>
									<td valign="top" align="left" class="input_txt"><select
										name="frequency" class="input_cmbbx2"
										onchange="openNewDiv(this.value)">
											<option value="0" selected="selected">One Per Day</option>
											<option value="1">Two Per Day</option>
											<option value="2">One Per Week</option>
									</select></td>
								</tr>


								<tr class="row1">
									<td valign="middle" align="right" class="input_txt">Start
										Date :</td>
									<td valign="top" align="left"><select id="yearSelect">
									</select> <select id="monthSelect">
									</select> <select id="daySelect">
									</select> <!-- <input
										type="text" name="start_date" id="datepicker"
										class="input_txtbx1" value=""></br>
									<span class="err"></span></td> --></td>
								</tr>
							</table>


							<table cellpadding="0" cellspacing="0" border="0" width="100%"
								id="one" style="display: block;" style="display:none;">
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt" width="52%">Start
										Time :</td>
									<td valign="top" align="left" class="input_txt"><select
										name="fstream_time" class="input_cmbbx2">
											<option value="12AM" selected="selected">12&nbsp;AM</option>
											<option value="01AM">01&nbsp;AM</option>
											<option value="02AM">02&nbsp;AM</option>
											<option value="03AM">03&nbsp;AM</option>
											<option value="04AM">04&nbsp;AM</option>
											<option value="05AM">05&nbsp;AM</option>
											<option value="06AM">06&nbsp;AM</option>
											<option value="07AM">07&nbsp;AM</option>
											<option value="08AM">08&nbsp;AM</option>
											<option value="09AM">09&nbsp;AM</option>
											<option value="10AM">10&nbsp;AM</option>
											<option value="11AM">11&nbsp;AM</option>
											<option value="12PM">12&nbsp;PM</option>
											<option value="01PM">01&nbsp;PM</option>
											<option value="02PM">02&nbsp;PM</option>
											<option value="03PM">03&nbsp;PM</option>
											<option value="04PM">04&nbsp;PM</option>
											<option value="05PM">05&nbsp;PM</option>
											<option value="06PM">06&nbsp;PM</option>
											<option value="07PM">07&nbsp;PM</option>
											<option value="08PM">08&nbsp;PM</option>
											<option value="09PM">09&nbsp;PM</option>
											<option value="10PM">10&nbsp;PM</option>
											<option value="11PM">11&nbsp;PM</option>
									</select></td>
								</tr>
							</table>


							<table cellpadding="0" cellspacing="0" border="0" width="100%"
								id="two" style="display: block;" style="display:none;">
								<!--<table cellpadding="0" cellspacing="0" border="0" width="100%">-->

								<tr class="row2">
									<td valign="middle" align="right" class="input_txt" width="52%">First
										Message sending Time :</td>
									<td valign="top" align="left" class="input_txt"><select
										name="sstream_time" class="input_cmbbx2">
											<option value="12AM" selected="selected">12&nbsp;AM</option>
											<option value="01AM">01&nbsp;AM</option>
											<option value="02AM">02&nbsp;AM</option>
											<option value="03AM">03&nbsp;AM</option>
											<option value="04AM">04&nbsp;AM</option>
											<option value="05AM">05&nbsp;AM</option>
											<option value="06AM">06&nbsp;AM</option>
											<option value="07AM">07&nbsp;AM</option>
											<option value="08AM">08&nbsp;AM</option>
											<option value="09AM">09&nbsp;AM</option>
											<option value="10AM">10&nbsp;AM</option>
											<option value="11AM">11&nbsp;AM</option>
											<option value="12PM">12&nbsp;PM</option>
											<option value="01PM">01&nbsp;PM</option>
											<option value="02PM">02&nbsp;PM</option>
											<option value="03PM">03&nbsp;PM</option>
											<option value="04PM">04&nbsp;PM</option>
											<option value="05PM">05&nbsp;PM</option>
											<option value="06PM">06&nbsp;PM</option>
											<option value="07PM">07&nbsp;PM</option>
											<option value="08PM">08&nbsp;PM</option>
											<option value="09PM">09&nbsp;PM</option>
											<option value="10PM">10&nbsp;PM</option>
											<option value="11PM">11&nbsp;PM</option>
									</select></td>
								</tr>




								<tr class="row1">
									<td valign="middle" align="right" class="input_txt" width="52%">Second
										Message sending Time :</td>
									<td valign="top" align="left" class="input_txt"><select
										name="stime_two" class="input_cmbbx2">
											<option value="12AM" selected="selected">12&nbsp;AM</option>
											<option value="01AM">01&nbsp;AM</option>
											<option value="02AM">02&nbsp;AM</option>
											<option value="03AM">03&nbsp;AM</option>
											<option value="04AM">04&nbsp;AM</option>
											<option value="05AM">05&nbsp;AM</option>
											<option value="06AM">06&nbsp;AM</option>
											<option value="07AM">07&nbsp;AM</option>
											<option value="08AM">08&nbsp;AM</option>
											<option value="09AM">09&nbsp;AM</option>
											<option value="10AM">10&nbsp;AM</option>
											<option value="11AM">11&nbsp;AM</option>
											<option value="12PM">12&nbsp;PM</option>
											<option value="01PM">01&nbsp;PM</option>
											<option value="02PM">02&nbsp;PM</option>
											<option value="03PM">03&nbsp;PM</option>
											<option value="04PM">04&nbsp;PM</option>
											<option value="05PM">05&nbsp;PM</option>
											<option value="06PM">06&nbsp;PM</option>
											<option value="07PM">07&nbsp;PM</option>
											<option value="08PM">08&nbsp;PM</option>
											<option value="09PM">09&nbsp;PM</option>
											<option value="10PM">10&nbsp;PM</option>
											<option value="11PM">11&nbsp;PM</option>
									</select></td>
								</tr>
							</table>

							<!--</div>-->

							<table cellpadding="0" cellspacing="0" border="0" width="100%"
								id="three" style="display: block;" style="display:none;">
								<!--<table cellpadding="0" cellspacing="0" border="0" width="100%">-->
								<!-- <tr class="row2">
									<td valign="middle" align="right" class="input_txt" width="52%">First
										Message sending Time :</td>
									<td valign="top" align="left" class="input_txt"><select
										name="ftime_three" class="input_cmbbx2">
											<option value="12AM" selected="selected">12&nbsp;AM</option>
											<option value="01AM">01&nbsp;AM</option>
											<option value="02AM">02&nbsp;AM</option>
											<option value="03AM">03&nbsp;AM</option>
											<option value="04AM">04&nbsp;AM</option>
											<option value="05AM">05&nbsp;AM</option>
											<option value="06AM">06&nbsp;AM</option>
											<option value="07AM">07&nbsp;AM</option>
											<option value="08AM">08&nbsp;AM</option>
											<option value="09AM">09&nbsp;AM</option>
											<option value="10AM">10&nbsp;AM</option>
											<option value="11AM">11&nbsp;AM</option>
											<option value="12PM">12&nbsp;PM</option>
											<option value="01PM">01&nbsp;PM</option>
											<option value="02PM">02&nbsp;PM</option>
											<option value="03PM">03&nbsp;PM</option>
											<option value="04PM">04&nbsp;PM</option>
											<option value="05PM">05&nbsp;PM</option>
											<option value="06PM">06&nbsp;PM</option>
											<option value="07PM">07&nbsp;PM</option>
											<option value="08PM">08&nbsp;PM</option>
											<option value="09PM">09&nbsp;PM</option>
											<option value="10PM">10&nbsp;PM</option>
											<option value="11PM">11&nbsp;PM</option>
									</select></td>
								</tr>
 -->



								<tr class="row2">
									<td valign="middle" align="right" class="input_txt" width="52%">
										Message sending Day :</td>
									<td valign="top" align="left" class="input_txt"><select
										name="stream_week_day" class="input_cmbbx2">
											<option value="Sun" selected="selected">Sunday</option>
											<option value="Mon">Monday</option>
											<option value="Tue">Tuesday</option>
											<option value="Wed">Wednesday</option>
											<option value="Thu">Thursday</option>
											<option value="Fri">Friday</option>
											<option value="Sat">Saturday</option>

									</select></td>
								</tr>
							</table>
							<!--</div>-->
							<table cellpadding="0" cellspacing="0" border="0" width="100%">


								<tr class="row1">
									<td valign="top" align="right">&nbsp;</td>
									<td valign="top" align="center"><input type="submit"
										class="submit_btn1" value="Send Stream" /></td>
								</tr>
							</table>
		</table>
</div>
</div>
</td>
</tr>
<script language="JavaScript">
	function openNewDiv(val) {
		// alert(val);
		if (val == '0') {
			document.getElementById("one").style.display = 'block';
			document.getElementById("two").style.display = 'none';
			document.getElementById("three").style.display = 'none';

		} else if (val == '1') {
			document.getElementById("two").style.display = 'block';
			document.getElementById("one").style.display = 'none';
			document.getElementById("three").style.display = 'none';

		} else if (val == '2') {
			document.getElementById("three").style.display = 'block';
			document.getElementById("two").style.display = 'none';
			document.getElementById("one").style.display = 'none';

		}

	}

	function createDropdownDate() {

		var monthtext = [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul',
				'Aug', 'Sept', 'Oct', 'Nov', 'Dec' ];
		var today = new Date();

		$(function() {

			var monthfield = document.getElementById('monthSelect');
			var yearfield = document.getElementById('yearSelect');

			for ( var m = 0; m < 12; m++)
				monthfield.options[m] = new Option(monthtext[m], monthtext[m]);
			monthfield.options[today.getMonth()] = new Option(monthtext[today
					.getMonth()], monthtext[today.getMonth()], true, true); //select today's month

			var thisyear = today.getFullYear()
			for ( var y = 0; y < 20; y++) {
				yearfield.options[y] = new Option(thisyear, thisyear);
				thisyear += 1;
			}
			yearfield.options[0] = new Option(today.getFullYear(), today
					.getFullYear(), true, true); //

			/* alert($("#monthSelect").val());
			alert($("#yearSelect").val()); */
			$("#monthSelect").on("change", function() {
				BindDays();
			});
			$("#yearSelect").on("change", function() {
				BindDays();
			});
			BindDays();
		});
	}

	function BindDays() {
		var today = new Date();
		var month = $("#monthSelect").val();
		var dayDropDown = document.getElementById('daySelect');

		dayDropDown.options.length = 0;

		if (month == 'Feb') {
			for ( var i = 1; i <= 28; i++) {

				dayDropDown.options[i] = new Option(i, i + 1);
			}
			var year = $("#yearSelect").val();
			if (parseInt(year) % 4 == 0) {

				dayDropDown.options[29] = new Option(29, 29);
			}
		}

		else if (month == 'Apr' || month == 'Jun' || month == 'Sept'
				|| month == 'Nov') {
			for ( var i = 1; i <= 30; i++) {

				dayDropDown.options[i] = new Option(i, i + 1);
			}
		} else {

			for ( var i = 1; i <= 31; i++) {
				dayDropDown.options[i] = new Option(i, i + 1);
			}

		}
		dayDropDown.options[today.getDate()] = new Option(today.getDate(),
				today.getDate(), true, true) //select today's day

	}
</script>


<script>
	window.onload = function() {
		openNewDiv('0');
		createDropdownDate();
		startTime();
	}
</script>
