<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" url="resources/js/jquery.js" />
	<script src="/BePhitResearchApp/resources/js/jquery.js"></script>
<script type="text/javascript">
$(window).load(function(){
var oldValue = "";
$("#textingcontacts").keyup(function() {
	$("#tc").html('');
	var intRegex = /^\d+$/;
	if(intRegex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();
		var $newdiv="";
	  var $i=0;
			
		var newdiv="";
			for($i=1;$i<=$in;$i++)
				{
				
			newdiv =newdiv+'<table width="100%" border="0" cellspacing="0" cellpadding="0" id="newtbl'+$i+'"><tr class="row2"><td valign="middle" align="right" class="input_txt" width="30%">Message '+$i+' :</td><td valign="top" align="left"  class="input_txt" width="70%"><textarea id="message'+$i+'"  class="input_txtarea" name="message[]" rows="5" cols="" ></textarea></td></tr><tr class="row1"><td align="right" valign="top">&nbsp;</td><td align="left" valign="top"></td></tr></table>';
			 
			
				}
			
			$("#result").html(newdiv);
			$("#tc").html('');
	  
	}
	else if($(this).val()!='')
		{
		
		$("#tc").html('"<br>" Kindly give numbers only!!');
		}
}).keydown(function() {
    oldValue = $(this).val();
})
});
</script>

<!-- <a javascript:void(0);" onclick="removechoice('+$im+')" style="text-decoration:none;"><input type="submit" class="submit_btn" value="CANCEL"  /></a> -->



<form action="insertstream" method="post">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Create Stream</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="200" width="30%">Stream Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${currentstream}<input type="hidden" name="streamId" value="${currentstream}"></td>
                </tr>
                <tr class="row2">
              
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Stream Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="streamName" class="input_txtbx" id="streamName"/></br> <span id="sn" class="err"><form:errors path="streamDetails.streamName"></form:errors></span></td>
                </tr>
                         
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>No of Messages:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">   
<input id="textingcontacts" name="textingcontacts" class="input_txtbx" width="70%" type="text"/><!-- <input type="text" name="textingcontacts" class="input_txtbx" id="textingcontacts"/></br> --> <span id="tc" class="err"><br><form:errors path="streamDetails.textingcontacts"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Description :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea name="description" class="input_txtarea"  rows="5" cols="" id="description"/></textarea></br><span id="des" class="err"><form:errors path="streamDetails.description"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <!-- <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Message 1 :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtarea" name="message[]" rows="5" cols="" id="message" /></textarea><br><span id="mes" class="err"></span></br></td>
              -->   
              <td valign="middle" align="right" colspan="2" class="input_txt">
              <div id="result">
                   </div></td>
                   
              </tr></table><div id="multichoice"></div><table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
		<table align="left">
                <tr>
	                  <td valign="top" align="right"></td><!-- <a href="javascript:void(0);" onclick="addMultichoice('multichoice');" style="text-decoration:none;" ><input type="button" value="Add one more Message" class="submit_btn2" name="" /></a> --></p> </td>
		 <td valign="top" align="left"><div style="float:center; padding:0px 0px 0px 450px;"><input type="submit" value="Save Stream" class="submit_btn1" onclick="return validate()"/> </div></td>
                </tr>
              </table>
            
              <div style="clear: both;"></div></div>
            </div>
          </div></td>
      </tr></form>
 

<script type="text/javascript">
var $im=1;
var flagm=1;
function addMultichoice(divName)
{
var xx=document.getElementsByName('message[]').length;
var $in = xx+1;

	
	var newdiv = document.createElement('div');

	newdiv.innerHTML = '<table width="100%" border="0" cellspacing="0" cellpadding="0" id="newtbl'+$i+'"><tr class="row2"><td valign="middle" align="right" class="input_txt" width="30%">Message '+$in+' :</td><td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtarea" name="message[]" rows="5" cols="" id="inp_id5" ></textarea></td></tr><tr class="row1"><td align="right" valign="top">&nbsp;</td><td align="left" valign="top"></td></tr></table>';
	document.getElementById(divName).appendChild(newdiv);
	$im++;
	flagm++;

	}
	function removechoice(id)
	{
		id='newtbl'+id;
		var child = document.getElementById(id);
		var parentDiv = child.parentNode;
		parentDiv.removeChild(child);

	
	}
	function validate()
	{
	
	var str=document.getElementById("streamName").value;
	var tc=document.getElementById("textingcontacts").value;
	var des=document.getElementById("description").value; 
	var mes=document.getElementById("message").value;
	var mes121=document.getElementById("message2").value;
	var intRegex = /^\d+$/;
	if(intRegex.test(text)||tc=="" ) 
	{
		return false;
	}
	
	if(mes=="")
		{
		document.getElementById("mes").innerHTML="Required Field Should Not be empty";
		return false;
		}
	else if(str=="")
		{
	    document.getElementById("str").innerHTML="Required Field Should not be blank";
		return false;
		}
	else if(tc=="")
		{
		document.getElementById("tc").innerHTML="Required Field Should Not be empty";
		}
	else if(des=="")
		{
		 document.getElementById("des").innerHTML="Required Field Should not be blank";
		 return false;
		}
			return true;
			}
</script>

<jsp:include page="footer.jsp"></jsp:include>

