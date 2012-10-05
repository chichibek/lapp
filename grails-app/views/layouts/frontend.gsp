<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="deal"/></title>
	<r:layoutResources/>
</head>
<body>
	<g:render template="/layouts/public-navbar"/>
	<div class="container main">
		<div class="row">
			<div class="span9">
				<g:layoutBody/>
			</div>
			<div class="span3">
				<g:if test="${actionName == 'featured'}">
					<g:render template="/layouts/deal-featured-sidebar" model="[dealInstance:dealInstance]"/>
				</g:if>
				<g:else>
					<g:render template="/layouts/frontend-sidebar"/>
				</g:else>
			</div>	
		</div>
	<r:layoutResources/>
</body>
</html>