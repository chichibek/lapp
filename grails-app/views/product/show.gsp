<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<g:hasErrors bean="${productInstance}">
		<g:renderErrors bean="${productInstance}" as="list"/>
	</g:hasErrors>
	<g:if test="${productInstance}">
		<div class="row">
			<div class="span10">
				<g:if test="${productInstance?.avatar}">
					<img src="${createLink(action:'renderProductAvatar', id:productInstance?.id)}" alt="${productInstance?.name}" class="img-polaroid pull-left">
				</g:if>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="span10">
				<table class="table">
					<tbody>
						<g:each in="${productInstance}">
						<tr>
							<th><g:message code="ni.com.lora.product.name"/></th>
							<td><g:fieldValue bean="${it}" field="name"/></td>
						</tr>
						<tr>
							<th><g:message code="ni.com.lora.product.price"/></th>
							<td><g:fieldValue bean="${it}" field="price"/></td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>	
		</div>
		<div class="row">
			<div class="span10">
				<div class="btn-group">
					<g:link action="edit" params="[id:params.id,company:params.company]" class="btn"><i class="icon-wrench"></i></g:link>
					<g:link action="delete" params="[id:params.id,company:params.company]" class="btn"><i class="icon-trash"></i></g:link>
				</div>
			</div>
		</div>
		<br>
    </g:if>
</body>
</html>

 