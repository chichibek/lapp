<!--
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="company"/></title>
	<r:layoutResources/>
</head>
<body>
	<g:render template="/layouts/panel-navbar"/>
	<div class="container main">
		<div class="row">
			<div class="span2">
				<g:render template="/layouts/panel-sidebar"/>
			</div>
			<div class="span10">
				<g:render template="/layouts/backend-toolbar"/>
				<g:layoutBody/>
				<lapp:flashMessage/>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>
-->
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="company"/></title>
	<r:layoutResources/>
</head>
<body>
	<g:render template="/layouts/panel-navbar"/>
	<div class="container main">
		<div class="row">
			<div class="span2">
				<g:render template="/layouts/panel-sidebar"/>
			</div>
			<div class="span10">
				<g:if test="${session?.user?.role == 'admin'}">
					<g:render template="/layouts/backend-toolbar"/>
				</g:if>
				<g:layoutBody/>
				<lapp:flashMessage/>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>