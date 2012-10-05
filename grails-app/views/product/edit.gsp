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

	<g:if test="${productInstance?.avatar}">
		<img src="${createLink(action:'renderProductAvatar', id:productInstance?.id)}" alt="${productInstance?.name}" class="img-polaroid">
	</g:if>

	<g:uploadForm action="update">
		<g:hiddenField name="id" value="${params.id}" />
		<g:hiddenField name="company.id" value="${params.company}"/>
		<g:render template="form"/>
		<br>
		<g:submitButton name="send" value="${message(code:'ni.com.lora.update')}" class="btn"/>
	</g:uploadForm>
</body>
</html>