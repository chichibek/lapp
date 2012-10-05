<!DOCTYPE html>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<div class="row">
		<div class="span3">
			<img src="${createLink(controller:'product', action:'renderProductAvatar', params:[product:buyInstance?.deal?.product,company:buyInstance?.deal?.company])}" alt="${buyInstance?.deal}" class="img-polaroid">
		</div>
		<div class="span6">
			<table class="table table-condensed table-bordered">
				<thead>
					<tr>
						<th><g:message code="ni.com.lora.product"/></th>
						<th><g:message code="ni.com.lora.company"/></th>
						<th><g:message code="ni.com.lora.datecreated"/></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${buyInstance?.deal.encodeAsHTML()}</td>
						<td>${buyInstance?.deal?.company.encodeAsHTML()}</td>
						<td>
							<g:formatDate date="${buyInstance?.dateCreated}" type="datetime" style="SHORT"/>
						</td>
					</tr>
					<tr>
						<th><g:message code="ni.com.lora.from"/></th>
						<th><g:message code="ni.com.lora.discount"/></th>
						<th><g:message code="ni.com.lora.yousave"/></th>
					</tr>
					<tr>
						<td>${buyInstance?.deal?.price}</td>
						<td>
							<g:formatNumber number="${g.include(action: 'getPercentageSaved', controller: 'product', params:[price:buyInstance?.deal?.price, company:buyInstance?.deal?.company, product:buyInstance?.deal?.product])}" type="number" maxFractionDigits="2" roundingMode="HALF_DOWN" /> %
						</td>
						<td>
							<g:include controller="product" action="getMoneySaved" params="[price:buyInstance?.deal?.price, company:buyInstance?.deal?.company, product:buyInstance?.deal?.product]"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="row">
				<div class="span6">
					<div class="pull-right">
						<lapp:isPaid paid="${buyInstance?.paid}"/>
					</div>
				</div>
			</div>
			<legend><g:message code="ni.com.lora.description"/></legend>
			<p>${buyInstance?.deal?.description}</p>
		</div>
	</div>
</body>
</html>