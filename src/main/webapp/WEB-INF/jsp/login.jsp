<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Login Page</title> 
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet"  type="text/css" />
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>


</head>
<script type="text/javascript">
function validate(form)
{
	var UserName = document.getElementById("user").value;
	var PassWord = document.getElementById("pass").value;
	
	if(UserName == "" && PassWord == "")
	{
	document.getElementById("spnsub").value="submit";
    document.getElementById("spnsub").innerHTML = "*Required Field cannot be blank";
    return false;
	}
	else if (UserName == null || UserName == "") {
          document.getElementById("spnuser").value="user name";
          document.getElementById("spnuser").innerHTML = "*User name is required";
        return false;
    }
 
	else if (PassWord == "" || PassWord == null ) {
		document.getElementById("spnpass").value="password";
        document.getElementById("spnpass").innerHTML = "*password is required";
    	
        return false;
	}
    return true;
}
</script>
<body onload='document.f.j_username.focus();'>
	<h3>Login with Username and Password (Custom Page)</h3>

	
	<script type="text/javascript">
	function validate(form)
	{
		var UserName = document.getElementById("user").value;
		var PassWord = document.getElementById("pass").value;
		
		if(UserName == "" && PassWord == "")
		{
		document.getElementById("spnsub").value="submit";
		 document.getElementById("spnuser").innerHTML = "*User name is required";
		 document.getElementById("spnpass").innerHTML = "*password is required";
       // document.getElementById("spnsub").innerHTML = "*Required Field cannot be blank";
        return false;
		}
		else if (UserName == null || UserName == "") {
	          document.getElementById("spnuser").value="user name";
	          document.getElementById("spnuser").innerHTML = "*User name is required";
	        return false;
	    }
	 
		else if (PassWord == "" || PassWord == null ) {
			document.getElementById("spnpass").value="password";
	        document.getElementById("spnpass").innerHTML = "*password is required";
	    	
	        return false;
		}
	    return true;
	}</script>
	<!-- <script type="text/javascript">
	function validate(form)
	{
		var UserName = document.getElementById("user").value;
		var PassWord = document.getElementById("pass").value;
		
		if(UserName == "" && PassWord == "")
		{
		document.getElementById("spnsub").value="submit";
        document.getElementById("spnsub").innerHTML = "*Required Field cannot be blank";
        return false;
		}
		else if ((UserName == null || UserName == "")&&(PassWord != "" || PassWord != null )) {
	          document.getElementById("spnuser").value="user name";
	          document.getElementById("spnpass").value="";
	          document.getElementById("spnuser").innerHTML = "*User name is required";
	          document.getElementById("spnsub").innerHTML = "";
	        return false;
	    }
	 
		else if ((PassWord == "" || PassWord == null )&&(UserName != null || UserName != "")) {
			document.getElementById("spnpass").value="password";
			 document.getElementById("spnuser").value="";
	        document.getElementById("spnpass").innerHTML = "*password is required";
	        document.getElementById("spnsub").innerHTML = "";
	    	
	        return false;
		}
	    return true;
	}</script>-->

	<form name='f' action="<c:url value='j_spring_security_check'/>" method='POST'>
		<div id="login_div">
		  <div class="login-top"></div>
		  <div class="login-center">
		  <c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>
		    <ul class="login-list">
		      <li>
		        <p>Enter Your Email-Id</p>
		      </li>
		      <li>
		        <input type="text" class="inputbx" name="j_username" id="user" >
				<p><font color="Red">
				<span id="spnuser" ></span></font></p>
		      </li>
		      <li>
		        <p>Enter Your Password</p>
		      </li>
		      <li>
		        <input type="password" class="inputbx" name="j_password" id="pass"><br>
		        
				<p><font color="Red"><span id="spnpass" ></span></font></p>
		      </li>
		      <li><a href="#">
		         <span id="spnsub" ></span>
		        <input type="submit" class="submit-btn" value=" " name="submit"  onclick="return validate()">
		        
		        </a></li>
		      <li><a href="forgotpwd" class="forgot-password"></a></li>
		      <li><input name="reset" type="reset" Value="Reset" class="reset-btn" /></li>
		      <li><a href="createuser" >Register</a></li>
		    </ul>
		  </div>
		  <div class="login-bottom"></div>
		</div>
	</form>
</body>
</html>