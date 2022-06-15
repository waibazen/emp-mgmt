<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=8; IE=9" />	
<title>Integrated Payments System</title>
<script type="text/javascript">
var message="${errorMessage}";
$(document).ready(function(){ 
	clearMessage2();
	$("#menuSegTd").removeClass("grayborder");
	$("#user").focus();
	$("#lgnBtn").click(function(){
		clearMessage2();
		$("#loginTbl").css("margin-top", "10%");
		  if($("#user").val()==""){
			  	$("#loginTbl").css("margin-top", "5%");
			  	showErrorMessage2("Please enter user name.");
				$("#user").css("background-color","yellow");
				$("#password").css("background-color","white");		
				$("#user").focus();
			        	return false;
			}
	       else if($("#password").val()==""){
	    	$("#loginTbl").css("margin-top", "5%");
	       	showErrorMessage2("Please enter password.");
			$("#password").css("background-color","yellow");
			$("#user").css("background-color","white");		
			$("#password").focus();
	       	return false;
	       } 
		$("#menuSegTd").addClass("grayborder");
		document.forms[0].submit();
		         
	});

	if (!(message === null || message === 'null' || message == null || message == 'null' || message === '' || message == '')) 
	{
		msgAttr = message.split("^");
		if (msgAttr[1] === "success") {
			//alert(msgAttr[1]);
			$("#loginTbl").css("margin-top", "5%");
			showSuccessMessage2(msgAttr[0])
			$("#msgDiv").removeClass("form_success");
			$("#msgDiv").addClass("loginForm_success");
		} else if (msgAttr[1] === "failure") {
			//alert(msgAttr[1]);
			$("#loginTbl").css("margin-top", "5%");
			showErrorMessage2(msgAttr[0])
		} else {

		}
	}
});
</script>
</head>


<form action="/EppWeb/app/epp/authenticate?eppAccount.jsp=true" method="post" target="_top"  >	
<table class="tblStyle"  align="center" style="" >
	<tr>
		<td ><div id="msgDiv" style="float:left;"></td>
	</tr>
</table>	
<table class="tblStyle" id="loginTbl"  align="center" style="width: 460px;border: 1.5px solid lightgray;margin-top:10%;border-radius:6px" >
	<tr>
		<th colspan="2" class="tile-header">Login Information</th>
	</tr>	
	<tr align="center" >   
		 <td class="label-style1" style="padding:20px;">User Name (CUID) :<span class="redcolor">*</span></td>
		 <td style="padding:20px;"><input type="text" name ="user" maxlength="255" id="user" title="username"  class="userNameStyle"
		 	onfocus="this.select();return true;" onblur="this.value=StringUtils_trim(this.value);return true;" autocomplete="off"/></td> 	
   	</tr>
   	<tr align="center" > 
		<td class="label-style1" style="padding:20px;padding-top:1px;">Password (LDAP) :<span class="redcolor">*</span></td>	
		<td style="padding:20px;padding-top:1px;"><input type="password" name="password" maxlength="255" id="password" title="password" class="passwordStyle"
			onfocus="this.select();return true;" onblur="this.value=StringUtils_trim(this.value);return true;"/></td>  	
   	</tr>
   	<tr>
       <td colspan="2" style="margin-left:auto; margin-right:auto; background-color:#666699;"></td>
    </tr>
   	<tr>
		<td colspan="2" style="padding-left:20px;"><span class="redcolor">*</span> indicates a required field.
			<input type="hidden" name="voiceDetokenView" id="voiceDetokenView" value="${voiceDetokenView}"/>
		</td>
	</tr>
   	<tr>
   	<td align="center" colspan="2">
		<input type="submit" name="lgnBtn" id="lgnBtn" value="Login"  style="margin-top:auto;" class="btnStyle1">
   	 </td>
   	</tr>		
	</table>
	
</form>


