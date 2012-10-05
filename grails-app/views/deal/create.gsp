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

	<g:form action="save" name="form">
		<g:hiddenField name="company.id" value="${params.id}"/>
		<g:render template="form"/>
		<br>
		<g:submitButton name="send" value="${message(code:'ni.com.lora.save')}" class="btn"/>
	</g:form>
</body>
</html>