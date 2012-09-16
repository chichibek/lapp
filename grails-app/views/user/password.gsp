<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<legend>
		<g:message code="ni.com.lora.updatePassword"/>
	</legend>

	<g:hasErrors bean="${userInstance}">
		<div class="errors">
			<g:renderErrors bean="${userInstance}" as="list"/>
		</div>
	</g:hasErrors>

	<g:form name="form" action="updatePassword">
		<label for="apassword"><g:message code="ni.com.lora.apassword"/></label>
		<g:passwordField name="apassword" class="span4" autofocus="true"/>
		<label for="password"><g:message code="ni.com.lora.npassword"/></label>
		<g:passwordField name="password" class="span4"/>
		<label for="rpassword"><g:message code="ni.com.lora.rpassword"/></label>
		<g:passwordField name="rpassword" class="span4"/>
		<br>
		<g:submitButton name="send" value="${message(code:'ni.com.lora.update')}" class="btn"/>
	</g:form>
</body>
</html>