<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="buy"/></title>
	<r:layoutResources/>
</head>
<body>
	<g:render template="/layouts/panel-navbar"/>
	
	<div class="container main">
		<div class="row">
			<div class="span9">
				<g:layoutBody/>
				<lapp:flashMessage/>
			</div>
			<div class="span3">
				<g:render template="/layouts/frontend-sidebar"/>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>