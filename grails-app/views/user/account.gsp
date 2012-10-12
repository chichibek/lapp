<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="profile">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<legend>
		<g:message code="ni.com.lora.updateAccount"/>
	</legend>

	<g:hasErrors bean="${userInstance}">
		<div class="errors">
			<g:renderErrors bean="${userInstance}" as="list"/>
		</div>
	</g:hasErrors>

	<g:form name="form" action="updateAccount">
		<label for="userName"><g:message code="ni.com.lora.username"/></label>
		<g:textField name="userName" class="span4" value="${fieldValue(bean:session?.user, field:'userName')}"/>
		<label for="email"><g:message code="ni.com.lora.email"/></label>
		<g:textField name="email" class="span4" value="${fieldValue(bean:session?.user, field:'email')}"/>
		<br>
		<g:submitButton name="send" value="${message(code:'ni.com.lora.update')}" class="btn"/>
	</g:form>
</body>
</html>