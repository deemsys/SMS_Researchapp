<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="header.jsp"></jsp:include>
<form action="insertstream" method="post">
	<div id="right_content">
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">
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
				</td>
			</tr>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Create Stream</h2>
						</div>
						<div class="contentbox">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="row1">
									<td valign="middle" align="right" class="input_txt" width="200"
										width="30%">Stream Id :</td>
									<td valign="top" align="left" class="input_txt" width="70%">${currentstream}<input
										type="hidden" name="streamId" value="${currentstream}"></td>
								</tr>
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt" width="30%"><span
										class="err">*</span> Stream Name :</td>
									<td valign="top" align="left" class="input_txt" width="70%"><input
										type="text" name="streamName" class="input_txtbx" id="inp_id3"
										onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"
										value=" " /></br> <span class="err"><form:errors path="streamdetails.streamName"></form:errors>
										</span></td>
								</tr>
								<tr class="row1">
									<td valign="middle" align="right" class="input_txt" width="30%"><span
										class="err">*</span> Description :</td>
									<td valign="top" align="left" class="input_txt" width="70%"><textarea
											name="description" class="input_txtarea" rows="5" cols=""
											id="inp_id4" onmouseover="showTooltip('tooltip_id','inp_id4');"
											onmouseout="hideTooltip('tooltip_id');" /></textarea></br> <span class="err">
											<form:errors path="streamdetails.description"></form:errors></span></td>
								</tr>
								<tr class="row2">
									<td valign="middle" align="right" class="input_txt" width="30%"><span
										class="err">*</span> Message 1 :</td>
									<td valign="top" align="left" class="input_txt" width="70%"><textarea
											class="input_txtarea" name="message[]" rows="5" cols=""
											id="inp_id5" onmouseover="showTooltip('tooltip_id','inp_id5');"
											onmouseout="hideTooltip('tooltip_id');"/></textarea> </br> <span class="err">
											<form:errors path="streamdetails.message_count"></form:errors></span></td>
								</tr>
							</table>
							<div id="multichoice"></div>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
							<table width="100%">
								<tr class="row1">
									<td valign="center" align="right" width="30%">
										<p style="width: 180px;">
											<a href="javascript:void(0);"
												onclick="addMultichoice('multichoice');"
												style="text-decoration: none;"><input type="button"
												value="Add one more Message" class="submit_btn2" name="" /></a>
										</p>
									</td>
									<td valign="top" align="right" width="30%">
										<div style="float: center; padding: 0px 75% 0px 0px;">
											<input type="submit" value="Save Stream" class="submit_btn1" />
										</div>
									</td>
								</tr>
							</table>

							<div style="clear: both;"></div>
						</div>
					</div>
					</div></td>
			</tr>
			</form>


			<script type="text/javascript">
				var $im = 1;
				var flagm = 1;
				function addMultichoice(divName) {
					var xx = document.getElementsByName('message[]').length;
					var $in = xx + 1;

					var newdiv = document.createElement('div');

					newdiv.innerHTML = '<table width="100%" border="0" cellspacing="0" cellpadding="0" id="newtbl'
							+ $im
							+ '"><tr class="row2"><td valign="middle" align="right" class="input_txt" width="30%">Message '
							+ $in
							+ ' :</td><td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtarea" name="message[]" rows="5" cols="" id="inp_id5" ></textarea></td></tr><tr class="row1"><td align="right" valign="top">&nbsp;</td><td align="left" valign="top"><a javascript:void(0);" onclick="removechoice('
							+ $im
							+ ')" style="text-decoration:none;"><input type="submit" class="submit_btn" value="CANCEL"  /></a></td></tr></table>';
					document.getElementById(divName).appendChild(newdiv);
					$im++;
					flagm++;

				}
				function removechoice(id) {
					id = 'newtbl' + id;
					var child = document.getElementById(id)
					var parentDiv = child.parentNode;
					parentDiv.removeChild(child);

				}
			</script>

			<jsp:include page="footer.jsp"></jsp:include>