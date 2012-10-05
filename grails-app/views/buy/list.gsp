<!DOCTYPE html>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<g:if test="${buyInstanceList}">
		<div class="alert alert-info">
			<g:message code="ni.com.lora.moneysaved"/>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th><g:message code="ni.com.lora.buydate"/></th>
					<th><g:message code="ni.com.lora.description"/></th>
					<th><g:message code="ni.com.lora.paid"/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${buyInstanceList}" var="buy">
				<tr>
					<td><g:formatDate date="${buy?.dateCreated}" format="yyyy-MM-dd"/></td>
					<td>${buy?.deal?.description.encodeAsHTML()}</td>
					<td><lapp:isPublished state="${buy?.paid}"/></td>
				</tr>
			    </g:each>
			</tbody>
		</table>
	</g:if>
	<g:else>
		<div class="alert">
			<g:message code="ni.com.lora.nonebuy"/>
		</div>
	</g:else>
</body>
</html>