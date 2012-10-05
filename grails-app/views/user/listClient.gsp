<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<g:if test="${userInstanceList}">
		<table class="table">
			<thead>
				<tr>
					<th><i class="icon-home"></i></th>
					<th><i class="icon-pencil"></i></th>
					<th><i class="icon-wrench"></i></th>
					<th><i class="icon-trash"></i></th>
					<th><g:message code='ni.com.lora.username'/></th>
					<th><g:message code='ni.com.lora.email'/></th>
					<th><g:message code='ni.com.lora.identitycard'/></th>
					<th><g:message code='ni.com.lora.role'/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${userInstanceList}">
				<tr>
					<td style="width:1px;">
						<g:link controller="company" id="${it.id}"><i class="icon-home"></i></g:link>
					</td>
					<td style="width:1px;">
						<g:link action="showClient" params="[id:it.id]"><i class="icon-pencil"></i></g:link>
					</td>
					<td style="width:1px;">
						<g:link action="editClient" params="[id:it.id]"><i class="icon-wrench"></i></g:link>
					</td>
					<td style="width:1px;">
						<g:link action="delete" params="[id:it.id]" Onclick="return confirm('${message(code: 'ni.com.lora.delete')}');">
							<i class="icon-trash"></i>
						</g:link>
					</td>	
						<td><g:fieldValue bean="${it}" field="userName"/></td>
						<td><g:fieldValue bean="${it}" field="email"/></td>
						<td><g:fieldValue bean="${it}" field="identityCard"/></td>
						<td>${it?.role?.capitalize()?.encodeAsHTML()}</td>
					</tr>
			    </g:each>
			</tbody>
		</table>
	</g:if>
	<g:else>
		<g:message code="ni.com.lora.nothingtoshow"/>
	</g:else>
</body>
</html>