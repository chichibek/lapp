<!DOCTYPE html>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="panel">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<g:if test="${dealInstanceList}">
		<g:each in="${dealInstanceList}">
			<div class="alert alert-info deal-list">
				${it} [${it?.company}] <g:link action="detail" params="[id:it.id, company:it?.company?.id]" class="btn btn-info btn-mini pull-right">More</g:link>
			</div>
		</g:each>
	</g:if>
</body>
</html>