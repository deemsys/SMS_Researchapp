<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<form name="grid" onSubmit="return validate(this)" action="" method="POST">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr><td valign="top" align="left" style="padding:5px 0 10px 0;">
<div class="del_div">
             
            <p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deletestream'" /></label></p>

          </div>
</td></tr>

        <td valign="top" align="left" style="padding:5px 0 10px 0;">
		
		<!-- <div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"></p>
          </div>
		<div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span></p>
          </div>
		<div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"></p>
          </div> -->
</td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>View Stream</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="title">
		<td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td>
                  <td valign="top" align="left" width="10%">Stream ID</td>
		<td valign="top" align="left" width="15%">Name</td>
		<td valign="top" align="left" width="15%">Description</td>
                  <td valign="top" align="left" width="15%">No of Messages</td>
                  <td valign="top" align="left" width="15%">Created By</td>
		  <td valign="top" align="center" width="25%">Action</td>
<!--<AJDF:output>if $smarty.session.prive.1 !='' || $smarty.session.prive.2 !=''</AJDF:output>
                  <td valign="top" align="center" width="25%">Action</td>
<AJDF:output>else</AJDF:output>
 <td valign="top" align="center" width="25%"></td>
<AJDF:output>/if</AJDF:output>-->

                </tr></table>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="user_ajax">

              </table>
            </div>
          </div></td>
      </tr>
     
</form>
<script type="text/javascript">
function streamdelete(str) {

	var answer = confirm("Are you sure want to delete this Stream?")
	if (answer){
		window.location = "?do=deletestream&streamid="+str;
	}
	else{
// 		alert("Thanks for sticking around!")
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
