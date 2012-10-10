<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="profile"/></title>
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
				<g:render template="/layouts/user-toolbar"/>
				<g:layoutBody/>
				<br>
				<lapp:flashMessage/>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>