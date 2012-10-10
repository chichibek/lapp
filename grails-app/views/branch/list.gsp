<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<g:if test="${branchInstanceList}">
		<h4>${companyInstance.name}</h4>
		<table class="table">
			<thead>
				<tr>
					<th><i class="icon-pencil"></i></th>
					<th><i class="icon-wrench"></i></th>
					<th><i class="icon-trash"></i></th>
					<th><g:message code='ni.com.lora.name'/></th>
					<th><g:message code='ni.com.lora.manager'/></th>
					<th><g:message code='ni.com.lora.address'/></th>
					<th><g:message code='ni.com.lora.telephone'/></th>
					<th><g:message code='ni.com.lora.email'/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${branchInstanceList}">
				<tr>
					<td style="width:1px;">
						<g:link action="show" params="[id:it.id,company:params.id]">
							<i class="icon-pencil"></i>
						</g:link>
					</td>
					<td style="width:1px;">
						<g:link action="edit" params="[id:it.id,company:params.id]">
							<i class="icon-wrench"></i>
						</g:link>
					</td>
					<td style="width:1px;">
						<g:link action="delete" params="[id:it.id,company:params.id]" Onclick="return confirm('${message(code: 'ni.com.lora.delete')}');">
							<i class="icon-trash"></i>
						</g:link>
					</td>
					<td><g:fieldValue bean="${it}" field="name"/></td>
					<td><g:fieldValue bean="${it}" field="manager"/></td>
					<td><g:fieldValue bean="${it}" field="address"/></td>
					<td><g:fieldValue bean="${it}" field="telephone"/></td>
					<td><g:fieldValue bean="${it}" field="email"/></td>
				</tr>
			    </g:each>
			</tbody>
		</table>
	</g:if>
	<g:else>
		<div class="alert">
			<g:message code="ni.com.lora.nothingtoshow"/>
		</div>
	</g:else>
</body>
</html>