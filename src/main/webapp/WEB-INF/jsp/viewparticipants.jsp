<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

<div id="right_content">
	<!-- <form name="grid" action="" method="GET">
    --> 	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
				<td valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deleteparticipant'" /></label></p>
	          		</div>
				</td>
			</tr>
			<tr>
	        	<!--td valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="status success">
			            <p class="closestatus"><a title="Close" href="">x</a></p>
			            <p><img alt="Success" src="images/icons/icon_success.png"><span></span></p>
			          </div>
					<div class="status success">
			            <p class="closestatus"><a title="Close" href="">x</a></p>
			            <p><img alt="Success" src="images/icons/icon_success.png"><span></span></p>
			          </div>
					<div class="status success">
			            <p class="closestatus"><a title="Close" href="">x</a></p>
			            <p><img alt="Success" src="images/icons/icon_success.png"><span></span></p>
	          		</div>
				</td>-->
      		</tr>
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>View Participants</h2>
			        </div>
			        <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<form action="findParticipant" method="GET">
							  <tr>
							    <td align="left" valign="middle" width="10%">Mobile No:</td>
							    <td align="left" valign="middle" width="15%"><input type="text" name="mobile" class="input_txtbx1" id="mobile"></td>
							     <td align="left" valign="middle" width="10%">&nbsp;&nbsp;Group Name:</td>
							    <td align="left" valign="middle" width="15%"><input type="text" name="groupname" class="input_txtbx1" id="groupname"></td>
							    <td align="left" valign="middle" width="5%">&nbsp;&nbsp;City:</td>
							    <td align="left" valign="middle" width="15%"><input type="text" name="city" id="city" class="input_txtbx1"></td>
							     <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Find"></td>
							  </tr>
							  </form>
							</table>
						</div>
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td>
         						<td valign="top" align="left" width="10%">First&nbsp;Name</td>
					         	<td valign="top" align="left" width="15%">Mobile Number</td>
					         	<td valign="top" align="left" width="10%">City</td>
								<td valign="top" align="left" width="10%">Age</td>
          						<td valign="top" align="left" width="15%">Associated&nbsp;Streams</td>
          						<td valign="top" align="left" width="25%">Action</td>
        					</tr>
        					<c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
							       		<tr class="row1"> <!--  onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">-->
							       		<td valign="center" align="left" width="5%"><input type="checkbox" value="" name="checkall"></td>
							       		     	<td valign="top" align="left"  width="10%">${participantsDetails.fname}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.mobile_num}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.city}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.age}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.messaging_frequency}</td>
											<%-- <td valign="top" align="left" width="15%">${participantsDetails.education}</td> --%>
											<td><a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="#" style="padding-right:10px;">Remove</a></td>
						<%-- 					<td valign="top" align="left" width="15%">${participantsDetails.date_of_join}</td>
							 --%>			</tr>
							    	</c:forEach>
						</table>
						
					</div>
				</td>
			</tr>
		</table> 
<!-- 	</form> -->
</div>

<script language="javascript">
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Participant ?");
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
	}
	else{
		
	}
}
</script>

<script language="javascript">
function selectall(field)
{
	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}
function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
return true;
}
function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
return true;
}

function findpart()
{
 alert("sdasdasdas");
	
	alert(document.getElementById("moblie").value);
 alert(document.getElementById("group").value);
 alert(document.getElementById("city").value);
 
 
window.location="?do=viewparticipants&moblie="+document.getElementById("moblie").value+"&group="+document.getElementById("group").value+"&city="+document.getElementById("city").value;
}
</script>

<jsp:include page="footer.jsp"></jsp:include>