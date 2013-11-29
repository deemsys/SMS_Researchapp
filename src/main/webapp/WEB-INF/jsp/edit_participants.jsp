<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
<link rel="stylesheet" url="resources/js/jquery.js" />
<script src="/BePhitResearchApp/resources/js/jquery.js"></script>
<script type="text/javascript">
$(window).load(function(){
var oldValue = "";
$("#mno").keyup(function() {
	$("#spnmno").html('');
	var intRegex = /^\d+$/;
	if(intRegex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();
		var $newdiv="";
	  var $i=0;
	  if($in.length>10)
		  {
		  $("#spnmno").html('');
		  $("#spnmno").html('Mobile number is not valid. Should be of length 10!!');		
		   }	
			
	}
	else if($(this).val()!='')
		{
		
		$("#spnmno").html('Kindly give numbers only!!');
		}
}).keydown(function() {
    oldValue = $(this).val();
})
});
</script>
	


	<script type="text/javascript">
		function listbox_moveacross(sourceID, destID) {
			var src = document.getElementById(sourceID);
			var dest = document.getElementById(destID);
			var values = [];
			var values1 = [];
			for ( var i = 0; i < src.options.length; i++) {
				if (src.options[i].selected) {
					values.push(src.options[i].value);
				}
			}
			for ( var i = 0; i < dest.options.length; i++) {

				values1.push(dest.options[i].value);

			}
			for ( var i = 0; i < values.length; i++) {
				for ( var j = 0; j < values1.length; j++) {
					if (values[i] == values1[j]) {
						alert("Group Exists");
						return false;
					}
				}
			}

			for ( var count = 0; count < src.options.length; count++) {

				if (src.options[count].selected == true) {
					var option = src.options[count];

					var newOption = document.createElement("option");
					newOption.value = option.value;
					newOption.text = option.text;
					newOption.selected = true;
					try {
						dest.add(newOption, null); //Standard
						src.remove(count, null);
					} catch (error) {
						dest.add(newOption); // IE only
						src.remove(count);
					}
					count--;
				}
			}
		}
		function listbox_moveacrossright(sourceID, destID) {
			var src = document.getElementById(sourceID);
			var dest = document.getElementById(destID);
			for ( var count = 0; count < src.options.length; count++) {

				if (src.options[count].selected == true) {
					var option = src.options[count];

					var newOption = document.createElement("option");
					newOption.value = option.value;
					newOption.text = option.text;
					newOption.selected = true;
					try {
						dest.add(newOption, null); //Standard
						src.remove(count, null);
					} catch (error) {
						dest.add(newOption); // IE only
						src.remove(count);
					}
					count--;
				}
			}
		}

	</script>
	<script type="text/javascript">
		function doAjaxPost() {
			// get the form values  
			var name = $('#Provider_name').val();
			/*   var education = $('#education').val();	 */
			$.ajax({
				type : "POST",
				url : "/BePhitResearchApp/AddUser.htm",
				data : "Provider_name=" + name,
				success : function(response) {
					// we have the response  
					$('#info').html(response);
					/*     $('#education').val(''); */
				},
				error : function(e) {
					alert('Error: ' + e);
				}
			});
		}
	</script>

	<script>
		function validate() {
			var fld = document.getElementById('group_names');
			var values = [];
			for ( var i = 0; i < fld.options.length; i++) {
				if (fld.options[i].selected) {
					values.push(fld.options[i].value);
				}
			}

			if (values.length > 4) {
				alert("You can select only 4 groups");
				return false;
			} else
				return true;
		}
	</script>


	<form action="updateparticipant" method="POST" name="update"
		id="update">

    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
        <tr>
        <td valign="top" align="left">
        <div>
        
            <div class="headings altheading">
              <h2>Edit Participants</h2> </div>   
               
               <c:choose>
