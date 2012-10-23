<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<h5>${dealInstanceTotal} <g:message code="ni.com.lora.activedeals"/></h5>
	<g:if test="${dealInstanceList}">
		<table class="table">
			<thead>
				<tr>
					<th><g:message code="ni.com.lora.product"/></th>
					<th><g:message code="ni.com.lora.price"/></th>
					<th><g:message code="ni.com.lora.itemstosale"/></th>
					<th><g:message code="ni.com.lora.daylefttobuy"/></th>
					<th><g:message code="ni.com.lora.daylefttoclaim"/></th>
					<th><g:message code="ni.com.lora.published"/></th>
					<th><g:message code="ni.com.lora.state"/></th>
					<th><g:message code="ni.com.lora.gender"/></th>
					<th><g:message code="ni.com.lora.age"/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${dealInstanceList}" var="deal">
				<tr>
					<td><g:fieldValue bean="${deal}" field="product"/></td>
					<td><g:fieldValue bean="${deal}" field="price"/></td>
					<td><g:fieldValue bean="${deal}" field="itemsToSale"/></td>
					<td>${deal?.daysToBuy()}</td>
					<td>${deal?.daysToClaim()}</td>
				</tr>
				</g:each>
			</tbody>
		</table>
	</g:if>
	<g:else>
		<div class="alert"><g:message code="ni.com.lora.nothingtoshow"/></div>
	</g:else>
</body>
</html>