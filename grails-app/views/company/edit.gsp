<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<g:hasErrors bean="${companyInstance}">
		<g:renderErrors bean="${companyInstance}" as="list"/>
	</g:hasErrors>

	<g:uploadForm action="update">
		<g:hiddenField name="id" value="${params.id}"/>
		<g:render template="form"/>
		<br>
		<g:submitButton name="send" value="${message(code:'ni.com.lora.update')}" class="btn"/>
	</g:uploadForm>
</body>
</html>