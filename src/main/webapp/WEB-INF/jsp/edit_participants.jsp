<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">

<form action="updateparticipant" method="post" name="update" id="update">

    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;

<!-- 
<AJDF:output>if $smarty.session.adduser !=''</AJDF:output>
		<div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span> <AJDF:output> $smarty.session.adduser</AJDF:output>.</p>
          </div><AJDF:output>/if</AJDF:output> -->

</td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Edit Participants</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
    <td align="left" valign="top" width="50%" style="padding-right:25px;">
    <h2 class="quck-txt">Quick Info</h2>
    
    <c:set value="${participantsDetailsForm.participantsDetails[0]}" var="participantsDetails"/>
     <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name :</td>
                  <input type="hidden" class="input_txtbx1" id="inp_id" value="${participantsDetails.participants_id }" name="participants_id" />
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.fname }" name="fname" /></br><span class="err"><form:errors path="participant.fname"></form:errors></span></td>
                </tr>

		 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> User Name :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.username }" name="username"/></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.username"></form:errors></font></td>
                </tr> 
		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Mobile No :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.mobile_num}" name="mobile_num" /></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.mobile_num"></form:errors></span> </font></td>
                </tr> 
		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Email-Id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.email_id}" name="email_id" /></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.email_id"></form:errors></span> </font></td>
                </tr> 

		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Gender :</td>
                  <td valign="top" align="left" class="input_txt">
                  <input type="radio" name="gender" value="0"  class="input_txt" <c:if test="${participantsDetails.gender=='0'}"><c:out value="checked=checked"/></c:if>>Male&nbsp;&nbsp;&nbsp;  <c:out value="${participantDetails.gender}"/>
                  <input type="radio" name="gender" value="1"  class="input_txt" <c:if test="${participantsDetails.gender=='1'}"><c:out value="checked=checked"/></c:if>> Female</td>
                </tr>
		 <tr class="row1">
                 <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Age :</td>
                 <td valign="top" align="left" class="input_txt"><select name="age" class="input_cmbbx1">
                 <option value="" <c:if test="${participantsDetails.age=='Below 12'}"><c:out value="selected"/></c:if>>Below 12</option>
                 <option value="12-20 years" <c:if test="${participantsDetails.age=='12-20 years'}"><c:out value="selected"/></c:if>>12-20 &#160 years</option>
                 <option value="20-30 years" <c:if test="${participantsDetails.age=='20-30 years'}"><c:out value="selected"/></c:if>>20-30 &#160 years</option>
                 <option value="30-40 years" <c:if test="${participantsDetails.age=='30-40 years'}"><c:out value="selected"/></c:if>>30-40 &#160 years</</option>                  
                 <option value="40-50 years" <c:if test="${participantsDetails.age=='40-50 years'}"><c:out value="selected"/></c:if>>40-50 &#160 years</option>
                 <option value="50-60 years"  <c:if test="${participantsDetails.age=='50-60 years'}"><c:out value="selected"/></c:if>>50-60 &#160 years</option>
                 <option value="60-70 years" <c:if test="${participantsDetails.age=='60-70 years'}"><c:out value="selected"/></c:if>>60-70 &#160 years</option>
                 <option value="70-80 years" <c:if test="${participantsDetails.age=='70-80 years'}"><c:out value="selected"/></c:if>>70-80 &#160 years</option>
                 <option value="80-90 years" <c:if test="${participantsDetails.age=='80-90 years'}"><c:out value="selected"/></c:if>>80-90 &#160 years</option>
                   <option value="90-100 years" <c:if test="${participantsDetails.age=='90-100 years'}"><c:out value="selected"/></c:if>>90-100 years</option>
                  
                  </select><%-- <input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.age}" name="age" /></br><span class="err"><form:errors path="participant.age"></form:errors></span> --%></td>
                </tr>
		
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> City :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.city}" name="city"/></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.city"></form:errors></span> </font></td>
                </tr>
		 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Education :</td>
                  <td valign="top" align="left" class="input_txt"><select name="education" class="input_cmbbx1">
                    <option value="School" <c:if test="${participantsDetails.education=='School'}"><c:out value="selected"/></c:if>>School</option>
			<option value="Some College" <c:if test="${participantsDetails.education=='Some College'}"><c:out value="selected"/></c:if> >Some College</option>
			<option value="Professional Degree" <c:if test="${participantsDetails.education=='Professional Degree'}"><c:out value="selected"/></c:if>>Professional Degree</option>
			<option value="Master Degree" <c:if test="${participantsDetails.education=='Master Degree'}"><c:out value="selected"/></c:if>>Master Degree</option>
                   </select></td>
                </tr>

		 <%-- <tr class="row1">
                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Note :</td>
                  <td valign="top" align="left" class="input_txt"><textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 220px; height: 89px;" name="note" />${participantsDetails.note}</textarea></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.note"></form:errors></span> </font></td>
                </tr> --%>
                 <!--<tr class="row1">
                  <td valign="middle" align="right" class="input_txt">Start Date :</td>
                  <td valign="top" align="left" class="input_txt">
                  <table width="260" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="70" align="center" valign="top" style="border-bottom:none;">DD</td>
    <td width="70" align="center" valign="top" style="border-bottom:none;">MM</td>
    <td width="160" align="center" valign="top" style="border-bottom:none;">YY</td>
  </tr>
  <tr>
    <td align="left" valign="top" style="border-bottom:none;"><select name="select2" class="input_cmbbx_cal1">
                    <option selected="selected">01</option>
                    <option>02</option>
                    <option>03</option>
                  </select></td>
    <td align="left" valign="top" style="border-bottom:none;"><select name="select2" class="input_cmbbx_cal1">
                    <option selected="selected">10</option>
                    <option>11</option>
                    <option>12</option>
                  </select></td>
    <td align="left" valign="top" style="border-bottom:none;"><select name="select2" class="input_cmbbx_cal2">
                    <option selected="selected">1985</option>
                    <option>1986</option>
                    <option>1987</option>
                  </select></td>
  </tr>
 </table>

                  </td>
                </tr>-->
                 
               <!--  <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn1" value="Send Stream" /></td>
                </tr>-->
              </table> 
              </td>
    <td align="left" valign="top"> <h2 class="quck-txt">More Info</h2>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
              
             
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Medical Details :</td>
                  <td valign="top" align="left" class="input_txt"><textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 220px; height: 89px;" name="medical_details"/>${participantsDetails.medical_details }</textarea></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.medical_details"></form:errors></span></font></td>
                </tr>


