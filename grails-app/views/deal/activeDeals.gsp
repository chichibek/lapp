<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title><g:message code="ni.com.lora.activedeals"/></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<h5>${dealInstanceTotal} <g:message code="ni.com.lora.activedeals"/></h5>
	<g:if test="${dealInstanceList}">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th><i class="icon-th"></i></th>
					<th><i class="icon-align-justify"></i></th>
					<th><g:message code="ni.com.lora.product"/></th>
					<th><g:message code="ni.com.lora.price"/></th>
					<th><g:message code="ni.com.lora.itemstosale"/></th>
					<th><g:message code="ni.com.lora.daylefttobuy"/></th>
					<th><g:message code="ni.com.lora.daylefttoclaim"/></th>
					<th><g:message code="ni.com.lora.gender"/></th>
					<th><g:message code="ni.com.lora.age"/></th>
					<th style="text-align:right;">New deal</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${dealInstanceList}" var="deal">
				<tr>
					<td><g:link controller="buy" action="buysByDeal" params="[id:deal.id, company:deal.company.id]"><i class="icon-th"></i></g:link></td>
					<td><g:link action="detail" params="[id:deal.id, company:deal.company.id]"><i class="icon-align-justify"></i></g:link></td>
					<td><g:fieldValue bean="${deal}" field="product"/></td>
					<td><g:fieldValue bean="${deal}" field="price"/></td>
					<td><g:fieldValue bean="${deal}" field="itemsToSale"/></td>
					<td>${deal?.daysToBuy()}</td>
					<td>${deal?.daysToClaim()}</td>
					<td><g:fieldValue bean="${deal}" field="gender"/></td>
					<td><g:fieldValue bean="${deal}" field="age"/></td>
					<td style="text-align:right;"><g:link action="create" id="${deal?.company?.id}" class="btn btn-mini"><g:message code="ni.com.lora.newdealfor" args="[deal?.company]"/></g:link></td>
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