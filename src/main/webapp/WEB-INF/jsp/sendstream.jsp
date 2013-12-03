<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/jquery-1.3.2.js"></script>

<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<script src="resources/js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>
<link rel="stylesheet" url="resources/js/jquery.js" />
<!-- 	<script src="/BePhitResearchApp/resources/js/jquery.js"></script> -->
	
<script>
$(function() {
	$("#datepicker").datepicker({ minDate: 0});
});
</script>	
	<script type="text/javascript">
$(window).load(function(){
$("#textingcontacts").keyup(function() {
	
}).keydown(function() {
    oldValue = $(this).val();
})
});
</script>
	<script type="text/javascript">
	function clear1()
	{
		var id=document.getElementById("info");
		var id1=document.getElementById("info2");
		var id2=document.getElementById("info3");
		id.innerHTML="";
		id2.innerHTML="";
		id1.innerHTML="";
	}
	</script>
<script>
	function doAjaxPost() {
		// get the form values  
		
		var id = $('#stream_id').val();
		/*   var education = $('#education').val();	 */
		
		$.ajax({
			type : "POST",
			url : "/BePhitResearchApp/sendstream_ajax",
			data : "stream_id=" + id,
			success : function(response) {
				// we have the response  
				$('#info').html(response);
				
				/*     $('#education').val(''); */
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
	function doAjaxPost_week() {
		// get the form values  
		
		var day = $('#stream_week_day').val();
		var date = $('#datepicker').val();
		/*   var education = $('#education').val();	 */
	
		$.ajax({
			
			type : "POST",
			url : "/BePhitResearchApp/sendstream_ajax_week",
			data : "stream_week_day=" + day+"&start_date="+date,
			
			success : function(response) {
				// we have the response  
				$('#info2').html(response);
				/*     $('#education').val(''); */
			},
			/* error : function(e) {
				alert('Error: ' + e);
			} */
		});
	}
</script>
<script type="text/javascript">
$(window).load(function(){
var oldValue = "";
$("#days_weeks").keyup(function() {
	$("#tc").html('');
	var intRegex = /^\d+$/;
	if(intRegex.test($(this).val())) 
	{

		var id = $('#stream_id').val();
		var days = $(this).val();
		var frequency = $('#frequency').val();
		/*   var education = $('#education').val();	 */
	
		$.ajax({
			
			type : "POST",
			url : "/BePhitResearchApp/check_lost",
			data : "stream_id=" + id +"&no_of_days="+days+"&frequency="+frequency,
			
			success : function(response) {
				// we have the response  
				$('#info3').html(response);
				/*     $('#education').val(''); */
			},
			error : function(e) {
				$("#info3").html('Kindly select stream name and group name!!');
			}
		});
			$("#tc").html('');
	  
	}
	else if($(this).val()=='')
		{
		$("#info3").html('');
		}
	else
		{
		$("#info3").html('Kindly give a number!!');
		}
}).keydown(function() {
    oldValue = $(this).val();
})
});
</script>	




<script type="text/javascript" src="js/ui.datepicker.js"></script>
<link type="text/css" href="css/demos.css" rel="stylesheet" />
<link type="text/css" href="css/ui.all.css" rel="stylesheet" />
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<div id="right_content">
	<form action="sendstream" method="POST">

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
									<input type="hidden" name="broad_id" value="${currentbroad}"/>
								</tr>
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt"><span class="err">*&nbsp;</span>Stream
										Name :</td>
									<td valign="top" align="left"><select
										name="stream_id" id="stream_id" onchange="doAjaxPost()"  class="input_cmbbx1">
											<option value="">Select Stream</option>
											<c:forEach items="${streamForm.streamDetails}"
												var="streamDetails" varStatus="status">
												<option value="${streamDetails.streamId}">${streamDetails.streamName}</option>
											</c:forEach>
									</select><span style="margin-left:10px;color:green;" id="info"></span> </br><span class="err"><form:errors path="broadCast.stream_id"></form:errors></span></td>
									
								</tr>
								<tr class="row1">
									<td valign="middle" align="right" class="input_txt"><span class="err">*&nbsp;</span>Group
										Name :</td>
									<td valign="top" align="left" class="input_txt"><select
										name="group_id" class="input_cmbbx1">
											<option value="">Select Groups</option>
											<c:forEach items="${participantGroupForm.participantGroups}"
												var="participantGroups" varStatus="status">
												<option value="${participantGroups.group_id}">${participantGroups.group_name}</option>
											</c:forEach>
									</select> </br> <span class="err"><form:errors path="broadCast.group_id"></form:errors></span></td>
								</tr>
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt"><span class="err">*&nbsp;</span>Frequency
										:</td>
									<td valign="top" align="left" class="input_txt"></span>
									<select name="frequency" id="frequency" class="input_cmbbx1"
										onchange="openNewDiv(this.value)">
											<option value="0" selected="selected">One Per Day</option>
											<option value="1">Two Per Day</option>
											<option value="3">Three Per Day</option>
											<option value="2">One Per Week</option>											
									</select></td>
								</tr>

<tr class="row1" >
									<td valign="middle" align="right" class="input_txt1" id="weeks"><span class="err">*&nbsp;</span>No of Weeks :</td>
									<td valign="middle" align="right" class="input_txt1" id="days"><span class="err">*&nbsp;</span>No of Days :</td>
									<td valign="top" align="left" id="daystext">
										<input type="text" name="days_weeks"
										id="days_weeks" class="input_txtbx1" value=""><span style="margin-left:10px;color:red;" id="info3"></span></br> <span
										class="err"><form:errors path="broadCast.days_weeks"></form:errors></span>
									</td>
									</td>
								</tr>
								<%-- <tr class="row1" >
									<td valign="middle" align="right" class="input_txt1" id="weeks">No of Weeks :</td>
									<td valign="top" align="left" id="weekstext">
										<input type="text" name=""
										id="" class="input_txtbx1" value=""></br> <span
										class="err"><form:errors path="broadCast.start_date"></form:errors></span>
									</td>
									</td>
								</tr>
							 --%>	<tr class="row1">
									<td valign="middle" align="right" class="input_txt1"><span class="err">*&nbsp;</span>Start
										Date :</td>
									<td valign="top" align="left">
										<input type="text" name="start_date"
										id="datepicker" class="input_txtbx1" value=""></br> <span
										class="err"><form:errors path="broadCast.start_date"></form:errors></span>
									</td>
									</td>
								</tr>						
								
								
								
								
							</table>


							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"
								id="one" style="display: block;" style="display: none;">
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt" width="200"><span class="err">*&nbsp;</span>Message Sending Time :</td>
									<td valign="top" align="left" class="input_txt">
									<select name="fstream_time" class="input_cmbbx1">
											<option value="01" selected="selected">1&nbsp;</option>
											<option value="02">2&nbsp;</option>
											<option value="03">3&nbsp;</option>
											<option value="04">4&nbsp;</option>
											<option value="05">5&nbsp;</option>
											<option value="06">6&nbsp;</option>
											<option value="07">7&nbsp;</option>
											<option value="08">8&nbsp;</option>
											<option value="09">9&nbsp;</option>
											<option value="10">10&nbsp;</option>
											<option value="11">11&nbsp;</option>
											<option value="12">12&nbsp;</option>
											</select>
									<select name="fstream_time_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select></td>
								</tr>
							</table>


							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"
								id="two" style="display: block;" style="display: none;">
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt" width="200"><span class="err">*&nbsp;</span>First
										Message Sending Time :</td>
									<td valign="top" align="left" class="input_txt">
									<select name="fstream_time" class="input_cmbbx1">
											<option value="01" selected="selected">1&nbsp;</option>
											<option value="02">2&nbsp;</option>
											<option value="03">3&nbsp;</option>
											<option value="04">4&nbsp;</option>
											<option value="05">5&nbsp;</option>
											<option value="06">6&nbsp;</option>
											<option value="07">7&nbsp;</option>
											<option value="08">8&nbsp;</option>
											<option value="09">9&nbsp;</option>
											<option value="10">10&nbsp;</option>
											<option value="11">11&nbsp;</option>
											<option value="12">12&nbsp;</option>
											</select>
									<select name="fstream_time_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select></td>
								</tr>
								<tr class="row1">
									<td valign="middle" align="right" class="input_txt"><span class="err">*&nbsp;</span>Second
										Message sending Time :</td>
									<td valign="top" align="left" class="input_txt">
									<select name="sstream_time" class="input_cmbbx1">
											<option value="01" selected="selected">1&nbsp;</option>
											<option value="02">2&nbsp;</option>
											<option value="03">3&nbsp;</option>
											<option value="04">4&nbsp;</option>
											<option value="05">5&nbsp;</option>
											<option value="06">6&nbsp;</option>
											<option value="07">7&nbsp;</option>
											<option value="08">8&nbsp;</option>
											<option value="09">9&nbsp;</option>
											<option value="10">10&nbsp;</option>
											<option value="11">11&nbsp;</option>
											<option value="12">12&nbsp;</option>
											</select>
									<select name="sstream_time_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select></td></td>
								</tr>
							</table>			
							
							
							
							
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"
								id="third" style="display: block;" style="display: none;">
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt" width="200"><span class="err">*&nbsp;</span>First
										Message Sending Time :</td>
									<td valign="top" align="left" class="input_txt">
									<select name="fstream_time" class="input_cmbbx1">
											<option value="01" selected="selected">1&nbsp;</option>
											<option value="02">2&nbsp;</option>
											<option value="03">3&nbsp;</option>
											<option value="04">4&nbsp;</option>
											<option value="05">5&nbsp;</option>
											<option value="06">6&nbsp;</option>
											<option value="07">7&nbsp;</option>
											<option value="08">8&nbsp;</option>
											<option value="09">9&nbsp;</option>
											<option value="10">10&nbsp;</option>
											<option value="11">11&nbsp;</option>
											<option value="12">12&nbsp;</option>
											</select>
									<select name="fstream_time_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select></td>
								</tr>
								<tr class="row1">
									<td valign="middle" align="right" class="input_txt"><span class="err">*&nbsp;</span>Second
										Message sending Time :</td>
									<td valign="top" align="left" class="input_txt">
									<select name="sstream_time" class="input_cmbbx1">
											<option value="01" selected="selected">1&nbsp;</option>
											<option value="02">2&nbsp;</option>
											<option value="03">3&nbsp;</option>
											<option value="04">4&nbsp;</option>
											<option value="05">5&nbsp;</option>
											<option value="06">6&nbsp;</option>
											<option value="07">7&nbsp;</option>
											<option value="08">8&nbsp;</option>
											<option value="09">9&nbsp;</option>
											<option value="10">10&nbsp;</option>
											<option value="11">11&nbsp;</option>
											<option value="12">12&nbsp;</option>
											</select>
									<select name="sstream_time_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select></td></td>
								</tr>
						
								<tr class="row1">
									<td valign="middle" align="right" class="input_txt"><span class="err">*&nbsp;</span>Third
										Message sending Time :</td>
									<td valign="top" align="left" class="input_txt">
									<select name="tstream_time" class="input_cmbbx1">
											<option value="01" selected="selected">1&nbsp;</option>
											<option value="02">2&nbsp;</option>
											<option value="03">3&nbsp;</option>
											<option value="04">4&nbsp;</option>
											<option value="05">5&nbsp;</option>
											<option value="06">6&nbsp;</option>
											<option value="07">7&nbsp;</option>
											<option value="08">8&nbsp;</option>
											<option value="09">9&nbsp;</option>
											<option value="10">10&nbsp;</option>
											<option value="11">11&nbsp;</option>
											<option value="12">12&nbsp;</option>
											</select>
									<select name="tstream_time_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select></td></td>
								</tr>
</table>
							
							<!--</div>-->

							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"
								id="three" style="display: block;" style="display: none;">
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt" width="200"><span class="err">*&nbsp;</span>
										Message Sending Day :</td>
									<td valign="top" align="left" class="input_txt"><select
										name="stream_week_day" id="stream_week_day" onchange="doAjaxPost_week()" class="input_cmbbx1">
										<option  selected="selected">Select Day</option>
											<option value="0">Sunday</option>
											<option value="1">Monday</option>
											<option value="2">Tuesday</option>
											<option value="3">Wednesday</option>
											<option value="4">Thursday</option>
											<option value="5">Friday</option>
											<option value="6">Saturday</option>

									</select><span style="margin-left:10px;color:green;" id="info2"></span></td>
								</tr>
							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="margin_table"
								id="four" style="display: block;" style="display: none;">
								<tr class="row1">
									<td valign="middle" align="right" class="input_txt" width="200"><span class="err">*</span>Message Sending
										Time :</td>
									<td valign="top" align="left" class="input_txt"><select name="fstream_time" class="input_cmbbx1">
											<option value="01" selected="selected">1&nbsp;</option>
											<option value="02">2&nbsp;</option>
											<option value="03">3&nbsp;</option>
											<option value="04">4&nbsp;</option>
											<option value="05">5&nbsp;</option>
											<option value="06">6&nbsp;</option>
											<option value="07">7&nbsp;</option>
											<option value="08">8&nbsp;</option>
											<option value="09">9&nbsp;</option>
											<option value="10">10&nbsp;</option>
											<option value="11">11&nbsp;</option>
											<option value="12">12&nbsp;</option>
											</select>
									<select name="fstream_time_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select></td>								</tr>
							</table>
							
							
							
								<table align="left"><tr><td style="padding-left:230px;"><input type="submit" class="submit_btn2" value="Send Stream" style="color:white;" name="insert"></td>
							<td width="50"></td><td><input type="reset" value="Reset" onclick="clear1()" class="submit_btn"></td><td width="50">
							<td><a href="viewreports" class="submit_btn" style="color:white">Cancel</a></td></tr></table>
								
							
		</table>
		</form>
		</div>
		

<script language="JavaScript">
	function openNewDiv(val) {
		// alert(val);
		
		var id=document.getElementById("days_weeks");
		id.value="";
		var info=document.getElementById("info3");
		info.innerHTML="";
		if (val == '0') {
			document.getElementById("weeks").style.display = 'none';
			document.getElementById("days").style.display = 'block';					
			document.getElementById("daystext").style.display = 'block';
			document.getElementById("one").style.display = 'block';			
			document.getElementById("two").style.display = 'none';
			document.getElementById("third").style.display = 'none';
			document.getElementById("three").style.display = 'none';
			document.getElementById("four").style.display = 'none';
			
		} 
		 else if (val == '1') {
			document.getElementById("weeks").style.display = 'none';
			document.getElementById("days").style.display = 'block';					
			document.getElementById("daystext").style.display = 'block';
			document.getElementById("one").style.display = 'none';			
			document.getElementById("two").style.display = 'block';
			document.getElementById("third").style.display = 'none';
			document.getElementById("three").style.display = 'none';
			document.getElementById("four").style.display = 'none';	
			
		} 
		
		else if (val == '3') {
			document.getElementById("weeks").style.display = 'none';
			document.getElementById("days").style.display = 'block';					
			document.getElementById("daystext").style.display = 'block';
			document.getElementById("one").style.display = 'none';			
			document.getElementById("two").style.display = 'none';
			document.getElementById("third").style.display = 'block';
			document.getElementById("three").style.display = 'none';
			document.getElementById("four").style.display = 'none';	
			

		}		
		else if (val == '2') {
		  document.getElementById("weeks").style.display = 'block';
			document.getElementById("days").style.display = 'none';					
			document.getElementById("daystext").style.display = 'block';
			document.getElementById("one").style.display = 'none';			
			document.getElementById("two").style.display = 'none';
			document.getElementById("third").style.display = 'none';
			document.getElementById("three").style.display = 'block';
			document.getElementById("four").style.display = 'block';
			
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

			var thisyear = today.getFullYear();
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
		startTime();
		createDropdownDate();
	}
</script>

