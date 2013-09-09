<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<form method="post" action="?do=inserttxtmsg">

	<div id="right_content">
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
        		<td valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="status success">
            			<p class="closestatus"><a title="Close" href="">x</a></p>
            			<p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output> $smarty.session.msg</AJDF:output></span> .</p>
          			</div>
          		</td>
      		</tr>
      		<tr>
        		<td valign="top" align="left">
	        		<div>
	            		<div class="headings altheading">
	              			<h2>Text Message API Setting</h2>
	            		</div>
	            		<div class="contentbox">
	              			<table cellpadding="0" cellspacing="0" border="0" width="100%">
	                			<tr class="row1">
	                  				<td valign="top" align="left" class="input_txt" colspan="2"><img src="images/twillo.jpg" width="150px"></td>
	                			</tr>
				                <tr class="row2">
				                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> ACCOUNT SID  :</td>
				                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="asid" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$reco.account_sid</AJDF:output>" /></br><span class="err"><AJDF:output>$errmsg.asid</AJDF:output></span></td>
				                </tr>
								<tr class="row1">
				                	<td valign="middle" align="right" class="input_txt"><span class="err">*</span> AUTH TOKEN :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" name="token" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$reco.auth_token</AJDF:output>" /></br><span class="err"><AJDF:output>$errmsg.token</AJDF:output></span></td>
				                </tr>
								<tr class="row2">
				                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> NUMBER :</td>
				                  <td valign="top" align="left" class="input_txt"><input type="text" name="mnumber" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="<AJDF:output>$reco.mob_num</AJDF:output>" /></br><span class="err"><AJDF:output>$errmsg.mnumber</AJDF:output></span></td>
	                			</tr>
	                 			<tr class="row1">
	                  				<td valign="top" align="right">&nbsp;</td>
	                  				<td valign="top" align="left"><input type="submit" value="SAVE" class="submit_btn"></td>
	                			</tr>
	              			</table>
	            		</div>
	          		</div>
          		</td>
      		</tr>
		</table>
	</div>
</form>

<jsp:include page="footer.jsp"></jsp:include>