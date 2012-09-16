<navbar class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<g:link controller="panel" class="brand">Muerta la lora</g:link>
			<ul class="nav pull-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<g:message code="ni.com.lora.settings"/>
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><g:link controller="profile" action="profile"><g:message code="ni.com.lora.settings"/></g:link></li>
						<li><g:link controller="user" action="logout"><g:message code="ni.com.lora.logout"/></g:link></li>
					</ul>
				</li>
			</ul>	
		</div>
	</div>
</navbar>