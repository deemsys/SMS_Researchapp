<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>
<div id="right_content">
	
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		
			<tr>
			<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewparticipants">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
			
			
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
							    <td align="left" valign="middle" width="15%">
							    <select name="groupname">
							    <option value = "">Select Groups</option>
			                  <c:forEach items="${participantGroupForm.participantGroups}" var="participantGroups" varStatus="status">
			                   <option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
			                   </c:forEach>
			                 </select><span class="err"><form:errors path="participant.groupname"></form:errors></span></td>
							    <td align="left" valign="middle" width="5%">&nbsp;&nbsp;City:</td>
							    <td align="left" valign="middle" width="15%"><input type="text" name="city" id="city" class="input_txtbx1"></td>
							     <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Find"></td>
						<!-- 	      <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Clear"></td>
						 -->	  </tr>
							  </form>
							</table>
						</div>
						 <form name="grid" onSubmit="return validate(this)" action="deleteSelectedparticipants" method="POST">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				     <tr><td colspan="7" valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" /></label></p>
	          		</div>
				</td></tr>
							<tr class="title">
								
								<td valign="center" align="right" width="10%"><input type="checkbox" value="" name="chkAll"></td>
         						<td valign="top" align="left" width="10%">First&nbsp;Name</td>
					         	<td valign="top" align="left" width="15%">Mobile Number</td>
					         	<td valign="top" align="left" width="10%">City</td>
								<td valign="top" align="left" width="10%">Age</td>
          						<td valign="top" align="left" width="15%">Associated&nbsp;Streams</td>
          						<td valign="top" align="left" width="25%">Action</td>
          						
				
		
        					</tr>
        					<c:if test="${fn:length(participantsDetailsForm.participantsDetails) gt 0}">
        					<c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
        				       					<tr class="row1">
							       		<td valign="center" align="right" width="10%"><input type="checkbox" value="${participantsDetails.participants_id}" name="chkUser"></td>
					     		     	<td valign="top" align="left"  width="10%">${participantsDetails.fname}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.mobile_num}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.city}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.age}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.messaging_frequency}</td>
											<td>
											<c:if test="${currentuser.adminuser[0].editparticipant==1}">
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editparticipant?id=${participantsDetails.participants_id}"/>" style="padding-right:10px;">Edit</a>
												</c:if>
												<c:if test="${currentuser.adminuser[0].deleteparticipant==1}">
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteparticipants?id=${participantsDetails.participants_id}"/>" onclick="return confirmation()">Remove</a>
											</c:if>
											</td>
								</tr>
							    	</c:forEach>
							    	</c:if>
							    <c:if test="${fn:length(participantsDetailsForm.participantsDetails) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Participants Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
							  
						</table>
						
						
					</div>
				</td>
			</tr>
		</table> 
		</form>
	
</div>


<script type="text/javascript">
$(function () {
$('input[name="chkUser"]').click(function () {
if ($('input[name="chkUser"]').length == $('input[name="chkUser"]:checked').length) {
$('input:checkbox[name="chkAll"]').attr("checked", "checked");
}
else {
$('input:checkbox[name="chkAll"]').removeAttr("checked");
}
});
$('input:checkbox[name="chkAll"]').click(function () {
var slvals = []
if ($(this).is(':checked')) {
$('input[name="chkUser"]').attr("checked", true);
}
else {
$('input[name="chkUser"]').attr("checked", false);
slvals = null;
}
});
})
</script>




<script language="javascript">
/* function selectall(field)
{
	field.getElementByTagName('checkbox');
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

 */ 
function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Participant ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


////////////////////////---------------------------
function validate()
{
//alert(fname);
var chks = document.getElementsByName('chkUser');
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
var result=confirm("Are you sure.You want to delete the User(s)?");
if(result)
	{
return true;
	}
else
	return false;
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