<tr><td><p class="quck-txt">Preferred&nbsp;Timings
</p></td></tr>


<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Time1:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
					  <option value="0-1" <c:if test="${participantsDetails.time1=='00-1'}"><c:out value="selected"/></c:if>>0-1</option>
                   <option value="1-2"  <c:if test="${participantsDetails.time1=='1-2'}"><c:out value="selected"/></c:if>>1-2</option>
				   <option value="2-3" <c:if test="${participantsDetails.time1=='2-3'}"><c:out value="selected"/></c:if>>2-3</option>
				   <option value="3-4" <c:if test="${participantsDetails.time1=='3-4'}"><c:out value="selected"/></c:if>>3-4</option>
				   <option value="4-5" <c:if test="${participantsDetails.time1=='4-5'}"><c:out value="selected"/></c:if>>4-5</option>
				   <option value="5-6" <c:if test="${participantsDetails.time1=='5-6'}"><c:out value="selected"/></c:if>>5-6</option>
				   <option value="6-7" <c:if test="${participantsDetails.time1=='6-7'}"><c:out value="selected"/></c:if>>6-7</option>
				   <option value="7-8"  <c:if test="${participantsDetails.time1=='7-8'}"><c:out value="selected"/></c:if>>7-8</option>
					<option value="8-9" <c:if test="${participantsDetails.time1=='8-9'}"><c:out value="selected"/></c:if>>8-9</option>
					<option value="9-10" <c:if test="${participantsDetails.time1=='9-10'}"><c:out value="selected"/></c:if>>9-10</option>
					<option value="10-11"  <c:if test="${participantsDetails.time1=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${participantsDetails.time1=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${participantsDetails.time1=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${participantsDetails.time1=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${participantsDetails.time1=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${participantsDetails.time1=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${participantsDetails.time1=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${participantsDetails.time1=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${participantsDetails.time1=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${participantsDetails.time1=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${participantsDetails.time1=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${participantsDetails.time1=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${participantsDetails.time1=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${participantsDetails.time1=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   
															
												</select><br/>
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Time2:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time2" class="input_cmbbx1" id="msg">
														<option value="00-1" id="time">00-1</option> <c:if test="${participantsDetails.time1=='00-1'}"><c:out value="selected"/></c:if>00-1</option>
                   <option value="0-1" <c:if test="${participantsDetails.time2=='0-1'}"><c:out value="selected"/></c:if>>0-1</option>
                   <option value="1-2"  <c:if test="${participantsDetails.time2=='1-2'}"><c:out value="selected"/></c:if>>1-2</option>
				   <option value="2-3" <c:if test="${participantsDetails.time2=='2-3'}"><c:out value="selected"/></c:if>>2-3</option>
				   <option value="3-4" <c:if test="${participantsDetails.time2=='3-4'}"><c:out value="selected"/></c:if>>3-4</option>
				   <option value="4-5" <c:if test="${participantsDetails.time2=='4-5'}"><c:out value="selected"/></c:if>>4-5</option>
				   <option value="5-6" <c:if test="${participantsDetails.time2=='5-6'}"><c:out value="selected"/></c:if>>5-6</option>
				   <option value="6-7" <c:if test="${participantsDetails.time2=='6-7'}"><c:out value="selected"/></c:if>>6-7</option>
				   <option value="7-8"  <c:if test="${participantsDetails.time2=='7-8'}"><c:out value="selected"/></c:if>>7-8</option>
					<option value="8-9" <c:if test="${participantsDetails.time2=='8-9'}"><c:out value="selected"/></c:if>>8-9</option>
					<option value="9-10" <c:if test="${participantsDetails.time2=='9-10'}"><c:out value="selected"/></c:if>>9-10</option>
					<option value="10-11"  <c:if test="${participantsDetails.time2=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${participantsDetails.time2=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${participantsDetails.time2=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${participantsDetails.time2=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${participantsDetails.time2=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${participantsDetails.time2=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${participantsDetails.time2=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${participantsDetails.time2=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${participantsDetails.time2=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${participantsDetails.time2=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${participantsDetails.time2=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${participantsDetails.time2=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${participantsDetails.time2=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${participantsDetails.time2=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   										
												</select><br/>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Time3:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
														<option value="0-1" <c:if test="${participantsDetails.time3=='0-1'}"><c:out value="selected"/></c:if>>0-1</option>
                   <option value="1-2"  <c:if test="${participantsDetails.time3=='1-2'}"><c:out value="selected"/></c:if>>1-2</option>
				   <option value="2-3" <c:if test="${participantsDetails.time3=='2-3'}"><c:out value="selected"/></c:if>>2-3</option>
				   <option value="3-4" <c:if test="${participantsDetails.time3=='3-4'}"><c:out value="selected"/></c:if>>3-4</option>
				   <option value="4-5" <c:if test="${participantsDetails.time3=='4-5'}"><c:out value="selected"/></c:if>>4-5</option>
				   <option value="5-6" <c:if test="${participantsDetails.time3=='5-6'}"><c:out value="selected"/></c:if>>5-6</option>
				   <option value="6-7" <c:if test="${participantsDetails.time3=='6-7'}"><c:out value="selected"/></c:if>>6-7</option>
				   <option value="7-8"  <c:if test="${participantsDetails.time3=='7-8'}"><c:out value="selected"/></c:if>>7-8</option>
					<option value="8-9" <c:if test="${participantsDetails.time3=='8-9'}"><c:out value="selected"/></c:if>>8-9</option>
					<option value="9-10" <c:if test="${participantsDetails.time3=='9-10'}"><c:out value="selected"/></c:if>>9-10</option>
					<option value="10-11"  <c:if test="${participantsDetails.time3=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${participantsDetails.time3=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${participantsDetails.time3=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${participantsDetails.time3=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${participantsDetails.time3=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${participantsDetails.time3=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${participantsDetails.time3=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${participantsDetails.time3=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${participantsDetails.time3=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${participantsDetails.time3=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${participantsDetails.time3=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${participantsDetails.time3=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${participantsDetails.time3=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${participantsDetails.time3=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   	
                   
															
												</select><br/>
												</td>
											</tr>
				
                
                
                

