<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">



<form method="post" action="">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Adminuser Details</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
            
              
             <c:forEach items="${adminuserForm.adminuser}" var="adminuser" varStatus="status">
                   <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${adminuser.admin_username}</td>
                </tr>
              <tr class="row1">
                  <td width="15%" valign="middle" align="left" >E-Mail</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${adminuser.admin_email}</td>
                </tr>
		
		<tr class="row2">
                  <td width="15%" valign="middle" align="left" > Mobile</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${adminuser.admin_mobile}</td>
                </tr>
		<tr class="row1">
                  <td width="15%" valign="middle" align="left" >Admin_address </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${adminuser.admin_address}</td>
                </tr>
              
                   
								</c:forEach>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
              </table>
          
            </div>
          </div>
          </td>
      </tr>
      </table>
      </div>
</form>





<jsp:include page="footer.jsp"></jsp:include>