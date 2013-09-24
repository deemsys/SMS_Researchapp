<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewparticipants">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
			
			
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
        					<c:if test="${fn:length(participantsDetailsForm.participantsDetails) gt 0}">
        					<c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
        				       					<tr class="row1"> <!--  onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">-->
							       		<td valign="center" align="left" width="5%"><input type="checkbox" value="" name="check"></td>
					     		     	<td valign="top" align="left"  width="10%">${participantsDetails.fname}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.mobile_num}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.city}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.age}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.messaging_frequency}</td>
											<td>
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editparticipant?id=${participantsDetails.participants_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteparticipants?id=${participantsDetails.participants_id}"/>" onclick="return confirmation()">Remove</a></td>
											
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
<!-- 	</form> -->
</div>

<script language="javascript">
function selectall(field)
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


function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Participant ?")
	if (answer){
		return true;
	}
	else{
		return false;
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