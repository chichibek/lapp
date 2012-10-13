<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS,deal,jquery-ui"/>
</head>
<body>
	<div class="row">
		<div class="span5">
			<g:hasErrors bean="${dealInstance}">
				<g:renderErrors bean="${dealInstance}" as="list"/>
			</g:hasErrors>
				
			<g:form action="save" name="form">
				<g:hiddenField name="company.id" value="${params.id}"/>
				<g:render template="form"/>
				<br>
				<g:submitButton name="send" value="${message(code:'ni.com.lora.save')}" class="btn"/>
			</g:form>
		</div>
		<div class="span5">
			<g:render template="show-product"/>
		</div>
	</div>
</body>
</html>