<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require module="common"/>
</head>
<body>
	<g:hasErrors bean="${scheduleInstance}">
		<g:renderErrors bean="${scheduleInstance}" as="list"/>
	</g:hasErrors>

	<g:form action="update">
		<g:hiddenField name="id" value="${params.id}"/>
		<g:hiddenField name="company.id" value="${params.company}"/>
		<g:render template="form"/>
		<br>
		<g:submitButton name="send" value="${message(code:'ni.com.lora.update')}" class="btn"/>
	</g:form>
</body>
</html>