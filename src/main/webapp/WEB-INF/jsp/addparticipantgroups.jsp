<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/calendar/calendar.js"></script>
<script type="text/javascript" src="js/calendar/calendar-en.js"></script>
<script type="text/javascript" src="js/calendar/calendar-setup.js"></script>
<link href="css/calendar_styles.css" rel="stylesheet" type="text/css" />
<div id="right_content">

<form action="addparticipantgroups" method="post" >

    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <c:if test="${success==true}">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
			<div class="status success">
	            <p class="closestatus"><a title="Close" href="">x</a></p>
	            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
	       	</div>                          
		</td>
      </tr>
      </c:if>
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
	                  <td valign="top" align="left" class="input_txt" width=70%><input type="text" name="group_name" class="input_txtbx" style="width:200px;"  id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="pgroups.group_name"></form:errors> </span></td>
	                </tr>
	
	                <tr class="row2">
	                  <td valign="middle" align="right" class="input_txt" width=30%><span class="err">*</span> Group Scope :</td>
	                  <td valign="middle" align="left"  width=70%>
	                   <c:if test="${success==true}">
	                    <input type="radio" name="group_scope" class="" id="scope_primary" checked onchange="closelocal();"  value="0"/>&nbsp;Primary&nbsp;&nbsp; 
	                  <input type="radio" name="group_scope"  id="scope_local"  value="1" onclick="openlocal();"/>&nbsp;Local</br><span class="err"></span></td>
	             
	                  </c:if>
	                  <input type="radio" name="group_scope" class="" id="scope_primary" onclick="closelocal();"  value="0"/>&nbsp;Primary&nbsp;&nbsp; 
	                  <input type="radio" name="group_scope"  id="scope_local" checked value="1" onclick="openlocal();"/>&nbsp;Local</br><span class="err"></span></td>
	                </tr>
			
			<tr class="row5" ><TD valign="middle" align="left" colspan="3">
			<c:if test="${success==true}">
			<div  id="local"  style="display:none;"> 
			 </c:if>
			 <c:if test="${success==false}">
			 <div  id="local"  style="display:block;"> 
			 </c:if>
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr class="row4">
			                  <td valign="top" align="right" class="input_txt" width=30% >&nbsp;<b> Local Group Criteria </b></td>
			                  <td valign="top" align="left" class="input_txt" width=70%></br><span class="err"></span></td>
			                </tr>
					<tr class="row4">
			                  <td valign="top" align="right" class="input_txt" width=30% ><span class="err">*</span> Select Group :</td>
			                   <td valign="top" align="left"  class="input_txt" width=70%>
			                   <select name="select_local_group">
			                   <c:forEach items="${participantGroupForm.participantGroups}" var="participantGroups" varStatus="status">
			                   <option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
			                   </c:forEach>
			                   </select>
			                   </br><span class="err"><form:errors path="pgroups.select_local_group"></form:errors></span></td>
			                </tr>
					<tr class="row4">
			                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> City :</td>
			                  <td valign="top" align="left" class="input_txt" width="70%"><input style="width:200px;" type="text" name="local_city" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="pgroups.local_city"></form:errors></span></td>
			                </tr>
					<tr class="row4">
			                  <td valign="middle" align="right" class="input_txt" width="30%" ><span class="err">*</span> Date Of Join From :</td>
			                  <td valign="top" align="left" class="input_txt" width="70%"><input style="width:200px;" type="text" name="local_dojfrom" class="input_txtbx" id="startdate"  value="" />&nbsp;&nbsp;<input type="button" id="startdatea" style="background:url(images/calendar.gif) left top no-repeat;  width:25px;outline:none; border:0;"> </br><span class="err"><form:errors path="pgroups.local_dojfrom"></form:errors></span></td>
			                </tr>
							<tr class="row4">
							                  <td valign="middle" align="right" class="input_txt" width="30%" ><span class="err">*</span> Date Of Join To :</td>
							                  <td valign="top" align="left" class="input_txt" width="70%"><input style="width:200px;" type="text" name="local_dojto" class="input_txtbx" id="enddate"  value="" />&nbsp;&nbsp;<input type="button" id="enddatea" style="background:url(images/calendar.gif) left top no-repeat;  width:25px;outline:none; border:0;"></br><span class="err"><form:errors path="pgroups.local_dojto"></form:errors></span></td>
							                </tr>
							<tr class="row4">
							                  <td valign="middle" align="right" class="input_txt" width="30%" ><span class="err">*</span> Age :</td>
							                  <td valign="top" align="left"  class="input_txt" width="70%"><input style="width:200px;" type="text" name="local_age" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/>
							                   <span class="err"><form:errors path="pgroups.local_age"></form:errors></span></td>
							                </tr>
							<tr class="row4">
							                 
							                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Education :</td>
							                  <td valign="top" align="left" class="input_txt" ><select name="local_educations" class="input_cmbbx1">
							                    <option selected value="School">School</option>
										<option   value="Some Collage">Some College</option>
										<option value="Professional Degree">Professional Degree</option>
										<option value="Master Degree">Master Degree</option>
							                   </select><br/>
							                   <span class="err"><form:errors path="pgroups.local_educations"></form:errors></span>
							                   </td>
		               
		                	</tr>
						</table>
					</div>
				</TD>
			</tr>
			
			<tr class="row1">
	                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Group Description :</td>
	                  <td valign="top" align="left" class="input_txt" width="70%"><textarea style="width:200px; height:100px;" name="group_decs" id="group_decs" class="input_txtbx" style="width: 301px; height: 109px;"></textarea></br><span class="err"><form:errors path="pgroups.group_decs"></form:errors></span></td>
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
		//document.getElementById('scope_local').setAttribute("checked","true");
	}
	
}
function closelocal()
{
	if(document.getElementById('local').style.display=="block")
	{
		document.getElementById('local').style.display="none";
		//document.getElementById('scope_local').setAttribute("checked","false");
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