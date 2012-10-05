<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS,deal,jquery-ui"/>
</head>
<body>
	<g:hasErrors bean="${dealInstance}">
		<g:renderErrors bean="${dealInstance}" as="list"/>
	</g:hasErrors>

	<g:form action="update">
		<g:hiddenField name="id" value="${params.id}"/>
		<g:hiddenField name="company.id" value="${params.company}"/>
		<g:render template="form"/>
		<g:submitButton name="send" value="${message(code:'ni.com.lora.update')}" class="btn"/>
	</g:form>
</body>
</html>