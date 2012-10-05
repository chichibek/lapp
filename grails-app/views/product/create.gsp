<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<g:hasErrors>
		<g:renderErrors as="list"/>
	</g:hasErrors>

	<g:uploadForm action="save">
		<g:hiddenField name="company.id" value="${params.id}"/>
		<g:render template="form"/>
		<br>
		<g:submitButton name="send" value="${message(code:'ni.com.lora.save')}" class="btn"/>
	</g:uploadForm>
</body>
</html>