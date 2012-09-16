<navbar class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="./index.html">Muerta la lora</a>
			<ul class="nav pull-right">
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