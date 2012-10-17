<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<g:if test="${productInstanceList}">
		<g:if test="${session?.user?.role == 'admin'}">
		<table class="table">
			<thead>
				<tr>
					<th><i class="icon-pencil"></i></th>
					<th><i class="icon-wrench"></i></th>
					<th><i class="icon-trash"></i></th>
					<th><g:message code='ni.com.lora.product.name'/></th>
					<th><g:message code='ni.com.lora.product.price'/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${productInstanceList}">
				<tr>
					<td style="width:1px;"><g:link action="show" params="[id:it.id,company:params.id]"><i class="icon-pencil"></i></g:link></td>
					<td style="width:1px;"><g:link action="edit" params="[id:it.id,company:params.id]"><i class="icon-wrench"></i></g:link></td>
					<td style="width:1px;">
						<g:link action="delete" params="[id:it.id,company:params.id]" Onclick="return confirm('${message(code: 'ni.com.lora.product.delete')}');">
							<i class="icon-trash"></i>
						</g:link>
					</td>
					<td><g:fieldValue bean="${it}" field="name"/></td>
					<td><g:fieldValue bean="${it}" field="price"/></td>
				</tr>
			    </g:each>
			</tbody>
		</table>
		</g:if>
		<g:elseif test="${session?.user?.role == 'client'}">
			<div class="row">
				<div class="span3">
					<g:if test="${companyInstance?.logo}">
             			<img style="width:100%;height:100%;"src="${createLink(action:'renderLogo', id:companyInstance.id)}" alt="imagen" class="img-polaroid">
        			</g:if>
					<g:else>
					    <r:img uri="/images/persona.jpg" class="img-polaroid"/>
					</g:else>
				</div>
				<div class="span6">
					<table class="table">
					<thead>
						<tr>
							<th><g:message code='ni.com.lora.fromday'/></th>
							<th><g:message code='ni.com.lora.today'/></th>
							<th><g:message code='ni.com.lora.fromhour'/></th>
							<th><g:message code='ni.com.lora.tohour'/></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${scheduleInstanceList}">
						<tr>
							<td><g:fieldValue bean="${it}" field="fromDay"/></td>
							<td><g:fieldValue bean="${it}" field="toDay"/></td>
							<td><g:fieldValue bean="${it}" field="fromHour"/></td>
							<td><g:fieldValue bean="${it}" field="toHour"/></td>
						</tr>
					    </g:each>
					</tbody>
					</table>
				</div>
			</div>
		</g:elseif>
	</g:if>
	<g:else>
		<div class="alert">
			<g:message code="ni.com.lora.nothingtoshow"/>
		</div>
	</g:else>
</body>
</html>