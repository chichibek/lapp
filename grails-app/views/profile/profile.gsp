<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="profile, jquery-ui"/>
</head>
<body>
	<legend>
		<g:message code="ni.com.lora.updateProfile"/>
	</legend>

	<avatar:gravatar email="${session?.user?.email}" cssClass="img-polaroid" size="80"/><br><br>
	
	<g:form action="updateProfile">
		<label for="fullName"><g:message code="ni.com.lora.fullname"/></label>
		<g:textField name="fullName" value="${fieldValue(bean:userProfileInstance, field:'fullName')}" class="span4"/>
		<label for="gender"><g:message code="ni.com.lora.gender"/></label>
		<g:select name="gender" from="${userProfileInstance?.constraints?.gender?.inList}" value="${fieldValue(bean:userProfileInstance, field:'gender')}"/>
		<label for="birthDay"><g:message code="ni.com.lora.birthDay"/></label>
		<g:textField name="birthDay" value="${formatDate(format:'yyyy-MM-dd',date:userProfileInstance?.birthDay)}"/>
		<label for="city"><g:message code="ni.com.lora.city"/></label>
		<g:select name="city" from="${userProfileInstance?.constraints?.city?.inList}" value="${fieldValue(bean:userProfileInstance, field:'city')}"/>
		<br>
		<g:submitButton name="send" value="${message(code:'ni.com.lora.update')}" class="btn"/>
	</g:form>
</body>
</html>
