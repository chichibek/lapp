<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="frontend">
	<title></title>
	<r:require module="common"/>
</head>
<body>
	<g:render template="companies-category-toolbar"/>
	<g:if test="${companyInstanceList}">
		<ul class="bg">
			<g:each in="${companyInstanceList}" var="company" status="i">
			<li>
				<g:if test="${company?.logo}">
					<figure>
						<img src="${createLink(action:'renderLogo', id:company.id)}" alt="${company.name}" class="img-polaroid">
						<figcaption class="hidden-phone hidden-tablet">${company?.name}</figcaption>
					</figure>
		        	</g:if>        
					<g:else>
						${company?.name}
					</g:else>
				</li>
			</g:each>
		</ul>
	</g:if>
	<g:else>
		<g:message code="ni.com.lora.nothingtoshow"/>		
	</g:else>
</body>
</html>