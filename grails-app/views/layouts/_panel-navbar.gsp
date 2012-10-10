<navbar class="navbar navbar-static-top navbar-inverse">
	<div class="navbar-inner">
		<div class="container">
			<g:if test="${session?.user?.role == 'admin'}">
				<g:link controller="user" action="list" params="[role:'client']" class="brand">Muerta la Lora</g:link>
			</g:if>
			<g:elseif test="${session?.user?.role == 'user'}">
				<g:link controller="buy" action="list" class="brand">Muerta la Lora</g:link>
			</g:elseif>
			<g:else>
				<g:link controller="company" action="list" params="[id:session?.user?.id]" class="brand">Muerta la lora</g:link>
			</g:else>
			<ul class="nav pull-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<g:message code="ni.com.lora.settings"/>
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li>
							<g:if test="${session?.user?.role == 'admin'}">
								<g:link controller="user" action="account"><g:message code="ni.com.lora.main"/></g:link>
							</g:if>
							<g:else if test="${session?.user?.role == 'user'}">
								<g:link controller="buy" action="list"><g:message code="ni.com.lora.main"/></g:link>
							</g:else>
						</li>
						<li><g:link controller="profile" action="profile"><g:message code="ni.com.lora.settings"/></g:link></li>
						<li class="divider"></li>
						<li><g:link controller="user" action="logout"><g:message code="ni.com.lora.logout"/></g:link></li>
					</ul>
				</li>
			</ul>	
		</div>
	</div>
</navbar>