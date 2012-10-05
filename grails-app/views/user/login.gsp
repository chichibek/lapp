<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<r:require modules="common,commonJS"/>
</head>
<body>
	
	<legend><g:message code="ni.com.lora.login"/></legend>

	<g:if test="${params?.deal}">
		<div class="alert alert-info">
			<g:message code="ni.com.lora.inorderto"/>
		</div>
	</g:if>
	
	<g:form name="form" action="authenticate" params="[deal:params?.deal, quantity:params.quantity]">
		<label for="userName"><g:message code="ni.com.lora.username"/></label>
		<g:textField name="userName" class="span4" autocomplete="off" autofocus="true" placeholder="${message(code:'ni.com.lora.usernameEmail')}"/>
		<label for="password"><g:message code="ni.com.lora.password"/></label>
		<g:passwordField name="password" class="span4"/>
		<br>
		<g:submitButton name="name" value="${message(code:'ni.com.lora.authenticate')}" class="btn"/>
		<g:link action="resetPassword" class="btn"><g:message code="ni.com.lora.reset"/></g:link>
	</g:form>

	<legend><g:message code="ni.com.lora.newuser"/></legend>

	<g:hasErrors bean="${userInstance}">
		<div class="errors">
			<g:renderErrors bean="${userInstance}" as="list"/>
		</div>
	</g:hasErrors>

	<g:form name="form" action="signin">
		<label for="userName"><g:message code="ni.com.lora.username"/></label>
		<g:textField name="userName" class="span4" placeholder="${message(code:'ni.com.lora.require')}"/>
		<label for="fullName"><g:message code="ni.com.lora.fullname"/></label>
		<g:textField name="profile.fullName" class="span4"/>
		<label for="email"><g:message code="ni.com.lora.email"/></label>
		<g:textField name="email" class="span4" placeholder="${message(code:'ni.com.lora.require')}"/>
		<label for="password"><g:message code="ni.com.lora.password"/></label>
		<g:passwordField name="password" class="span4" placeholder="${message(code:'ni.com.lora.require')}"/>
		<label for="address"><g:message code="ni.com.lora.address"/></label>
		<g:textField name="address" class="span4" placeholder="${message(code:'ni.com.lora.require')}"/>
		<label for="identityCard"><g:message code="ni.com.lora.identitycard"/></label>
		<g:textField name="identityCard" class="span4" placeholder="${message(code:'ni.com.lora.require')}"/>
		<br>
		<g:submitButton name="name" value="${message(code:'ni.com.lora.signin')}" class="btn"/>
	</g:form>

</body>
</html>