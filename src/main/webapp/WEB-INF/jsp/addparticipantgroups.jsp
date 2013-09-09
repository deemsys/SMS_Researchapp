<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/calendar/calendar.js"></script>
<script type="text/javascript" src="js/calendar/calendar-en.js"></script>
<script type="text/javascript" src="js/calendar/calendar-setup.js"></script>
<link href="css/calendar_styles.css" rel="stylesheet" type="text/css" />
<div id="right_content">

<form method="post" action="">

    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
			<div class="status success">
	            <p class="closestatus"><a title="Close" href="">x</a></p>
	            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
	       	</div>                          
		</td>
      </tr>
      <tr>
        <td valign="top" align="left">
        	<div>
	            <div class="headings altheading">
	              <h2>Participant Groups</h2>
	            </div>
	            <div class="contentbox">
	              <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                
	                <tr class="row1">
	                  <td valign="middle" align="right" class="input_txt" width=30% ><span class="err">*</span> Group Name :</td>
	                  <td valign="top" align="left" class="input_txt" width=70%><input type="text" name="name" class="input_txtbx" style="width:200px;"  id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$errval.name</AJDF:output>" /></br><span class="err"></span></td>
	                </tr>
	
	                <tr class="row2">
	                  <td valign="middle" align="right" class="input_txt" width=30%><span class="err">*</span> Group Scope :</td>
	                  <td valign="middle" align="left"  width=70%>
	                  <input type="radio" name="scope" class="" id="scope" onclick="closelocal();"  value="0" checked/>&nbsp;Primary&nbsp;&nbsp; 
	                  <input type="radio" name="scope"  id="scope"  value="1" checked onclick="openlocal();"/>&nbsp;Local</br><span class="err"></span></td>
	                </tr>
			
			<tr class="row5" ><TD valign="middle" align="left" colspan="3">
			<div  id="local" style="display:block;" style="display:none;"> 
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr class="row4">
			                  <td valign="top" align="right" class="input_txt" width=30% >&nbsp;<b> Local Group Criteria </b></td>
			                  <td valign="top" align="left" class="input_txt" width=70%></br><span class="err"></span></td>
			                </tr>
					<tr class="row4">
			                  <td valign="top" align="right" class="input_txt" width=30% ><span class="err">*</span> Select Group :</td>
			                  <td valign="top" align="left" class="input_txt" width=70%><AJDF:output>$group</AJDF:output></br><span class="err"><AJDF:output>$errmsg.group</AJDF:output></span></td>
			                </tr>
					<tr class="row4">
			                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> City :</td>
			                  <td valign="top" align="left" class="input_txt" width="70%"><input style="width:200px;" type="text" name="gcity" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$errval.gcity</AJDF:output>" /></br><span class="err"><AJDF:output>$errmsg.gcity</AJDF:output></span></td>
			                </tr>
					<tr class="row4">
			                  <td valign="middle" align="right" class="input_txt" width="30%" ><span class="err">*</span> Date Of Join From :</td>
			                  <td valign="top" align="left" class="input_txt" width="70%"><input style="width:200px;" type="text" name="dojfrom" class="input_txtbx" id="startdate"  value="<AJDF:output>$errval.dojfrom</AJDF:output>" />&nbsp;&nbsp;<input type="button" id="startdatea" style="background:url(images/calendar.gif) left top no-repeat;  width:25px;outline:none; border:0;"> </br><span class="err"><AJDF:output>$errmsg.dojfrom</AJDF:output></span></td>
			                </tr>
							<tr class="row4">
							                  <td valign="middle" align="right" class="input_txt" width="30%" ><span class="err">*</span> Date Of Join To :</td>
							                  <td valign="top" align="left" class="input_txt" width="70%"><input style="width:200px;" type="text" name="dojto" class="input_txtbx" id="enddate"  value="<AJDF:output>$errval.dojto</AJDF:output>" />&nbsp;&nbsp;<input type="button" id="enddatea" style="background:url(images/calendar.gif) left top no-repeat;  width:25px;outline:none; border:0;"></br><span class="err"><AJDF:output>$errmsg.dojto</AJDF:output></span></td>
							                </tr>
							<tr class="row4">
							                  <td valign="middle" align="right" class="input_txt" width="30%" ><span class="err">*</span> Age :</td>
							                  <td valign="top" align="left" class="input_txt" width="70%"><AJDF:output>$age</AJDF:output></td>
							                </tr>
							<tr class="row4">
							                 
							                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Education :</td>
							                  <td valign="top" align="left" class="input_txt" ><select name="edu" class="input_cmbbx1">
							                    <option <AJDF:output>if $errval.edu eq School</AJDF:output>selected <AJDF:output>/if</AJDF:output> value="School">School</option>
										<option   value="Some Collage" <AJDF:output>if $errval.edu eq 'Some Collage'</AJDF:output>selected <AJDF:output>/if</AJDF:output>>Some Collage</option>
										<option value="Professional Degree" <AJDF:output>if $errval.edu eq 'Professional Degree'</AJDF:output>selected <AJDF:output>/if</AJDF:output>>Professional Degree</option>
										<option value="Master Degree" <AJDF:output>if $errval.edu eq 'Master Degree'</AJDF:output>selected <AJDF:output>/if</AJDF:output>>Master Degree</option>
							                   </select></td>
		                
		                	</tr>
						</table>
					</div>
				</TD>
			</tr>
			
			<tr class="row1">
	                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Group Description :</td>
	                  <td valign="top" align="left" class="input_txt" width="70%"><textarea style="width:200px; height:100px;" name="description" id="description" class="input_txtbx" style="width: 301px; height: 109px;"><AJDF:output>$errval.description</AJDF:output></textarea></br><span class="err"><AJDF:output>$errmsg.description</AJDF:output></span></td>
	                </tr>
	                 <tr class="row2">
	                  <td valign="top" align="right">&nbsp;</td>
	                  <td valign="top" align="left"><input type="submit" class="submit_btn1" value="Add Group"></td>
	                </tr>
	              </table>
	            </div>
          </div></td>
      </tr>
     </table>
</form>

</div>
<script type="text/javascript">
function openlocal()
{
	if(document.getElementById('local').style.display=="none")
	{
		document.getElementById('local').style.display="block";
	}
	
}
function closelocal()
{
	if(document.getElementById('local').style.display=="block")
	{
		document.getElementById('local').style.display="none";
	}
	
}
</script>
<script type="text/javascript">
	Calendar.setup({
	  inputField    : "startdate",
	  button        : "startdatea",
	  align         : "Tr"
	});
</script>
<script type="text/javascript">
	 Calendar.setup({
	   inputField    : "enddate",
	   button        : "enddatea",
	   align         : "Tr"
	 });
</script>
<jsp:include page="footer.jsp"></jsp:include>