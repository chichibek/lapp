<g:if test="${actionName == 'listClient' || actionName == 'showClient'}">
	<div class="row">
		<div class="span1">
			<g:link action="createClient" class="btn"><i class="icon-plus"></i></g:link>
		</div>
		<div class="span9">
			<g:if test="${actionName == 'listClient'}">
				<g:form controller="search" action="search" class="form-inline pull-right">
					<g:textField name="query" value="${params?.query}"/>
					<g:submitButton name="${message(code:'ni.com.lora.search')}" class="btn"/>
				</g:form>
			</g:if>
		</div>
	</div>
</g:if>