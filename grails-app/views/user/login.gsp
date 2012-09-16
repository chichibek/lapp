<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<r:require modules="common, commonJS"/>
</head>
<body>
	
	<legend>
		<h3><g:message code="ni.com.lora.login"/></h3>
	</legend>
	
	<g:form name="form" action="authenticate">
		<label for="userName"><g:message code="ni.com.lora.username"/></label>
		<g:textField name="userName" class="span4" autocomplete="off" autofocus="true" placeholder="${message(code:'ni.com.lora.usernameEmail')}"/>
		<label for="password"><g:message code="ni.com.lora.password"/></label>
		<g:passwordField name="password" class="span4"/>
		<g:submitButton name="name" value="${message(code:'ni.com.lora.authenticate')}" class="btn"/>
		<g:link action="resetPassword" class="btn"><g:message code="ni.com.lora.reset"/></g:link>
	</g:form>

	<legend>
		<h3><g:message code="ni.com.lora.newuser"/></h3>
	</legend>

	<g:hasErrors bean="${userInstance}">
		<div class="errors">
			<g:renderErrors bean="${userInstance}" as="list"/>
		</div>
	</g:hasErrors>

	<g:form name="form" action="signin">
		<label for="fullName"><g:message code="ni.com.lora.fullname"/></label>
		<g:textField name="profile.fullName" class="span4"/>
		<label for="email"><g:message code="ni.com.lora.email"/></label>
		<g:textField name="email" class="span4"/>
		<label for="password"><g:message code="ni.com.lora.password"/></label>
		<g:passwordField name="password" class="span4"/>
		<g:submitButton name="name" value="${message(code:'ni.com.lora.signin')}" class="btn"/>
	</g:form>

</body>
</html>