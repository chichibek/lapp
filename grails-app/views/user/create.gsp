<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<legend>
		<g:message code="ni.com.lora.adminclient"/>
	</legend>

	<g:hasErrors bean="${userInstance}">
		<div class="errors">
			<g:renderErrors bean="${userInstance}" as="list"/>
		</div>
	</g:hasErrors>

	<g:form name="form" action="save">
		<g:render template="form"/>
		<br>
		<g:submitButton name="name" value="${message(code:'ni.com.lora.save')}" class="btn"/>
	</g:form>
</body>
</html>