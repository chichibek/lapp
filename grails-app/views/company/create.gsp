<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require module="common"/>
</head>
<body>
	<g:hasErrors bean="${companyInstance}">
		<g:renderErrors bean="${companyInstance}" as="list"/>
	</g:hasErrors>

	<g:uploadForm action="save">
		<g:hiddenField name="user.id" value="${session?.user?.id}"/>
		<g:render template="form"/>
		<br>
		<g:submitButton name="send" value="${message(code:'ni.com.lora.save')}" class="btn"/>
	</g:uploadForm>
</body>
</html>