<c:when test="${empty addparticipants}">
               <div class="contentbox">   
               
    <c:set value="${participantsDetailsForm.participantsDetails[0]}" var="participantsDetails"/>  
    
              <table cellpadding="0" cellspacing="0" border="0" width="100%">       
             <tr>     

    <td align="left" valign="top" width="50%" style="padding-right:25px;">
    <h2 class="quck-txt">Quick Info</h2>
         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name :</td>
                  <input type="hidden" class="input_txtbx1" id="inp_id" value="${participantsDetails.participants_id }" name="participants_id" />
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.fname }" name="fname" /></br><span class="err"><form:errors path="participant.fname"></form:errors></span></td>
                </tr>

		
                <input type="hidden" class="input_txtbx1" id="inp_id" name="username" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.username }"/></br><font color="Red" size="+1"><span class="err"></font>
               
		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Mobile No :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="mno" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.mobile_num}" name="mobile_num" /></br><font color="Red" size="+1"><span class="err"><c:if test="${mobile_exists ==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number already exists </font>	<br/></c:if> <font
													color="Red" size="+1"><span id="spnmno">   <form:errors path="participant.mobile_num"></form:errors></span> </font></td>
                </tr> 
		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Email-Id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.email_id}" name="email_id" /></br><font color="Red" size="+1"><span class="err"><c:if test="${email_exist ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>Email already exists </font>	<br/></c:if><form:errors path="participant.email_id"></form:errors></span> </font></td>
                </tr> 

		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"> Gender :</td>
                  <td valign="top" align="left" class="input_txt">
                  <input type="radio" name="gender" value="0"  class="input_txt" <c:if test="${participantsDetails.gender=='0'}"><c:out value="checked=checked"/></c:if>>Male&nbsp;&nbsp;&nbsp;  <c:out value="${participantDetails.gender}"/>
                  <input type="radio" name="gender" value="1"  class="input_txt" <c:if test="${participantsDetails.gender=='1'}"><c:out value="checked=checked"/></c:if>> Female</td>
                </tr>
		 <tr class="row2">
                 <td valign="middle" align="left" class="input_txt"> Age :</td>
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
                  <td valign="middle" align="left" class="input_txt">City :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.city}" name="city"/></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.city"></form:errors></span> </font></td>
                </tr>
		 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"> Education :</td>
                  <td valign="top" align="left" class="input_txt"><select name="education" class="input_cmbbx1">
                    <option value="School" <c:if test="${participantsDetails.education=='School'}"><c:out value="selected"/></c:if>>School</option>
			<option value="Some College" <c:if test="${participantsDetails.education=='Some College'}"><c:out value="selected"/></c:if> >Some College</option>
			<option value="Professional Degree" <c:if test="${participantsDetails.education=='Professional Degree'}"><c:out value="selected"/></c:if>>Professional Degree</option>
			<option value="Master Degree" <c:if test="${participantsDetails.education=='Master Degree'}"><c:out value="selected"/></c:if>>Master Degree</option>
                   </select></td>
                </tr>         
  
              
            <tr class="row1">
                  <td valign="top" align="left" class="input_txt"> Medical Details :</td>
                  <td valign="top" align="left" class="input_txt"><textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 220px; height: 89px;" name="medical_details"/>${participantsDetails.medical_details }</textarea></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.medical_details"></form:errors></span></font></td></tr>
               
</table></td>
  <td align="left" valign="top"> 
<table cellpadding="0" cellspacing="0" border="0" width="100%">
</br>
<tr><td><p class="quck-txt">Preferred&nbsp;Timings
</p></td></tr>


