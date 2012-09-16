<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="lora"/></title>
	<r:layoutResources/>
</head>
<body>
	<g:render template="/layouts/user/login-navbar"/>
	<div class="conatiner main">
		<div class="row">
			<div class="span8 offset3">
				<div class="row">
					<div class="span4">
						<legend>
							<h3><g:message code="ni.com.lora.welcome"/></h3>
						</legend>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
							tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
							quis.
						</p>
					</div>
					<div class="span4">
						<g:layoutBody/>
						<lapp:flashMessage/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>