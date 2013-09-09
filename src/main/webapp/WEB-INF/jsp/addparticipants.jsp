<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
<form action="addparticipants" method="POST" name="update" id="update">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
		<div class="status success" style="display: none;">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
      <tr>
        <td valign="top" align="left">
        	<div>
	            <div class="headings altheading">
	              <h2>Add Participants</h2>
	            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				<tr>
    				<td align="left" valign="top" width="50%" style="padding-right:25px;">
    					<h2 class="quck-txt">Quick Info</h2>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%">
                        		<tr class="row1">
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name :</td>
				                  <td valign="top" align="left" class="input_txt">
				                  	<input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="fname" />
				                  	</br><font color="Red" size="+1"></font>
				                  </td>
				                </tr>

								 <tr class="row2">
						         	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Last Name :</td>
						            <td valign="top" align="left" class="input_txt">
						            	<input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="lname"/>
						            	</br><font color="Red" size="+1"></font></td>
						         </tr> 
								<tr class="row1">
				                	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Mobile No :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="mobile" /></br><font color="Red" size="+1"></font></td>
				                </tr> 
								<tr class="row2">
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Email-Id :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="email" /></br><font color="Red" size="+1"></font></td>
				                </tr>	
								<tr class="row1">
					            	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Gender :</td>
					                <td valign="top" align="left" class="input_txt"><input type="radio" name="gender" value="0" class="input_txt" checked="true">Male&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="1" class="input_txt">Female&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="2" class="input_txt">Transgender</td>
				                </tr>
								<tr class="row2">
				                 	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Age :</td>
				                  	<td valign="top" align="left" class="input_txt"></td>
				               	</tr>
						
				                <tr class="row1">
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> City :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="city"/></br><font color="Red" size="+1"></font></td>
				                </tr>
								 <tr class="row2">
				                 	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Education :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  		<select name="education" class="input_cmbbx1">
						                    <option selected="selected" value="School" >School</option>
											<option value="Some Collage">Some Collage</option>
											<option value="Professional Degree">Professional Degree</option>
											<option value="Master Degree">Master Degree</option>
				                   		</select>
				                   	</td>
				                </tr>
								<tr class="row1">
				                	<td valign="top" align="left" class="input_txt"><span class="err">*</span> Note :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  		<textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"/>
						
										</textarea></br><font color="Red" size="+1"></font>
									</td>
						       	</tr>
						                 
              				</table>
              			</td>
    					<td align="left" valign="top"> <h2 class="quck-txt">More Info</h2>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
			                <tr class="row1">
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Medical Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
			                  <td valign="top" align="left" class="input_txt">
			                  	<textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="medical"/></textarea>
			                  	</br><font color="Red" size="+1"></font></td>
			                </tr>


							<tr>
								<td><p class="quck-txt">Texting&nbsp;Preference</p>
								</td>
							</tr>



		  					<tr class="row2">
                  				<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Messaging Frequency:</td>
                  				<td valign="top" align="left" class="input_txt">
                  					<select name="frequency" class="input_cmbbx1">
                   						<option value="Daily Twice" selected="selected">Daily Twice</option>
										<option value="Once a Day">Once a Day</option>
										<option value="Once in a week">Once in a week</option>
										<option value="No Preference">No Preference</option>
							      	</select>
							    </td>
                			</tr>

							<tr><td><p class="quck-txt">Group</p></td></tr>
							<tr class="row1"><td colspan="2"><p style=" line-height: 18px; padding: 1px 0pt; text-align: justify">Group is the internal classification for the better understanding of Participant's Demographics.<a href="#" onclick="javascript:CreateGroup()">[Create New Group]</a></p></td></tr>
							<tr class="row2">
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Select Group&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</td>
			                  <td valign="top" align="left" class="input_txt"></br><font color="Red" size="+1"></font></td>
			                </tr>
			         	</table>
			    	</td>
              	</tr>
                <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn2" value="Add Participant" onclick="update.submit()"></td>
                </tr>
              </table>
         	</td>
  		</tr>
 	</table>
</form>
</div>
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<jsp:include page="footer.jsp"></jsp:include>