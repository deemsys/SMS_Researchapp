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
          <%--    <c:set value="${participantsDetailsForm.participantsDetails}" var="participantsDetails"/>
          --%>  
              
              <h2>Response Details&nbsp;&nbsp;&nbsp;</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
            
            
            
   <%--            <c:forEach items="${currentuser.participantsDetails}" var="currentuser" varStatus="status">
   --%>          <%--  <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Current User: </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                 <td width="84%" valign="top" align="left" >${currentuser.adminuser[0].admin_username}</td>
                </tr>  --%>
          <%--   </c:forEach>  
          --%>      
             <c:forEach items="${participantAnswersForm.participantAnswers}" var="participantAnswers" varStatus="status">
             <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Date </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers.attend_date}</td>
             </tr>
             
                   <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Question 1 </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers.question1}</td>
             </tr>
		<tr class="row2">
                  <td width="15%" valign="middle" align="left" > Answer </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers.answer1}</td>
                </tr>
		<tr class="row1">
                  <td width="15%" valign="middle" align="left" > Question 2 </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers.question2}</td>
                </tr>
              <tr class="row2">
                   <td width="15%" valign="middle" align="left" > Answer </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers.answer2}</td>
                  
                </tr><tr class="row1">
                  <td width="15%" valign="middle" align="left" > Question 3 </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers.question3}</td>
                </tr>
              <tr class="row2">
                   <td width="15%" valign="middle" align="left" > Answer </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers.answer3}</td>
                  
                </tr>
              <tr class="row1">
              
              <td colspan="2" width="50%" valign="middle" align="right" > <!-- <a style="text-decoration: none;" class="paging_select" href="welcome"> --><input type="button" value="Back" onclick="goBack()" class="submit_btn"/><!-- </a> -->
              </td>
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
          </div>
         

<script>
function goBack()
  {
  window.history.back();
  }
</script>



<jsp:include page="footer.jsp"></jsp:include>