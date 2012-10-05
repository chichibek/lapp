<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<g:if test="${userInstance}">
		<h3>${userInstance?.userName}</h3>
		<table class="table">
			<tbody>
				<tr>
					<th><g:message code='ni.com.lora.username'/></th>
					<td><g:fieldValue bean="${userInstance}" field="userName"/></td>
				</tr>
				<tr>
					<th><g:message code='ni.com.lora.address'/></th>
					<td><g:fieldValue bean="${userInstance}" field="address"/></td>
				</tr>
				<tr>
					<th><g:message code='ni.com.lora.email'/></th>
					<td><g:fieldValue bean="${userInstance}" field="email"/></td>
				</tr>
				<tr>
					<th><g:message code='ni.com.lora.identitycard'/></th>
					<td><g:fieldValue bean="${userInstance}" field="identityCard"/></td>
				</tr>
				<tr>
					<th><g:message code='ni.com.lora.role'/></th>
					<td><g:fieldValue bean="${userInstance}" field="role"/></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<g:link action="list" params="[role:params.role]" class="btn"><i class="icon-chevron-left"></i></g:link>
			<g:link action="edit" params="[id:userInstance?.id, role:params.role]" class="btn"><i class="icon-wrench"></i></g:link>
			<g:link action="delete" params="[id:userInstance?.id, role:params.role]" class="btn" Onclick="return confirm('${message(code: 'ni.com.lora.delete')}');">
				<i class="icon-trash"></i>
			</g:link>
		</div>
	</g:if>
	<g:else>
		<g:message code="ni.com.lora.nothingtoshow"/>
	</g:else>
</body>
</html>