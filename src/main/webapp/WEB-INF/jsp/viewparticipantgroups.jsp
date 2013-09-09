<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>

<div id="right_content">
	<form name="grid" onSubmit="return validate(this)" action="" method="POST">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
    	<tr>
			<td valign="top" align="left" style="padding:5px 0 10px 0;">
				<div class="del_div">
					<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deletegroup'" /></label></p>
          		</div>
			</td>
		</tr>
		<tr>
        	<td valign="top" align="left" style="padding:5px 0 10px 0;">
				<div class="status success">
            		<p class="closestatus"><a title="Close" href="">x</a></p>
            		<p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output> $smarty.session.adduser_new</AJDF:output></span> .</p>
          		</div>
				<div class="status error">
            		<p class="closestatus"><a title="Close" href="">x</a></p>
            		<p><img alt="Error" src="images/icons/icon_error.png"><span><AJDF:output>$smarty.session.deletepart</AJDF:output></span> .</p>
          		</div>
				<div class="status success">
            		<p class="closestatus"><a title="Close" href="">x</a></p>
            		<p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output> $smarty.session.upuser_new</AJDF:output></span> .</p>
          		</div>
			</td>
      	</tr>
      	<tr>
        	<td valign="top" align="left">
        		<div>
	            	<div class="headings altheading">
	              		<h2>View Groups</h2>
	            	</div>
	            	<div class="contentbox">
	            		<table cellpadding="0" cellspacing="0" border="0" width="100%">
	                		<tr class="title">
								<td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td>
	                  			<td valign="top" align="left" width="10%">Group&nbsp;Name</td>
	                  			<td valign="top" align="left" width="15%">Description</td>
	                  			<td valign="top" align="left" width="10%">DOF</td>
			  					<td valign="top" align="left" width="10%">DOT</td>
	                  			<td valign="top" align="left" width="15%">Education</td>
	                  			<td valign="top" align="left" width="25%">Action</td>
	                		</tr>
						</table>
					</div>
				</div>
			</td>
		</tr>
	</table>
	</form>
</div>
<script>
function confirmation(val) {

	var answer = confirm("Are You Sure Want To Delete Group")
	if (answer){
		window.location = "?do=deletegroup&id="+val; 
	}
	else{
		
	}
}
</script>

<script language="javascript">

function selectall(field)
{
	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}

function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
return true;
}
</script>
<jsp:include page="footer.jsp"></jsp:include>