<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="frontend">
	<title></title>
	<r:require modules="common"/>
</head>
<body>
	<g:if test="${dealInstance}">
		<h4><g:message code="ni.com.lora.dealtext" args="[dealInstance?.product,dealInstance?.price,g.include(action: 'getPercentageSaved', controller: 'product', params:[price:dealInstance?.price, company:dealInstance?.company, product:dealInstance?.product]),dealInstance?.itemsToSale]"/></h4>
		<img src="${createLink(controller:'product', action:'renderProductAvatar', params:[product:dealInstance?.product,company:dealInstance?.company])}" class="img-polaroid" alt="${dealInstance}">

		<!--Detail about current deal-->
		<div class="row">
			<div class="span3">
				<legend><g:message code="ni.com.lora.buy"/></legend>
				<table class="table table-condensed table-bordered">
					<thead>
						<tr>
							<th><g:message code="ni.com.lora.from"/></th>
							<th><g:message code="ni.com.lora.discount"/></th>
							<th><g:message code="ni.com.lora.yousave"/></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${dealInstance?.price}</td>
							<td>
								<g:include controller="product" action="getPercentageSaved" params="[price:dealInstance?.price, company:dealInstance?.company, product:dealInstance?.product]" />
							</td>
							<td>
								<g:include controller="product" action="getMoneySaved" params="[price:dealInstance?.price, company:dealInstance?.company, product:dealInstance?.product]"/>
							</td>
						</tr>
					</tbody>
				</table>
				<g:form controller="buy" action="setBuy" class="form-inline" params="[deal:dealInstance.id, user:session?.user]">
					<input type="number" name="quantity" id="quantity" value="${params?.quantity}" placeholder="${message(code:'ni.com.lora.quantity')}" class="span1"/>
					<g:submitButton name="send" value="${message(code:'ni.com.lora.buy')}" class="btn btn-warning"/>
				</g:form>
			</div>
			<div class="span6">
				<legend><g:message code="ni.com.lora.description"/></legend>
				<p>${dealInstance?.description}</p>
			</div>
		</div>
	</g:if>
	<g:else>
		<g:message code="ni.com.lora.nothingtoshow"/>
	</g:else>
</body>
</html>