<div class="row">
	<div class="span9">
		<g:form controller="company" action="companiesByCategory" class="form-inline pull-right">
			<g:select name="companyService" from="${companies.constraints.companyService.inList}" value="${companies.companyService}" valueMessagePrefix="companies?.companyService"/>
			<g:submitButton name="send" value="${message(code:'ni.com.lora.search')}" class="btn"/>
		</g:form>
	</div>
</div>