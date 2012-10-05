<!DOCTYPE html>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="panel">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<g:if test="${buyInstanceList}">
		<table class="table">
			<thead>
				<tr>
					<th><g:message code="ni.com.lora.deal"/></th>
					<th><g:message code="ni.com.lora.user"/></th>
					<th><g:message code="ni.com.lora.quantity"/></th>
					<th><g:message code="ni.com.lora.paid"/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${buyInstanceList}" var="buy">
				<tr>
					<td><g:link action="buysByDeal" params="[id:buy?.deal?.id, company:buy?.deal?.company?.id]"><g:fieldValue bean="${buy}" field="deal"/></g:link></td>
					<td><g:link controller="user" action="showClient" params="[userName:buy.user, role:'user']"><g:fieldValue bean="${buy}" field="user"/></g:link></td>
					<td><g:fieldValue bean="${buy}" field="quantity"/></td>
					<td><lapp:isPaid state="${buy?.paid}"/></td>
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