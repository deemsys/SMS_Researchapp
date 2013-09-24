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
              <h2>Participants Details</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
            
            
            
   <%--            <c:forEach items="${currentuser.participantsDetails}" var="currentuser" varStatus="status">
   --%>          <%--   <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Current User: </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                 <td width="84%" valign="top" align="left" >${currentuser.adminuser[0].admin_username}</td>
                </tr> --%>
          <%--   </c:forEach>  
          --%>      
             <c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
                   <tr class="row2">
                  <td width="15%" valign="middle" align="left" > First Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.fname}</td>
                </tr>
              <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Last Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.lname}</td>
                </tr>
		
		<tr class="row2">
                  <td width="15%" valign="middle" align="left" > Mobile Number </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.mobile_num}</td>
                </tr>
		<tr class="row1">
                  <td width="15%" valign="middle" align="left" > Email-Id </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.email_id}</td>
                </tr>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Gender </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                    
                    <c:choose>
                    <c:when test="${participantsDetails.gender==0}">
                     <td width="84%" valign="top" align="left" >Male</td>
                    </c:when>                
                    <c:when test="${participantsDetails.gender==1}">
                     <td width="84%" valign="top" align="left" >Female</td>
                    </c:when>
                    <c:otherwise>
                     <td width="84%" valign="top" align="left" >Transgender</td>
                    </c:otherwise>
                  </c:choose>
                  
                  
                </tr><tr class="row1">
                  <td width="15%" valign="middle" align="left" > City </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.city}</td>
                </tr>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Education </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.education}</td>
                </tr><tr class="row1">
                  <td width="15%" valign="middle" align="left" > Note</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.note}</td>
                </tr>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Medical Details </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.medical_details}</td>
                </tr><tr class="row1">
                  <td width="15%" valign="middle" align="left" > Messaging Frequency </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.messaging_frequency}</td>
                </tr>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Group Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.group_name}</td>
                </tr><tr class="row1">
                  <td width="15%" valign="middle" align="left" > Age</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.age}</td>
                </tr>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Date Of Join </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.date_of_join}</td>
                </tr>   
              
              
                      
              
              
              
              
              <%-- 
              
              
              
              
                 <tr>
        				         		<td valign="center" align="left" width="5%"><input type="checkbox" value="" name="check"></td>
					     		     	<td valign="top" align="left"  width="10%">${participantsDetails.fname}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.mobile_num}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.city}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.age}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.messaging_frequency}</td>
											<td>
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editparticipant?id=${participantsDetails.participants_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteparticipants?id=${participantsDetails.participants_id}"/>" onclick="return confirmation()">Remove</a></td>
											
								</tr>
							 --%>    	</c:forEach>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
              </table>
          
            </div>
          </div>
          </td>
      </tr>
      </table>
      </div>
</form>





<jsp:include page="footer.jsp"></jsp:include>