<tr class="row2">
												<td valign="middle" align="left" class="input_txt">
													 Time1:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
												<option value="null" <c:if test="${participantsDetails.time1=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
					  <option value="00-01" <c:if test="${participantsDetails.time1=='00-01'}"><c:out value="selected"/></c:if>>00-01</option>
                   <option value="01-02"  <c:if test="${participantsDetails.time1=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${participantsDetails.time1=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${participantsDetails.time1=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${participantsDetails.time1=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${participantsDetails.time1=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${participantsDetails.time1=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${participantsDetails.time1=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${participantsDetails.time1=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${participantsDetails.time1=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
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
												<td valign="middle" align="left" class="input_txt">
													 Time2:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time2" class="input_cmbbx1" id="msg">
														<option value="null" <c:if test="${participantsDetails.time2=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
                   <option value="00-01" <c:if test="${participantsDetails.time2=='00-01'}"><c:out value="selected"/></c:if>>00-01</option>
                   <option value="01-02"  <c:if test="${participantsDetails.time2=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${participantsDetails.time2=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${participantsDetails.time2=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${participantsDetails.time2=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${participantsDetails.time2=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${participantsDetails.time2=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${participantsDetails.time2=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${participantsDetails.time2=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${participantsDetails.time2=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
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
												<td valign="middle" align="left" class="input_txt">
													 Time3:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
														<option value="null" <c:if test="${participantsDetails.time3=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
                   <option value="01-02"  <c:if test="${participantsDetails.time3=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${participantsDetails.time3=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${participantsDetails.time3=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${participantsDetails.time3=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${participantsDetails.time3=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${participantsDetails.time3=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${participantsDetails.time3=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${participantsDetails.time3=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${participantsDetails.time3=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
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
				<tr>
				
				<td><p class="quck-txt">Group</p></td></tr>

<tr class="row1"><td colspan="2"><p style=" line-height: 18px; padding: 1px 0pt; text-align: justify"><span class="err">*</span>Group is the internal classification for the better understanding of Participant's Demographics.<a href="#" onclick="javascript:CreateGroup()">[Create New Group]</a></p></td></tr>
                
                
                

