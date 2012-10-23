<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title><g:message code="ni.com.lora.deallist"/></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<g:if test="${dealInstanceList}">
		<h4>${companyInstance.name}</h4>
		<table class="table">
			<thead>
				<tr>
					<th style="width:1px;"><i class="icon-th"></i></th>
					<th style="width:1px;"><i class="icon-align-justify"></i></th>
					<th style="width:1px;"><i class="icon-pencil"></i></th>
					<th style="width:1px;"><i class="icon-trash"></i></th>
					<th><g:message code='ni.com.lora.product'/></th>
					<th><g:message code='ni.com.lora.price'/></th>
					<th><g:message code='ni.com.lora.itemstosale'/></th>
					<th><g:message code='ni.com.lora.daylefttobuy'/></th>
					<th><g:message code='ni.com.lora.daylefttoclaim'/></th>
					<th><g:message code='ni.com.lora.published'/></th>
					<th><g:message code='ni.com.lora.state'/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${dealInstanceList}">
				<tr>
					<td><g:link controller="buy" action="buysByDeal" params="[id:it?.id,company:params.id]"><i class="icon-th"></i></g:link></td>
					<td><g:link action="detail" params="[id:it?.id,company:params.id]"><i class="icon-align-justify"></i></g:link></td>					
					<td><g:link action="show" params="[id:it.id,company:params.id]"><i class="icon-pencil"></i></g:link></td>
					<td><g:link action="delete" params="[id:it.id,company:params.id]" Onclick="return confirm('${message(code: 'ni.com.lora.delete')}');"><i class="icon-trash"></i></g:link></td>
					<td><g:fieldValue bean="${it}" field="product"/></td>
					<td><g:fieldValue bean="${it}" field="price"/></td>
					<td><g:fieldValue bean="${it}" field="itemsToSale"/></td>
					<td>${it?.daysToBuy()}</td>
					<td>${it?.daysToClaim()}</td>
					<td>
						<g:link action="changePublishedState" params="[id:it.id,company:params.id]" class="btn btn-mini btn-info">
							<lapp:isPublished state="${it?.published}"/>
						</g:link>
					</td>
					<td><lapp:dealState state="${it.state}"/></td>
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