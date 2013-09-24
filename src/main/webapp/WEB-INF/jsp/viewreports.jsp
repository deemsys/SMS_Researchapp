<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

<form name="grid" onSubmit="return validate(this)" action="" method="POST">

  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

     <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
		<!-- <div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"></p>
          </div>
		<div class="status error">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Error" src="images/icons/icon_error.png"></p>
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
              <h2>Broadcast Reports</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="title">
                  <td valign="top" align="left" width="10%">Broadcast&nbsp;Id</td>
                  <td valign="top" align="left" width="10%">Stream&nbsp;Name</td>
                  <td valign="top" align="left" width="10%">Send&nbsp;to&nbsp;Group</td>
		   <td valign="top" align="left" width="15%">No.&nbsp;of&nbsp;Particpants</td>

		<td valign="top" align="left" width="15%">Frequency</td>
		  <td valign="top" align="left" width="10%">Start&nbsp;Date</td>
                  <td valign="top" align="left" width="10%">Status</td>
                  <td valign="top" align="left" width="20%">No.&nbsp;of&nbsp;Msg&nbsp;Delivered</td>
                </tr>


</table>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="user_ajax">
</table>
</form>
<script>
function myFunction(str) {
	var answer = confirm("Are you sure want to delete this User?")
	if (answer){
		window.location = "?do=deleteuser&userid="+str;
	}
	else{
	}
}
</script>





