<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />"
	rel="stylesheet" type="text/css" />
<div class="logo">
				<a href="#"><img src="<c:url value="/resources/images/logo.png" />" alt="Company Logo" /></a>
			</div>


<head>
</head>
<script type="text/javascript">
function validate()
{
var password1=document.getElementById("pass1");
var password2=document.getElementById("pass2");


if(password1.value == password2.value)
{
    return true;
}

else {
    alert("Passwords Do Not Match!");	
    return false;
}
}
</script>

<form method="POST" action="registerprovider" modelAttribute="adminuser">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
                      
                      
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
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Register Provider</h2>
            </div>
            <div class="contentbox">
            <c:choose>
						<c:when test="${empty admin}">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              
                             <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>First Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_firstname" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="adminuser.admin_firstname"></form:errors></span></td>
                </tr>
		
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>User Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_username" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><c:if test="${user_exists==true}"><c:out value="user already exist"/></c:if><form:errors path="adminuser.admin_username"></form:errors></span></td>
                </tr>
                <%-- <tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="admin_password" class="input_txtbx" id="pass1" value="" /></br><span class="err"><form:errors path="adminuser.admin_password"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Retype password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="repassword" class="input_txtbx" id="pass2" value="" /></br><span class="err" id="spnsub_pass"></span></td>
                </tr> --%>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Mobile :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_mobile" class="input_txtbx" id="inp_id" value="" /><br><span class="err"><c:if test="${mobile_exists==true}"><c:out value="mobile number  already exist"/></c:if><form:errors path="adminuser.admin_mobile"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> E-mail :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_email" class="input_txtbx" id="inp_id" value="" /><br><span class="err"><c:if test="${email_exist==true}"><c:out value="Email Id  already exist"/></c:if><form:errors path="adminuser.admin_email"></form:errors></span></td>
                </tr>
		
</td>
                </tr>
                 
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Register" class="submit_btn">  <span id="spnsub"></span></td>
              </tr>
              </table>
              </c:when>
              <c:otherwise>
              
               <table cellpadding="0" cellspacing="0" border="0" width="100%">
              
                             <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>First Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_firstname" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${admin.admin_firstname}" /></br><span class="err"><form:errors path="adminuser.admin_firstname"></form:errors></span></td>
                </tr>
		
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>User Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_username" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${admin.admin_username}" /></br><span class="err"><c:if test="${user_exists==true}"><c:out value="user already exist"/></c:if><form:errors path="adminuser.admin_username"></form:errors></span></td>
                </tr>
                <%-- <tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="admin_password" class="input_txtbx" id="pass1" value="" /></br><span class="err"><form:errors path="adminuser.admin_password"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Retype password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="repassword" class="input_txtbx" id="pass2" value="" /></br><span class="err" id="spnsub_pass"></span></td>
                </tr> --%>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Mobile :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_mobile" class="input_txtbx" id="inp_id" value="${admin.admin_mobile}" /><br><span class="err"><c:if test="${mobile_exists==true}"><c:out value="mobile number  already exist"/></c:if><form:errors path="adminuser.admin_mobile"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> E-mail :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_email" class="input_txtbx" id="inp_id" value="${admin.admin_email}" /><br><span class="err"><c:if test="${email_exist==true}"><c:out value="Email Id  already exist"/></c:if><form:errors path="adminuser.admin_email"></form:errors></span></td>
                </tr>
		
</td>
                </tr>
                 
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Register" class="submit_btn">  <span id="spnsub"></span></td>
              </tr>
              </table>
              
              
              
              </c:otherwise>
              </c:choose>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
</html>
      <jsp:include page="footer.jsp"></jsp:include>
