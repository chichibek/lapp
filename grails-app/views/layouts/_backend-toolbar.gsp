<div class="row">
	<div class="span1">
		<g:link action="create" id="${params.id}" class="btn"><i class="icon-plus"></i></g:link>
	</div>
	<div class="span9">
		<g:form controller="search" action="search" class="form-inline pull-right">
			<g:textField name="query" value="${params?.query}"/>
			<g:submitButton name="${message(code:'ni.com.lora.search')}" class="btn"/>
		</g:form>
	</div>
</div>