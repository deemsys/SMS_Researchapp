<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
</head>
<script type="text/javascript">
function validate()
{
var password1=document.getElementById("pass1");
var password2=document.getElementById("pass2");


if(password1.value == password2.value)
{
    return true;
}

else {
    alert("Passwords Do Not Match!");	
    return false;
}
}
</script>

<form method="POST" action="addadminuser"  onSubmit="validate();">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"><!--<div class="info_div">
            <label><img src="images/icons/icon_edit.png" alt="Edit" /> Edit</label>
            <label><img src="images/icons/icon_approve.png" alt="Approve" /> Approve</label>
            <label><img src="images/icons/icon_unapprove.png" alt="Unapprove" /> Unapprove</label>
            <label><img src="images/icons/icon_delete.png" alt="Delete" /> Remove</label>
          </div>
		<div class="status error">
            <p class="closestatus"><AJDF:output>foreach name=err item=err from=$errmsg</AJDF:output><a href="" title="Close">x</a></p>
            <p><img src="images/icons/icon_error.png" alt="Error" /><span>Error!</span> 
                      </div></td>-->
                      
                      
                      <c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
                      
                      
                      
                      
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Admin User</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              
                             <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_username" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="adminuser.admin_username"></form:errors></span></td>
                </tr>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> E-mail :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_email" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="adminuser.admin_email"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="admin_password" class="input_txtbx" id="pass1" value="" /><br/><span class="err"><form:errors path="adminuser.admin_password"></form:errors></span></td>
                </tr>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Retype password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="repassword" class="input_txtbx" id="pass2" value="" /><span class="err" id="spnsub_pass"><form:errors path="adminuser.repassword"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Mobile :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_mobile" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="adminuser.admin_mobile"></form:errors></span></td>
                </tr>
		<tr class="row1">
                  <td align="right" valign="middle" class="input_txt"><span class="err">*</span> Address :</td>
                  <td align="left" valign="top" class="input_txt"><textarea onmouseout="hideTooltip('tooltip_id');" onmouseover="showTooltip('tooltip_id','inp_id5');" id="inp_id5" cols="" rows="5" name="admin_address" class="input_txtarea"></textarea></br><span class="err"><form:errors path="adminuser.admin_address"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="top" align="right" class="input_txt"> Privileges  :</td>
                  <td valign="top" align="left" class="input_txt">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr class="row3">
<td><b>Stream</b></td>
<td><input type="checkbox"  value="1" name="addstream"    /> Add  </td>
<td><input type="checkbox"  value="1" name="editstream"    /> Edit</td>
<td><input type="checkbox"  value="1" name="deletestream"  /> Delete</td>
<td><input type="checkbox"  value="1" name="broadcaststream"  /> Broadcast</td>
</tr>

<tr class="row3">
<td><b>Participant</b></td>
<td><input type="checkbox"  value="1" name="addparticipant"   /> Add  </td>
<td><input type="checkbox"  value="1" name="editparticipant"   /> Edit</td>
<td colspan="2"><input type="checkbox"  value="1" name="deleteparticipant"   /> Delete</td>
</tr>

<tr class="row3">
<td><b>Admin user</b></td>
<td ><input type="checkbox"  value="1" name="addadminuser"   /> Add </td>
<td ><input type="checkbox"  value="1" name="edituser"    />  Edit </td>
<td colspan="2"><input type="checkbox"  value="1" name="deleteuser"    /> Delete </td>
</tr>

<tr class="row3">
<td><b>Settings</b></td>
<td colspan="2"><input type="checkbox"  value="1" name="modifysettings"   /> Text Message API   </td>
<td colspan="2"><input type="checkbox"  value="1" name="mailtemplate"    /> Mail Template   </td>
</tr>
</table>
</td>
                </tr>
                 
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="SAVE" class="submit_btn">  <span id="spnsub"></span></td>
              </tr>
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
</html>
      <jsp:include page="footer.jsp"></jsp:include>
