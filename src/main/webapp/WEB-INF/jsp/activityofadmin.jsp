<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>

<div id="right_content">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
    	<tr>
        	<td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;&nbsp;</td>
      	</tr>
      	<tr>
        	<td valign="top" align="left">
	        	<div>
	            	<div class="headings altheading">
	              		<h2>User Activity Logs</h2>
	            	</div>
	            	<div class="contentbox">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td width="30%" align="right"><b>User Name</b></td>
								<td width="10%" align="center"><b>:</b></td> 
								<td align="left" width="60%"><b><AJDF:output>$ad_name</AJDF:output></b></td>
							</tr>
							<tr><td width="30%" align="right" colspan="3">&nbsp;</td>
							</tr>
						</table>
	              		<table cellpadding="0" cellspacing="0" border="0" width="100%">
	                		<tr class="title">
	                  			<td valign="top" align="center" width="15%">Date & Time</td>
	                  			<td valign="top" align="left" width="15%">&nbsp;&nbsp;&nbsp;&nbsp;IP</td>
	                  			<td valign="top" align="left" width="70%">Actvity</td>
	                		</tr>
	                	</table>
	                </div>
	       		</div>
       		</td>
		</tr>
	</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
