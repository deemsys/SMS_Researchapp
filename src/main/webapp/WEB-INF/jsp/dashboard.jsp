<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<div id="right_content">
	<form action="viewpageparticipants?page=1" name="dashboard" method="GET">
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">

			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Participants Stat</h2>
						</div>
						<div class="contentbox">
						<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" id="su" >

    <c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="welcome">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
      
      </table>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
				
								<tr class="title">
									<td valign="top" align="left" width="10%">First&nbsp;Name</td>
									<td valign="top" align="left" width="15%">Mobile Number</td>
									<td valign="top" align="left" width="10%">City</td>
									<td valign="top" align="left" width="10%">Age</td>
									<td valign="top" align="left" width="15%">Associated&nbsp;Streams</td>
									<td valign="top" align="left" width="15%">Education</td>
									<td valign="top" align="left" width="15%">Date Of Join</td>
								</tr>

								<!-- Display Admin Userd here  Suresh--> 
									<c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
							       		<tr class="row1" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left"  width="10%">${participantsDetails.fname}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.mobile_num}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.city}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.age}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.messaging_frequency}</td>
											<td valign="top" align="left" width="15%">${participantsDetails.education}</td>
											<td valign="top" align="left" width="16%">${participantsDetails.date_of_join}</td>
										</tr>
							    	</c:forEach>
						    	
<tr><td colspan="7">  <div class="extrabottom">
              <ul class="pagination">
              <% int i=1;int j=0;
             /* String value=request.getParameter("page");
             int prev=Integer.parseInt(value);
             int next=prev+1; */
              %> 
               <li class="page"><a href="viewparticipant_page?page=3" class="paging_unselect">Prev</a></li> 
             <c:forEach var="count" begin="1" end="${noofrows}"> 
                 <%if(i%5==0)
            	  {%>
                                       
                <li><li class="page"><a href="viewparticipant_page?page=<%=j+1%>" class="paging_select"><%=j+1%></a></li>
                
              <%
              j=j+1;
            	  }
            
              i=i+1;%>
               </c:forEach> 
               <li class="page"><a href="viewparticipant_page?page=4" class="paging_unselect">Next</a></li> 
               
             <li class="page"><a href="viewall" class="paging_select">ViewAll</a></li> 
                </ul></div></td></tr>

								<!-- <tr><td colspan="7">  <div class="extrabottom">
								
              						<ul class="pagination">
              						
                						<li class="text"><a href="viewparticipant_page?page=1" class="submit_btn"></li>
                						<li class="text"></li>
                					</ul></div></td></tr> -->

								</table>

								<div style="clear: both;"></div>
								</div>
								</div>
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
								
							</table>
							</form>
						</div>
<jsp:include page="footer.jsp"></jsp:include>