<%-- 



    <tr class="row1">
                  <td valign="top" align="left" class="input_txt">Select Group :</td>
                  <td valign="top" align="left" class="input_txt">
                  <select name="group_name">
                  <c:forEach items="${group}" var="participantGroups" varStatus="status">
			                   <option value="${participantGroups}" >${participantGroups}</option>
			                   </c:forEach>
                  
                  </select>
                  
                  
                  </br><font color="Red" size="+1"><span class="err"></span></font></td>
                </tr>     --%>        
 </table>
 

											<table>
											<tr class="row2" >
												<td><span class="err">*</span> Select Group:</td>
												<td class="input_txt">
                                                    <p>Provider Groups</p>
													<select class="input_cmbbx2"
													 multiple="multiple" id="group_name">
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select>
												</td>
												<td>
												<td>
													<ul class="pagination">
														<li class="page_unselect"><a 
															onclick="listbox_moveacross('group_name','group_names')">&gt;&gt;</a>
															</li></ul>

															<!-- input type="submit" value=">>" onclick=""/> --> </br>
															<ul class="pagination">
																<li class="page_unselect"><a
																	onclick="listbox_moveacrossright('group_names','group_name')">&lt;&lt</a></li>
															</ul> <%-- <input type="submit" value="<<"" onclick="listbox_moveacross('group_names', 'group_name')"/> --%>
												</td>
												<td>
												<p>Participant Joined Groups</p>
												<select id="group_names" name="group_name"
													multiple="multiple" class="input_cmbbx1">
														<c:forEach items="${group}" var="group2"
															varStatus="status">

															<option value="${group2}" selected>${group2}</option>
														

														</c:forEach>
												</select> </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font>
																
																</td>
											</tr></table>
											
 

                  </td>
                </tr>
                
                
                
                </c:when><c:otherwise>
                
                 <div class="contentbox"> 
                
                  <table cellpadding="0" cellspacing="0" border="0" width="100%">       
             <tr>
           

    <td align="left" valign="top" width="50%" style="padding-right:25px;">
    <h2 class="quck-txt">Quick Info</h2>
         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name :</td>
                  <input type="hidden" class="input_txtbx1" id="inp_id" value="${addparticipants.participants_id }" name="participants_id" />
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.fname }" name="fname" /></br><span class="err"><form:errors path="participant.fname"></form:errors></span></td>
                </tr>

		
                <input type="hidden" class="input_txtbx1" id="inp_id" name="username" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.username }"/></br><font color="Red" size="+1"><span class="err"></font>
               
		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Mobile No :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="mno" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.mobile_num}" name="mobile_num" /></br><font color="Red" size="+1"><span class="err"><c:if test="${mobile_exists ==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number already exists </font>	<br/></c:if> <font
													color="Red" size="+1"><span id="spnmno">   <form:errors path="participant.mobile_num"></form:errors></span> </font></td>
                </tr> 
		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Email-Id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.email_id}" name="email_id" /></br><font
													color="Red" size="+1"><span id="spnlname"><c:if test="${email_exist ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>Email already exists </font>	<br/></c:if><form:errors path="participant.email_id"></form:errors></span> </font></td>
                </tr> 

		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"> Gender :</td>
                  <td valign="top" align="left" class="input_txt">
                  <input type="radio" name="gender" value="0"  class="input_txt" <c:if test="${addparticipants.gender=='0'}"><c:out value="checked=checked"/></c:if>>Male&nbsp;&nbsp;&nbsp;  
                  <input type="radio" name="gender" value="1"  class="input_txt" <c:if test="${addparticipants.gender=='1'}"><c:out value="checked=checked"/></c:if>> Female</td>
                </tr>
		 <tr class="row2">
                 <td valign="middle" align="left" class="input_txt"> Age :</td>
                 <td valign="top" align="left" class="input_txt"><select name="age" class="input_cmbbx1">
                 <option value="" <c:if test="${addparticipants.age=='Below 12'}"><c:out value="selected"/></c:if>>Below 12</option>
                 <option value="12-20 years" <c:if test="${addparticipants.age=='12-20 years'}"><c:out value="selected"/></c:if>>12-20 &#160 years</option>
                 <option value="20-30 years" <c:if test="${addparticipants.age=='20-30 years'}"><c:out value="selected"/></c:if>>20-30 &#160 years</option>
                 <option value="30-40 years" <c:if test="${addparticipants.age=='30-40 years'}"><c:out value="selected"/></c:if>>30-40 &#160 years</</option>                  
                 <option value="40-50 years" <c:if test="${addparticipants.age=='40-50 years'}"><c:out value="selected"/></c:if>>40-50 &#160 years</option>
                 <option value="50-60 years"  <c:if test="${addparticipants.age=='50-60 years'}"><c:out value="selected"/></c:if>>50-60 &#160 years</option>
                 <option value="60-70 years" <c:if test="${addparticipants.age=='60-70 years'}"><c:out value="selected"/></c:if>>60-70 &#160 years</option>
                 <option value="70-80 years" <c:if test="${addparticipants.age=='70-80 years'}"><c:out value="selected"/></c:if>>70-80 &#160 years</option>
                 <option value="80-90 years" <c:if test="${addparticipants.age=='80-90 years'}"><c:out value="selected"/></c:if>>80-90 &#160 years</option>
                   <option value="90-100 years" <c:if test="${addparticipants.age=='90-100 years'}"><c:out value="selected"/></c:if>>90-100 years</option>
                  
                  </select><%-- <input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.age}" name="age" /></br><span class="err"><form:errors path="participant.age"></form:errors></span> --%></td>
                </tr>
		
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"> City :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.city}" name="city"/></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.city"></form:errors></span> </font></td>
                </tr>
		 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"> Education :</td>
                  <td valign="top" align="left" class="input_txt"><select name="education" class="input_cmbbx1">
                    <option value="School" <c:if test="${addparticipants.education=='School'}"><c:out value="selected"/></c:if>>School</option>
			<option value="Some College" <c:if test="${addparticipants.education=='Some College'}"><c:out value="selected"/></c:if> >Some College</option>
			<option value="Professional Degree" <c:if test="${addparticipants.education=='Professional Degree'}"><c:out value="selected"/></c:if>>Professional Degree</option>
			<option value="Master Degree" <c:if test="${addparticipants.education=='Master Degree'}"><c:out value="selected"/></c:if>>Master Degree</option>
                   </select></td>
                </tr>         
  
              
            <tr class="row1">
                  <td valign="top" align="left" class="input_txt"> Medical Details :</td>
                  <td valign="top" align="left" class="input_txt"><textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 220px; height: 89px;" name="medical_details"/>${addparticipants.medical_details }</textarea></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.medical_details"></form:errors></span></font></td></tr>
               
</table></td>
  <td align="left" valign="top"> 
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr><td><p class="quck-txt">Preferred&nbsp;Timings
</p></td></tr>


