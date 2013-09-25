<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>
<form name="grid" onSubmit="return validate(this)" action="deleteSelectedadminuser" method="POST">
	<div id="right_content">
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
			<tr>
        		<td valign="top" align="left" style="padding:5px 0 10px 0;">
        			<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1"  /></label></p>
					</div>
				</td>
		   	</tr>
			<tr>
			
			<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewadminuser">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
			
        		<!-- <td valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="status success">
            			<p class="closestatus"><a title="Close" href="">x</a></p>
            			<p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output> $smarty.session.adduser</AJDF:output></span> .</p>
          			</div>
					<div class="status success">
            			<p class="closestatus"><a title="Close" href="">x</a></p>
            			<p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output>$smarty.session.delete</AJDF:output></span> .</p>
          			</div>
					<div class="status success">
            			<p class="closestatus"><a title="Close" href="">x</a></p>
            			<p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output> $smarty.session.update</AJDF:output></span> .</p>
          			</div>
					<div class="status success">
            			<p class="closestatus"><a title="Close" href="">x</a></p>
            			<p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output> $smarty.session.active</AJDF:output></span> .</p>
          			</div>
					<div class="status success">
            			<p class="closestatus"><a title="Close" href="">x</a></p>
            			<p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output> $smarty.session.suspend</AJDF:output></span> </p>
          			</div>
				</td> -->
      		</tr>
      		<tr>
	        	<td valign="top" align="left">
	        		<div>
	            		<div class="headings altheading">
	              			<h2>Admin User</h2>
	            		</div>
	            		<div class="contentbox">
	              			<table cellpadding="0" cellspacing="0" border="0" width="100%">
	                			<tr class="title">
									<td valign="center" align="left" width="5%"><input type="checkbox" value="" name="chkAll"></td>
	                  				<td valign="top" align="left" width="16%">Name</td>
	                  				<td valign="top" align="left" width="20%">E-mail</td>
	                  				<td valign="top" align="left" width="10%">Mobile</td>
	                  				<td valign="top" align="left" width="25%">Address</td>
									<td valign="top" align="left" width="24%">Action</td>
								</tr>
								<c:forEach items="${adminuserForm.adminuser}" var="adminuser" varStatus="status">
							       		<tr class="row1">
							       		<td valign="center" align="left" width="5%"><input type="checkbox" value="${adminuser.admin_id}" name="chkUser"></td>
							       		  	<td valign="top" align="left"  width="10%">${adminuser.admin_username}</td>
											<td valign="top" align="left" width="15%">${adminuser.admin_email}</td>
											<td valign="top" align="left" width="10%">${adminuser.admin_mobile}</td>
											<td valign="top" align="left" width="10%">${adminuser.admin_address}</td>
											<td><a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editadminuser?id=${adminuser.admin_id}"/>" style="padding-right:10px;">Edit</a>
									     	
									     	<c:choose>
									     	<c:when test="${adminuser.status==0}">
									     	<a href="viewparticipants" title=""><img src="resources/images/icons/icon_approve.png" alt="Active" /></a><a href="#"  style="padding-right:20px;" onclick="myActive(${adminuser.admin_id},1)">Activate</a>
										 	</c:when>
										 	<c:when test="${adminuser.status==1}">
										 	<a href="viewparticipants" title=""><img src="resources/images/icons/icon_unapprove.png" alt="Suspend" /></a><a href="#" style="padding-right:10px;" onclick="myActive(${adminuser.admin_id},0)">Suspend</a>
										 	</c:when>										 	
										 	</c:choose>
										 	<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteadminuser?id=${adminuser.admin_id}"/>"  style="padding-right:10px;" onclick="return confirmation()">Remove</a></td>
									</tr>
							    	</c:forEach>
							</table>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</form>

<script>
function myFunction(str) {

	var answer = confirm("Are you sure want to delete this User?")
	if (answer){
		window.location = "?do=deleteuser&userid="+str;
	}
	else{
// 		alert("Thanks for sticking around!")
	}
}

function myActive(adminid,sta) {

	
	if(sta==1)
	{
		var answer = confirm("Are you sure want to Active this User?");
	}
	else
	{
		var answer = confirm("Are you sure want to Suspend this User?");
	}
	if (answer){
// 		alert("?do=activeuser&userid="+str+"&status="+sta);
		window.location = "permission?id="+adminid+"&status="+sta;
	}
	else{
// 		alert("Thanks for sticking around!")
	}
}
</script>
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

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete this user ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}




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
var result=Confirm("Are you sure?You want to delete the User(s)?");
if(result)
	{
return true;
	}
else
	return false;
}
</script>



<jsp:include page="footer.jsp"></jsp:include>