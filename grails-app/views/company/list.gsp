<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require module="common"/>
</head>
<body>
	<g:if test="${companyInstanceList}">
		<table class="table">
			<thead>
				<tr>
					<th><i class="icon-home"></i></th>
					<th><i class="icon-list"></i></th>
					<th><i class="icon-calendar"></i></th>
					<th><i class="icon-pencil"></i></th>
					<th><i class="icon-trash"></i></th>
					<th><g:message code='ni.com.lora.name'/></th>
					<th><g:message code='ni.com.lora.manager'/></th>
					<th><g:message code='ni.com.lora.address'/></th>
					<th><g:message code='ni.com.lora.telephone'/></th>
					<th><g:message code='ni.com.lora.email'/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${companyInstanceList}">
				<tr>
					<td><g:link controller="schedule" id="${it.id}"><i class="icon-home"></i></g:link></td>
					<td><g:link controller="schedule" id="${it.id}"><i class="icon-list"></i></g:link></td>
					<td><g:link controller="schedule" id="${it.id}"><i class="icon-calendar"></i></g:link></td>
					<td><g:link action="show" id="${it.id}"><i class="icon-pencil"></i></g:link></td>
					<td><g:link action="delete" id="${it.id}"><i class="icon-trash"></i></g:link></td>
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
		<g:message code="ni.com.lora.nothingToShow"/>
	</g:else>
</body>
</html>