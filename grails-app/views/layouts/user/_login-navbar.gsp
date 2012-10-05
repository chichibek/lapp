<navbar class="navbar navbar-static-top navbar-inverse detail">
	<div class="navbar-inner">
		<div class="container">
		<g:link controller="deal" action="featured" class="brand">Muerta la lora</g:link>
		<ul class="nav pull-right">
			<li><g:link controller="deal" action="all"><g:message code="ni.com.lora.alldeals"/></g:link></li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<g:message code="ni.com.lora.language"/>
					<b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><g:link action="${actionName}" params="[lang:'es']">Español</g:link></li>
					<li><g:link action="${actionName}" params="[lang:'en']">English</g:link></li>
				</ul>
			</li>
		</ul>
		</div>
	</div>
</navbar>