<tr><td><p class="quck-txt">Group</p></td></tr>

<tr class="row1"><td colspan="2"><p style=" line-height: 18px; padding: 1px 0pt; text-align: justify"><span class="err">*</span>Group is the internal classification for the better understanding of Participant's Demographics.<a href="#" onclick="javascript:CreateGroup()">[Create New Group]</a></p></td></tr>



    <tr class="row1">
                  <td valign="top" align="left" class="input_txt">Select Group :</td>
                  <td valign="top" align="left" class="input_txt">
                  <select name="group_name">
                  <c:forEach items="${participantGroupForm.participantGroups}" var="participantGroups" varStatus="status">
			                   <option value="${participantGroups.group_name}" <c:if test="${participantsDetails.group_name==participantGroups.group_name}"><c:out value="selected"/></c:if>>${participantGroups.group_name}</option>
			                   </c:forEach>
                  
                  </select>
                  
                  
                  </br><font color="Red" size="+1"><span class="err"></span></font></td>
                </tr>            
 </table>

                  </td>
                </tr>
                 
                 <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn2" value="Update Participant" onclick="update.submit()"></td>
                </tr>
              </table>
         
              
              </td>
  </tr>



</table>
              

            </div></form>

<%-- 
<AJDF:output>if $smarty.get.type eq '1'</AJDF:output>


