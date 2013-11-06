<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<form action="updatestream" method="POST">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Edit Stream</h2>
            </div>
            <div class="contentbox">
            <c:set value="${streamForm.streamDetails[0]}" var="streamDetails"/>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
             
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="200" width="30%">Stream Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="streamId" value="${streamDetails.streamId}"></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Stream Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="streamName" class="input_txtbx" id="inp_id3" value="${streamDetails.streamName}" />
                  <span><Form:errors path="streamDetails.streamName"></Form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Description :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea name="description" class="input_txtarea"  rows="5" cols="" id="inp_id5" value="${streamDetails.description}"/></textarea></br><span class="err"><Form:errors path="streamDetails.description"></Form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Message 1 :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtarea" name="message[]" rows="5" cols="" id="inp_id5" /></textarea> </br><span class="err"></span></td>
                </tr></table><div id="multichoice"></div><table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
		<table width="100%">
                 <tr class="row1">
                  <td valign="center" align="right" width="30%" > <p style="width:180px;"><a href="javascript:void(0);" onclick="addMultichoice('multichoice');" style="text-decoration:none;" ><input type="button" value="Add one more Message" class="submit_btn2" name="" /></a></p> </td>
		<td valign="top" align="right" width="30%" > <div style="float:center; padding:0px 75% 0px 0px;"> <input type="submit" value="Update Stream" class="submit_btn1" name="insert" /> </div></td>
                </tr>
              </table>
             
              <div style="clear: both;"></div></div>
            </div>
         </td>
      </tr>
 

</table>
</div>
</form>
<jsp:include page="footer.jsp"></jsp:include>

