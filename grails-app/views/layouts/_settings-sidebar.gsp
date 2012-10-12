<!--TODO:fix main link for every user role-->
<ul class="nav nav-tabs nav-stacked">
	<li>
		<g:if test="${session?.user?.role == 'admin'}">
			<g:link controller="user" action="account"><g:message code="ni.com.lora.main"/></g:link>
		</g:if>
		<g:else if test="${session?.user?.role == 'user'}">
			<g:link controller="buy" action="list"><g:message code="ni.com.lora.main"/></g:link>
		</g:else>
	</li>
	<li>
		<g:link controller="user" action="account">
			<g:message code="ni.com.lora.account"/>
		</g:link>
	</li>
	<li>
		<g:link controller="user" action="password">
			<g:message code="ni.com.lora.updatePassword"/>
		</g:link>
	</li>
	<li>
		<g:link controller="profile">
			<g:message code="ni.com.lora.profile"/>
		</g:link>
	</li>
</ul>