<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="frontend">
	<title></title>
	<r:require module="common"/>
</head>
<body>
	<div class="btn-group">
		<g:link action="${actionName}" params="[disposition:'list']" class="btn"><i class="icon-list"></i></g:link>
		<g:link action="${actionName}" params="[disposition:'th']" class="btn"><i class="icon-th"></i></g:link>
	</div>
	<br>
	<g:if test="${dealInstanceList}">
		<g:if test="${params.disposition == 'list' || !params.disposition}">
			<g:each in="${dealInstanceList}" var="deal">
				<div class="row list">
					<div class="span3">
						<img src="${createLink(controller:'product', action:'renderProductAvatar', params:[product:deal?.product,company:deal?.company])}" class="img-polaroid" alt="${deal}">
					</div>

					<div class="span6">
						<strong><g:message code="ni.com.lora.dealtext" args="[deal?.product,deal?.price,g.include(action: 'getPercentageSaved', controller: 'product', params:[price:deal?.price, company:deal?.company, product:deal?.product]),deal?.itemsToSale]"/></strong>
						<br>
						<g:link action="all" params="[company:deal?.company]">${deal?.company}</g:link>
						<p><small>${deal?.description}</small></p>
						<g:link action="featured" id="${deal?.id}" class="btn btn-info"><g:message code="ni.com.lora.buy"/></g:link>
					</div>
				</div>
			</g:each>
		</g:if>
		<g:elseif test="${params.disposition == 'th'}">

		</g:elseif>
	</g:if>
	<g:else>
		<g:message code="ni.com.lora.nothingtoshow"/>
	</g:else>
</body>
</html>