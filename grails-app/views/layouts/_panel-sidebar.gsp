<lapp:isAdmin>
<ul class="nav nav-tabs nav-stacked">
	<li><g:link controller="user" action="list" params="[role:'client']"><g:message code="ni.com.lora.client"/></g:link></li>
	<li><g:link controller="deal" action="activeDeals"><g:message code="ni.com.lora.activedeals"/></g:link></li>
</ul>
</lapp:isAdmin>

<ul class="nav nav-tabs nav-stacked">
	<lapp:isAdmin>
		<li>
			<g:link controller="user" action="list" params="[role:'user']" elementId="newusers" rel="popover">
				<g:include controller="user" action="countNewUsers"/> 
				<g:message code="ni.com.lora.newusernotification"/>
			</g:link>
		</li>
	</lapp:isAdmin>
	<li>
		<g:link controller="buy" action="listNewBuys">
			<g:include controller="buy" action="countNewBuys"/> 
			<g:message code="ni.com.lora.newbuynotification"/>
		</g:link>
	</li>
	<li>
		<g:link controller="deal" action="listClosedDeals">
			<g:include controller="deal" action="countClosedDeals"/> 
			<g:message code="ni.com.lora.newdealclosenotification"/>
		</g:link>
	</li>
</ul>