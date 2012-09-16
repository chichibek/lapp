<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require module="common"/>
</head>
<body>
	<g:if test="${scheduleInstanceList}">
		<table class="table">
			<thead>
				<tr>
					<th><i class="icon-pencil"></i></th>
					<th><i class="icon-trash"></i></th>
					<th><g:message code='ni.com.lora.fromDate'/></th>
					<th><g:message code='ni.com.lora.toDate'/></th>
					<th><g:message code='ni.com.lora.fromDay'/></th>
					<th><g:message code='ni.com.lora.toDay'/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${scheduleInstanceList}">
				<tr>
					<td><g:link action="show" id="${it.id}"><i class="icon-pencil"></i></g:link></td>
					<td><g:link action="delete" id="${it.id}"><i class="icon-trash"></i></g:link></td>
					<td><g:fieldValue bean="${it}" field="fromDate"/></td>
					<td><g:fieldValue bean="${it}" field="toDate"/></td>
					<td><g:fieldValue bean="${it}" field="fromHour"/></td>
					<td><g:fieldValue bean="${it}" field="toHour"/></td>
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