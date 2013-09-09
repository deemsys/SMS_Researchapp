<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="?do=insertadminuser">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"><!--<div class="info_div">
            <label><img src="images/icons/icon_edit.png" alt="Edit" /> Edit</label>
            <label><img src="images/icons/icon_approve.png" alt="Approve" /> Approve</label>
            <label><img src="images/icons/icon_unapprove.png" alt="Unapprove" /> Unapprove</label>
            <label><img src="images/icons/icon_delete.png" alt="Delete" /> Remove</label>
          </div>--><!--<AJDF:output>if count($errmsg) gt 0</AJDF:output>
		<div class="status error">
            <p class="closestatus"><AJDF:output>foreach name=err item=err from=$errmsg</AJDF:output><a href="" title="Close">x</a></p>
            <p><img src="images/icons/icon_error.png" alt="Error" /><span>Error!</span> <AJDF:output>$err</AJDF:output>.</p> <AJDF:output>/foreach</AJDF:output>
          </div><AJDF:output>/if </AJDF:output>--></td>
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
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="name" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$errval.name</AJDF:output>" /></br><span class="err"><AJDF:output>$errmsg.name</AJDF:output></span></td>
                </tr>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> E-mail :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="email" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$errval.email</AJDF:output>" /></br><span class="err"><AJDF:output>$errmsg.email</AJDF:output></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="password" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$errval.password</AJDF:output>" /></br><span class="err"><AJDF:output>$errmsg.password</AJDF:output></span></td>
                </tr>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Retype password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="repassword" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$errval.repassword</AJDF:output>" /></br><span class="err"><AJDF:output>$errmsg.repassword</AJDF:output></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Mobile :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="mobile" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$errval.mobile</AJDF:output>" /></br><span class="err"><AJDF:output>$errmsg.mobile</AJDF:output></span></td>
                </tr>
		<tr class="row1">
                  <td align="right" valign="middle" class="input_txt"><span class="err">*</span> Address :</td>
                  <td align="left" valign="top" class="input_txt"><textarea onmouseout="hideTooltip('tooltip_id');" onmouseover="showTooltip('tooltip_id','inp_id5');" id="inp_id5" cols="" rows="5" name="address" class="input_txtarea"><AJDF:output>$errval.address</AJDF:output></textarea></br><span class="err"><AJDF:output>$errmsg.address</AJDF:output></span></td>
                </tr>
                <tr class="row2">
                  <td valign="top" align="right" class="input_txt"> Privileges  :</td>
                  <td valign="top" align="left" class="input_txt">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr class="row3">
<td><b>Stream</b></td>
<td><input type="checkbox"  value="addstream" name="addstream" <AJDF:output> if $errval.addstream eq addstream </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Add  </td>
<td><input type="checkbox"  value="editstream" name="editstream" <AJDF:output> if $errval.editstream eq editstream </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Edit</td>
<td><input type="checkbox"  value="deletestream" name="deletestream" <AJDF:output> if $errval.deletestream eq deletestream </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Delete</td>
<td><input type="checkbox"  value="broadcaststream" name="broadcaststream" <AJDF:output> if $errval.broadcaststream eq broadcaststream </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Broadcast</td>
</tr>

<tr class="row3">
<td><b>Participant</b></td>
<td><input type="checkbox"  value="addparticipant" name="addparticipant" <AJDF:output> if $errval.addparticipant eq addparticipant </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Add  </td>
<td><input type="checkbox"  value="editparticipant" name="editparticipant" <AJDF:output> if $errval.editparticipant eq editparticipant </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Edit</td>
<td colspan="2"><input type="checkbox"  value="deleteparticipant" name="deleteparticipant" <AJDF:output> if $errval.deleteparticipant eq deleteparticipant </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Delete</td>
</tr>

<tr class="row3">
<td><b>Admin user</b></td>
<td ><input type="checkbox"  value="addadminuser" name="addadminuser" <AJDF:output> if $errval.addadminuser eq addadminuser </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Add </td>
<td ><input type="checkbox"  value="edituser" name="edituser" <AJDF:output> if $errval.edituser eq edituser </AJDF:output> checked <AJDF:output>/if </AJDF:output> />  Edit </td>
<td colspan="2"><input type="checkbox"  value="deleteuser" name="deleteuser" <AJDF:output> if $errval.deleteuser eq deleteuser </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Delete </td>
</tr>

<tr class="row3">
<td><b>Settings</b></td>
<td colspan="2"><input type="checkbox"  value="modifysettings" name="modifysettings" <AJDF:output> if $errval.modifysettings eq modifysettings </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Text Message API   </td>
<td colspan="2"><input type="checkbox"  value="mailtemplate" name="mailtemplate" <AJDF:output> if $errval.mailtemplate eq mailtemplate </AJDF:output> checked <AJDF:output>/if </AJDF:output> /> Mail Template   </td>
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
