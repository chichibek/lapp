<div class="row">
	<div class="span1">
		<g:if test="${actionName == 'list'}">
			<g:link action="create" id="${params.id}" class="btn"><i class="icon-plus"></i></g:link>
		</g:if>
		<g:else>			
			<g:if test="${actionName == 'create'}">
				<g:link action="list" id="${params.id}" class="btn"><i class="icon-chevron-left"></i></g:link>
			</g:if>
			<g:else>
				<g:if test="${params.back}">
					<g:link controller="buy" action="buysByDeal" params="[id:params.id,company:params.company]" class="btn"><i class="icon-chevron-left"></i></g:link>
				</g:if>
				<g:else>
					<g:link action="list" id="${params.company}" class="btn"><i class="icon-chevron-left"></i></g:link>
				</g:else>
			</g:else>
		</g:else>
	</div>
	<div class="span9">
		<g:form controller="search" action="search" class="form-inline pull-right">
			<g:textField name="query" value="${params?.query}"/>
			<g:submitButton name="${message(code:'ni.com.lora.search')}" class="btn"/>
		</g:form>
	</div>
</div>