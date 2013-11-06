<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>
<form name="grid" onSubmit="return validate(this)" action="" method="POST">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      
      
      <c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewstream">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
      
      
      
      <td valign="top" align="left" style="padding:5px 0 10px 0;">
<div class="del_div">
             
            <p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deletestream'" /></label></p>

          </div>
</td></tr>

        <td valign="top" align="left" style="padding:5px 0 10px 0;">
		
		<!-- <div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"></p>
          </div>
		<div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span></p>
          </div>
		<div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"></p>
          </div> -->
</td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>View Stream</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="title">
		<td valign="center" align="left" width="5%"><input type="checkbox"  value="" name="chkAll"></td>
                  <td valign="top" align="left" width="10%">Stream ID</td>
		<td valign="top" align="left" width="15%">Name</td>
		<td valign="top" align="left" width="15%">Description</td>
                  <td valign="top" align="left" width="15%">No of Messages</td>
                  <td valign="top" align="left" width="15%">Created By</td>
		  <td valign="top" align="center" width="25%">Action</td>
<!--<AJDF:output>if $smarty.session.prive.1 !='' || $smarty.session.prive.2 !=''</AJDF:output>
                  <td valign="top" align="center" width="25%">Action</td>
<AJDF:output>else</AJDF:output>
 <td valign="top" align="center" width="25%"></td>
<AJDF:output>/if</AJDF:output>-->

                </tr></table>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="user_ajax">

		
		<c:forEach items="${streamForm.streamDetails}" var="streamDetails" varStatus="status">
        					
		<tr class="row1">
		<td valign="center" align="left" width="5%"><input type="checkbox" value="" name="chkUser"></td>
        <td valign="top" align="left" width="10%">${streamDetails.streamId}</td>
		<td valign="top" align="left" width="15%">${streamDetails.streamName}</td>
		<td valign="top" align="left" width="15%">${streamDetails.description}</td>
        <td valign="top" align="center" width="15%">${streamDetails.message_count}</td>
        <td valign="top" align="left" width="15%">${streamDetails.admin_username}</td>
		<td valign="top" align="center" width="25%">
		<c:if test="${currentuser.adminuser[0].editparticipant==1}">
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="#"/>" style="padding-right:10px;">Edit</a>
												</c:if>
												<c:if test="${currentuser.adminuser[0].deleteparticipant==1}">
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="#"/>" onclick="return confirmation()">Remove</a>
											</c:if>
     </td>
        </tr>
        </c:forEach>
         

              </table>
            </div>
          </div></td>
      </tr>
     
</form>
<script type="text/javascript">
function streamdelete(str) {

	var answer = confirm("Are you sure want to delete this Stream?")
	if (answer){
		window.location = "?do=deletestream&streamid="+str;
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
</script>