<form action="?do=addparticipants&action=insert&type=<AJDF:output>$smarty.get.type</AJDF:output>" method="post" name="update" id="update">

    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;


<AJDF:output>if $smarty.session.adduser !=''</AJDF:output>
		<div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span> <AJDF:output> $smarty.session.adduser</AJDF:output>.</p>
          </div><AJDF:output>/if</AJDF:output>

<!--<div class="info_div">
            <label><img src="images/icons/icon_edit.png" alt="Edit" /> Edit</label>
            <label><img src="images/icons/icon_approve.png" alt="Approve" /> Approve</label>
            <label><img src="images/icons/icon_unapprove.png" alt="Unapprove" /> Unapprove</label>
            <label><img src="images/icons/icon_delete.png" alt="Delete" /> Remove</label>
          </div>--></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Participants2</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
    <td align="left" valign="top" width="50%" style="padding-right:25px;">
    <h2 class="quck-txt">Quick Infodsfdsf</h2>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr class="row1">
                  <td valign="middle" align="right" class="input_txt">First Name :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$smarty.session.part_fname</AJDF:output>" name="fname" /></br><font color="Red" size="+1"><AJDF:output>$errmsg.fname</AJDF:output></font></td>
                </tr>

		 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt">Last Name :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$smarty.session.part_lname</AJDF:output>" name="lname"/></br><font color="Red" size="+1"><AJDF:output>$errmsg.lname</AJDF:output></font></td>
                </tr> 
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt">Mobile No :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$smarty.session.part_mobile</AJDF:output>" name="mobile" /></br><font color="Red" size="+1"><AJDF:output>$errmsg.mobile</AJDF:output></font></td>
                </tr> 
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt">Email-Id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$smarty.session.part_email</AJDF:output>" name="email" /></br><font color="Red" size="+1"><AJDF:output>$errmsg.email</AJDF:output></font></td>
                </tr> 

	
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt">Gender :</td>
                  <td valign="top" align="left" class="input_txt"><input type="radio" name="gender" value="0" class="input_txt" checked="true">Male&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="1" class="input_txt">Female&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="2" class="input_txt">Transgender</td>
                </tr>
		 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt">Age :</td>
                  <td valign="top" align="left" class="input_txt"><AJDF:output>$age</AJDF:output></td>
                </tr>
		
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt">City :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$smarty.session.part_city</AJDF:output>" name="city"/></br><font color="Red" size="+1"><AJDF:output>$errmsg.city</AJDF:output></font></td>
                </tr>
		 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt">Education :</td>
                  <td valign="top" align="left" class="input_txt"><select name="education" class="input_cmbbx1">
                    <option selected="selected" value="School">School</option>
			<option value="Some Collage">Some Collage</option>
			<option value="Professional Degree">Professional Degree</option>
			<option value="Master Degree">Master Degree</option>
                   </select></td>
                </tr>

		 <tr class="row1">
                  <td valign="top" align="right" class="input_txt">Note :</td>
                  <td valign="top" align="left" class="input_txt"><textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 220px; height: 89px;" name="note"/><AJDF:output>$smarty.session.part_note</AJDF:output></textarea></br><font color="Red" size="+1"><AJDF:output>$errmsg.note</AJDF:output></font></td>
                </tr>
                 <!--<tr class="row1">
                  <td valign="middle" align="right" class="input_txt">Start Date :</td>
                  <td valign="top" align="left" class="input_txt">
                  <table width="260" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="70" align="center" valign="top" style="border-bottom:none;">DD</td>
    <td width="70" align="center" valign="top" style="border-bottom:none;">MM</td>
    <td width="160" align="center" valign="top" style="border-bottom:none;">YY</td>
  </tr>
  <tr>
    <td align="left" valign="top" style="border-bottom:none;"><select name="select2" class="input_cmbbx_cal1">
                    <option selected="selected">01</option>
                    <option>02</option>
                    <option>03</option>
                  </select></td>
    <td align="left" valign="top" style="border-bottom:none;"><select name="select2" class="input_cmbbx_cal1">
                    <option selected="selected">10</option>
                    <option>11</option>
                    <option>12</option>
                  </select></td>
    <td align="left" valign="top" style="border-bottom:none;"><select name="select2" class="input_cmbbx_cal2">
                    <option selected="selected">1985</option>
                    <option>1986</option>
                    <option>1987</option>
                  </select></td>
  </tr>
 </table>

                  </td>
                </tr>-->
                 
               <!--  <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn1" value="Send Stream" /></td>
                </tr>-->
              </table></td>
    <td align="left" valign="top"> <h2 class="quck-txt">More Info</h2>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
              
             
                <tr class="row1">
                  <td valign="top" align="right" class="input_txt">Medical Details :</td>
                  <td valign="top" align="left" class="input_txt"><textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 220px; height: 89px;" name="medical"/><AJDF:output>$smarty.session.part_medical</AJDF:output></textarea></br><font color="Red" size="+1"><AJDF:output>$errmsg.medical</AJDF:output></font></td>
                </tr>