<tr class="row2">
												<td valign="middle" align="left" class="input_txt">
													 Time1:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
												<option value="null" <c:if test="${addparticipants.time1=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
					  <option value="00-01" <c:if test="${addparticipants.time1=='00-01'}"><c:out value="selected"/></c:if>>00-01</option>
                   <option value="01-02"  <c:if test="${addparticipants.time1=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${addparticipants.time1=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${addparticipants.time1=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${addparticipants.time1=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${addparticipants.time1=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${addparticipants.time1=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${addparticipants.time1=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${addparticipants.time1=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${addparticipants.time1=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
					<option value="10-11"  <c:if test="${addparticipants.time1=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${addparticipants.time1=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${addparticipants.time1=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${addparticipants.time1=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${addparticipants.time1=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${addparticipants.time1=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${addparticipants.time1=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${addparticipants.time1=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${addparticipants.time1=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${addparticipants.time1=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${addparticipants.time1=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${addparticipants.time1=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${addparticipants.time1=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${addparticipants.time1=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   
															
												</select><br/>
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt">
													 Time2:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time2" class="input_cmbbx1" id="msg">
														<option value="null" <c:if test="${addparticipants.time2=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
                   <option value="00-01" <c:if test="${addparticipants.time2=='00-01'}"><c:out value="selected"/></c:if>>00-01</option>
                   <option value="01-02"  <c:if test="${addparticipants.time2=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${addparticipants.time2=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${addparticipants.time2=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${addparticipants.time2=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${addparticipants.time2=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${addparticipants.time2=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${addparticipants.time2=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${addparticipants.time2=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${addparticipants.time2=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
					<option value="10-11"  <c:if test="${addparticipants.time2=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${addparticipants.time2=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${addparticipants.time2=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${addparticipants.time2=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${addparticipants.time2=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${addparticipants.time2=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${addparticipants.time2=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${addparticipants.time2=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${addparticipants.time2=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${addparticipants.time2=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${addparticipants.time2=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${addparticipants.time2=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${addparticipants.time2=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${addparticipants.time2=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   										
												</select><br/>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt">
													 Time3:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
														<option value="null" <c:if test="${addparticipants.time3=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
                   <option value="01-02"  <c:if test="${addparticipants.time3=='01-02'}"><c:out value="selected"/></c:if>>01-02</option>
				   <option value="02-03" <c:if test="${addparticipants.time3=='02-03'}"><c:out value="selected"/></c:if>>02-03</option>
				   <option value="03-04" <c:if test="${addparticipants.time3=='03-04'}"><c:out value="selected"/></c:if>>03-04</option>
				   <option value="04-05" <c:if test="${addparticipants.time3=='04-05'}"><c:out value="selected"/></c:if>>04-05</option>
				   <option value="05-06" <c:if test="${addparticipants.time3=='05-06'}"><c:out value="selected"/></c:if>>05-06</option>
				   <option value="06-07" <c:if test="${addparticipants.time3=='06-07'}"><c:out value="selected"/></c:if>>06-07</option>
				   <option value="07-08"  <c:if test="${addparticipants.time3=='07-08'}"><c:out value="selected"/></c:if>>07-08</option>
					<option value="08-09" <c:if test="${addparticipants.time3=='08-09'}"><c:out value="selected"/></c:if>>08-09</option>
					<option value="09-10" <c:if test="${addparticipants.time3=='09-10'}"><c:out value="selected"/></c:if>>09-10</option>
					<option value="10-11"  <c:if test="${addparticipants.time3=='10-11'}"><c:out value="selected"/></c:if>>10-11</option>
					<option value="11-12" <c:if test="${addparticipants.time3=='11-12'}"><c:out value="selected"/></c:if>>11-12</option>
					<option value="12-13"  <c:if test="${addparticipants.time3=='12-13'}"><c:out value="selected"/></c:if>>12-13</option>
					<option value="13-14" <c:if test="${addparticipants.time3=='13-14'}"><c:out value="selected"/></c:if>>13-14</option>
				    <option value="14-15" <c:if test="${addparticipants.time3=='14-15'}"><c:out value="selected"/></c:if>>14-15</option>
				  <option value="15-16" <c:if test="${addparticipants.time3=='15-16'}"><c:out value="selected"/></c:if>>15-16</option>
				<option value="16-17"  <c:if test="${addparticipants.time3=='16-17'}"><c:out value="selected"/></c:if>>16-17</option>
				<option value="17-18" <c:if test="${addparticipants.time3=='17-18'}"><c:out value="selected"/></c:if>>17-18</option>
			    <option value="18-19" <c:if test="${addparticipants.time3=='18-19'}"><c:out value="selected"/></c:if>>18-19</option>
				<option value="19-20" <c:if test="${addparticipants.time3=='19-20'}"><c:out value="selected"/></c:if>>19-20</option>
				<option value="20-21"  <c:if test="${addparticipants.time3=='20-21'}"><c:out value="selected"/></c:if>>20-21</option>
				<option value="21-22"  <c:if test="${addparticipants.time3=='21-22'}"><c:out value="selected"/></c:if>>21-22</option>
				<option value="22-23" <c:if test="${addparticipants.time3=='22-23'}"><c:out value="selected"/></c:if>>22-23</option>
				<option value="23-00" <c:if test="${addparticipants.time3=='23-00'}"><c:out value="selected"/></c:if>>23-00</option>
                   	
                   
															
												</select><br/>
												</td>
											</tr>
				<tr>
				
				<td><p class="quck-txt">Group</p></td></tr>

