<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<g:if test="${branchInstance}">
		<div class="row">
			<div class="span2">
				<g:if test="${companyInstance?.logo}">
             		<img style="width:100%;height:100%;"src="${createLink(action:'renderlogo', id:companyInstance.id)}" alt="imagen">
        		</g:if>
				<g:else>
				    <img src="${resource(dir: 'images', file: 'usuario.png')}" alt="Usuario">
				</g:else>
			</div>
			<div class="span8">
				<table class="table">
					<tbody>	
						<tr>
							<th><g:message code='ni.com.lora.name'/></th>
							<td><g:fieldValue bean="${branchInstance}" field="name"/></td>
						</tr>
				
						<tr>
							<th><g:message code='ni.com.lora.manager'/></th>
							<td><g:fieldValue bean="${branchInstance}" field="manager"/></td>
						</tr>
				
						<tr>
							<th><g:message code='ni.com.lora.telephone'/></th>
							<td><g:fieldValue bean="${branchInstance}" field="telephone"/></td>
						</tr>
				
						<tr>
							<th><g:message code='ni.com.lora.address'/></th>
							<td><g:fieldValue bean="${branchInstance}" field="address"/></td>
						</tr>
				
						<tr>
							<th><g:message code='ni.com.lora.email'/></th>
							<td><g:fieldValue bean="${branchInstance}" field="email"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="btn-group">
			<g:link action="edit" id="${branchInstance.id}" params="[company:"${company}"]" class="btn"><i class="icon-wrench"></i></g:link>
			<g:link action="delete" id="${branchInstance.id}" params="[company:"${company}"]" Onclick="return confirm('${message(code:'ni.com.lora.delete')}');" class="btn"><i class="icon-trash"></i></g:link>
		</div>
	</g:if>
	<g:else>
		<g:message code="ni.com.lora.nothingtoshow"/>
	</g:else>
</body>
</html>