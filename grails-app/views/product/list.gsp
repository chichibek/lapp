<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<g:if test="${productInstanceList}">
		<table class="table">
			<thead>
				<tr>
					<th><i class="icon-pencil"></i></th>
					<th><i class="icon-wrench"></i></th>
					<th><i class="icon-trash"></i></th>
					<th><g:message code='ni.com.lora.product.name'/></th>
					<th><g:message code='ni.com.lora.product.price'/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${productInstanceList}">
				<tr>
					<td style="width:1px;"><g:link action="show" params="[id:it.id,company:params.id]"><i class="icon-pencil"></i></g:link></td>
					<td style="width:1px;"><g:link action="edit" params="[id:it.id,company:params.id]"><i class="icon-wrench"></i></g:link></td>
					<td style="width:1px;">
						<g:link action="delete" params="[id:it.id,company:params.id]" Onclick="return confirm('${message(code: 'ni.com.lora.product.delete')}');">
							<i class="icon-trash"></i>
						</g:link>
					</td>
					<td><g:fieldValue bean="${it}" field="name"/></td>
					<td><g:fieldValue bean="${it}" field="price"/></td>
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