<tr class="row1"><td colspan="2"><p style=" line-height: 18px; padding: 1px 0pt; text-align: justify"><span class="err">*</span>Group is the internal classification for the better understanding of Participant's Demographics.<a href="#" onclick="javascript:CreateGroup()">[Create New Group]</a></p></td></tr>
                
                
                

<%-- 



    <tr class="row1">
                  <td valign="top" align="left" class="input_txt">Select Group :</td>
                  <td valign="top" align="left" class="input_txt">
                  <select name="group_name">
                  <c:forEach items="${group}" var="participantGroups" varStatus="status">
			                   <option value="${participantGroups}" >${participantGroups}</option>
			                   </c:forEach>
                  
                  </select>
                  
                  
                  </br><font color="Red" size="+1"><span class="err"></span></font></td>
                </tr>     --%>        
 </table>
 

											<table>
											<tr class="row2" >
												<td><span class="err">*</span> Select Group:</td>
												<td class="input_txt">
                                                    <p>Provider Groups</p>
													<select class="input_cmbbx2"
													 multiple="multiple" id="group_name">
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select>
												</td>
												<td>
												<td>
													<ul class="pagination">
														<li class="page_unselect"><a 
															onclick="listbox_moveacross('group_name','group_names')">&gt;&gt;</a>
															</li></ul>

															<!-- input type="submit" value=">>" onclick=""/> --> </br>
															<ul class="pagination">
																<li class="page_unselect"><a
																	onclick="listbox_moveacrossright('group_names','group_name')">&lt;&lt</a></li>
															</ul> <%-- <input type="submit" value="<<"" onclick="listbox_moveacross('group_names', 'group_name')"/> --%>
												</td>
												<td>
												<p>Participant Joined Groups</p>
												<select id="group_names" name="group_name"
													multiple="multiple" class="input_cmbbx1">
														<c:forEach items="${group}" var="group2"
															varStatus="status">

															<option value="${group2}" selected>${group2}</option>
														

														</c:forEach>
												</select> </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font>
																
																</td>
											</tr></table>
											
 

                  </td>
                </tr>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                </c:otherwise></c:choose>        
                
                
                </table>
                 <table align="right">
                 <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn2" value="Update Participant" onclick="return validate(this)"></td>
                <td valign="middle" style="padding-left:10px;" ><a href="viewparticipants" class="submit_btn" style="color:white ;font-size:14px;text-decoration: none;">Cancel</a>
               
                </tr>
              </table>
         
              
              </td>
  </tr>



</table>
             
           </div> </div></form>

      

<jsp:include page="footer.jsp"></jsp:include>