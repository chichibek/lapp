<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<g:if test="${scheduleInstanceList}">
		<table class="table">
			<thead>
				<tr>
					<th style="width:1px;"><i class="icon-pencil"></i></th>
					<th style="width:1px;"><i class="icon-trash"></i></th>
					<th><g:message code='ni.com.lora.fromday'/></th>
					<th><g:message code='ni.com.lora.today'/></th>
					<th><g:message code='ni.com.lora.fromhour'/></th>
					<th><g:message code='ni.com.lora.tohour'/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${scheduleInstanceList}">
				<tr>
					<td><g:link action="show" params="[id:it.id,company:params.id]"><i class="icon-pencil"></i></g:link></td>
					<td><g:link action="delete" params="[id:it.id,company:params.id]"><i class="icon-trash"></i></g:link></td>
					<td><g:fieldValue bean="${it}" field="fromDay"/></td>
					<td><g:fieldValue bean="${it}" field="toDay"/></td>
					<td><g:fieldValue bean="${it}" field="fromHour"/></td>
					<td><g:fieldValue bean="${it}" field="toHour"/></td>
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