<tr><td><p class="quck-txt">Texting&nbsp;Preference
</p></td></tr>



		  <tr class="row1">
                  <td valign="middle" align="right" class="input_txt">Messaging Frequency
 :</td>
                  <td valign="top" align="left" class="input_txt"><select name="frequency" class="input_cmbbx1">
                   <option value="Daily Twice" selected="selected">Daily Twice</option>
			<option value="Once a Day">Once a Day</option>
			<option value="Once in a week">Once in a week</option>
			<option value="No Preference">No Preference</option>
                   </select></td>
                </tr>

<tr><td><p class="quck-txt">Group</p></td></tr>

<tr class="row1"><td colspan="2"><p style=" line-height: 18px; padding: 1px 0pt; text-align: justify">Group is the internal classification for the better understanding of Participant's Demographics.<a href="#" onclick="javascript:CreateGroup()">[Create New Group]</a></p></td></tr>



    <tr class="row1">
                  <td valign="top" align="right" class="input_txt">Select Group :</td>
                  <td valign="top" align="left" class="input_txt"><AJDF:output>$group</AJDF:output></br><font color="Red" size="+1"><AJDF:output>$errmsg.group</AJDF:output></font></td>
                </tr>

                <!-- <tr class="row1">
                  <td valign="middle" align="right" class="input_txt">Start Date :</td>
                  <td valign="top" align="left" class="input_txt">
                  <table width="260" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="70" align="center" valign="top" style="border-bottom:none;">DD</td>
    <td width="70" align="center" valign="top" style="border-bottom:none;">MM</td>
    <td width="160" align="center" valign="top" style="border-bottom:none;">YY</td>
  </tr>
  <tr>
    <td align="left" valign="top" style="border-bottom:none;"><select name="select2" class="input_cmbbx_cal1">
                    <option selected="selected">01</option>
                    <option>02</option>
                    <option>03</option>
                  </select></td>
    <td align="left" valign="top" style="border-bottom:none;"><select name="select2" class="input_cmbbx_cal1">
                    <option selected="selected">10</option>
                    <option>11</option>
                    <option>12</option>
                  </select></td>
    <td align="left" valign="top" style="border-bottom:none;"><select name="select2" class="input_cmbbx_cal2">
                    <option selected="selected">1985</option>
                    <option>1986</option>
                    <option>1987</option>
                  </select></td>
  </tr>-->
 </table>

                  </td>
                </tr>
                 
                 <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn2" value="Add Participant" onclick="update.submit()"></td>
                </tr>
              </table></td>
  </tr>



</table>

              

            </div></form>
<AJDF:output>/if</AJDF:output>

          </div>



</td>


      </tr>
       --%>
      

<script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>

<jsp:include page="footer.jsp"></jsp:include>