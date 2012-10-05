<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="lora"/></title>
	<r:layoutResources/>
</head>
<body>
	<g:render template="/layouts/user/login-navbar"/>
	<div class="container main">
		<div class="row">
			<div class="span6">
	   			<legend>
	   				<g:message code="ni.com.lora.welcome"/>
	   			</legend>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
					cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
					proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</p>
			</div>
			<div class="span6">
				<g:layoutBody/>
				<lapp:flashMessage/>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>