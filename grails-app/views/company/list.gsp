<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<g:if test="${companyInstanceList}">
		<h5>${userInstance}</h5>
		<table class="table">
			<thead>
				<tr>
					<th><i class="icon-shopping-cart"></i></th>
					<th><i class="icon-home"></i></th>
					<th><i class="icon-list"></i></th>
					<th><i class="icon-calendar"></i></th>
					<th><i class="icon-pencil"></i></th>
					<th><i class="icon-wrench"></i></th>
					<th><i class="icon-trash"></i></th>
					<th><g:message code='ni.com.lora.name'/></th>
					<th><g:message code='ni.com.lora.manager'/></th>
					<th><g:message code='ni.com.lora.telephone'/></th>
					<th><g:message code='ni.com.lora.email'/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${companyInstanceList}">
				<tr>
					<td><g:link controller="deal" params="[id:it.id,company:params.id]"><i class="icon-shopping-cart"></i></g:link></td>
					<td><g:link controller="branch" params="[id:it.id,company:params.id]"><i class="icon-home"></i></g:link></td>
					<td><g:link controller="product" params="[id:it.id,company:params.id]"><i class="icon-list"></i></g:link></td>
					<td><g:link controller="schedule" params="[id:it.id,company:params.id]"><i class="icon-calendar"></i></g:link></td>
					<td><g:link action="show" params="[id:it.id,company:params.id]"><i class="icon-pencil"></i></g:link></td>
					<td><g:link action="edit" params="[id:it.id,company:params.id]"><i class="icon-wrench"></i></g:link></td>
					<td>
						<g:link action="delete" params="[id:it.id,company:params.id]" Onclick="return confirm('${message(code:'ni.com.lora.delete')}');">
							<i class="icon-trash"></i>
						</g:link>
					</td>
					<td><g:fieldValue bean="${it}" field="name"/></td>
					<td><g:fieldValue bean="${it}" field="manager"/></td>
					<td><g:fieldValue bean="${it}" field="telephone"/></td>
					<td><g:fieldValue bean="${it}" field="email"/></td>
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