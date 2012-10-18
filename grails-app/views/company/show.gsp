<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<g:if test="${companyInstance}">
		<h3>${companyInstance?.encodeAsHTML()}</h3>
		<div class="row">
			<div class="span2">
				<g:if test="${companyInstance?.logo}">
             		<img src="${createLink(action:'renderLogo', id:companyInstance.id)}" alt="${companyInstance?.name}" class="img-polaroid">
        		</g:if>
				<g:else>
				    <r:img uri="/images/persona.jpg" alt="persona" class="img-polaroid"/>
				</g:else>
			</div>
			<div class="span8">
				<table class="table">
					<tbody>
						<tr>
							<th><g:message code='ni.com.lora.name'/></th>
							<td><g:fieldValue bean="${companyInstance}" field="name"/></td>
						</tr>

						<tr>
							<th><g:message code='ni.com.lora.manager'/></th>
							<td><g:fieldValue bean="${companyInstance}" field="manager"/></td>
						</tr>

						<tr>
							<th><g:message code='ni.com.lora.telephone'/></th>
							<td><g:fieldValue bean="${companyInstance}" field="telephone"/></td>
						</tr>

						<tr>
							<th><g:message code='ni.com.lora.companyservice'/></th>
							<td><g:fieldValue bean="${companyInstance}" field="companyService"/></td>
						</tr>

						<tr>
							<th><g:message code='ni.com.lora.email'/></th>
							<td><g:fieldValue bean="${companyInstance}" field="email"/></td>
						</tr>

						<tr>
							<th><g:message code='ni.com.lora.url'/></th>
							<td><g:fieldValue bean="${companyInstance}" field="url"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="span10">
				<div class="btn-toolbar">
					<div class="btn-group">
						<g:link controller="branch" params="[id:companyInstance?.id, company:companyInstance?.user?.id]" class="btn"><i class="icon-home"></i></g:link>
						<g:link controller="product" params="[id:companyInstance?.id, company:companyInstance?.user?.id]" class="btn"><i class="icon-list"></i></g:link>
						<g:link controller="schedule" params="[id:companyInstance?.id, company:companyInstance?.user?.id]" class="btn"><i class="icon-calendar"></i></g:link>
					</div>
					<div class="btn-group">
						<g:link action="edit" params="[id:companyInstance?.id, company:companyInstance?.user?.id]" class="btn"><i class="icon-wrench"></i></g:link>
						<g:link action="delete" params="[id:companyInstance?.id, company:companyInstance?.user?.id]" Onclick="return confirm('${message(code:'ni.com.lora.delete')}');" class="btn"><i class="icon-trash"></i></g:link>
					</div>
				</div>
			</div>
		</div>
	</g:if>
	<g:else>
		<div class="alert">
			<g:message code="ni.com.lora.nothingtoshow"/>
		</div>
	</g:else>
</body>
</html>