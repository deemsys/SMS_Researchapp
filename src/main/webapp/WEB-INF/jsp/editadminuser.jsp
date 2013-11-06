<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>

<form method="POST" action="updateadminuser">
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
              <h2>Edit Admin User</h2>
            </div>
            
            <div class="contentbox">
            
            <c:set value="${adminuserForm.adminuser[0]}" var="adminuser"/>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                <tr class="row2">
                <input type="hidden" name="admin_id" class="input_txtbx" id="inp_id3"  value="${adminuser.admin_id}" />
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_username" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${adminuser.admin_username }" /></br><span class="err"><form:errors path="adminuser.admin_username"></form:errors></span></td>
                </tr>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> E-mail :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_email" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${adminuser.admin_email }" /></br><span class="err"><form:errors path="adminuser.admin_email"></form:errors></span></td>
                </tr>
               <!-- <tr class="row2">
                   <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Password :</td>
                  <td valign="top" align="left" class="input_txt"> --><input type="hidden" name="admin_password" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${adminuser.admin_password }" /></br><span class="err"><form:errors path="adminuser.admin_password"></form:errors></span></td>
               <!--  </tr>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Retype password :</td>
                  <td valign="top" align="left" class="input_txt"> --><input type="hidden" name="repassword" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"></span></td>
               <!--  </tr> -->
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Mobile :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_mobile" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${adminuser.admin_mobile }" /></br><span class="err"><form:errors path="adminuser.admin_mobile"></form:errors></span></td>
                </tr>
		<tr class="row1">
                  <td align="right" valign="middle" class="input_txt"><span class="err">*</span> Address :</td>
                  <td align="left" valign="top" class="input_txt"><textarea onmouseout="hideTooltip('tooltip_id');" onmouseover="showTooltip('tooltip_id','inp_id5');" id="inp_id5" cols="" rows="5" name="admin_address" class="input_txtarea">${adminuser.admin_address}</textarea></br><span class="err"><form:errors path="adminuser.admin_address"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="top" align="right" class="input_txt"> Privileges  :</td>
                  <td valign="top" align="left" class="input_txt">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr class="row3">
<td><b>Stream</b></td>
<td><input type="checkbox"  value="1" name="addstream" <c:if test="${adminuser.addstream==1}"><c:out value="Checked"/></c:if>   /> Add  </td>
<td><input type="checkbox"  value="1" name="editstream" <c:if test="${adminuser.editstream==1}"><c:out value="Checked"/></c:if>   /> Edit</td>
<td><input type="checkbox"  value="1" name="deletestream"  <c:if test="${adminuser.deletestream==1}"><c:out value="Checked"/></c:if> /> Delete</td>
<td><input type="checkbox"  value="1" name="broadcaststream" <c:if test="${adminuser.broadcaststream==1}"><c:out value="Checked"/></c:if>   /> Broadcast</td>
</tr>

<tr class="row3">
<td><b>Participant</b></td>
<td><input type="checkbox"  value="1" name="addparticipant" <c:if test="${adminuser.addparticipant==1}"><c:out value="Checked"/></c:if>  /> Add  </td>
<td><input type="checkbox"  value="1" name="editparticipant"  <c:if test="${adminuser.editparticipant==1}"><c:out value="Checked"/></c:if> /> Edit</td>
<td colspan="2"><input type="checkbox"  value="1" name="deleteparticipant" <c:if test="${adminuser.deleteparticipant==1}"><c:out value="Checked"/></c:if>  /> Delete</td>
</tr>

<tr class="row3">
<td><b>Admin user</b></td>
<td ><input type="checkbox"  value="1" name="addadminuser" <c:if test="${adminuser.addadminuser==1}"><c:out value="Checked"/></c:if>  /> Add </td>
<td ><input type="checkbox"  value="1" name="edituser"  <c:if test="${adminuser.edituser==1}"><c:out value="Checked"/></c:if>  />  Edit </td>
<td colspan="2"><input type="checkbox"  value="1" name="deleteuser"  <c:if test="${adminuser.deleteuser==1}"><c:out value="Checked"/></c:if>  /> Delete </td>
</tr>

<tr class="row3">
<td><b>Settings</b></td>
<td colspan="2"><input type="checkbox"  value="1" name="modifysettings"  <c:if test="${adminuser.modifysettings==1}"><c:out value="Checked"/></c:if> /> Text Message API   </td>
<td colspan="2"><input type="checkbox"  value="1" name="mailtemplate"  <c:if test="${adminuser.mailtemplate==1}"><c:out value="Checked"/></c:if>  /> Mail Template   </td>
</tr>
</table>
</td>
                </tr>
                 
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="SAVE" class="submit_btn"></td>
                </tr>
              </table>
              
              
              
              
              
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
      <jsp:include page="footer.jsp"></jsp:include>
