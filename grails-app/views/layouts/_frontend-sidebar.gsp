<g:if test="${session?.user}">
	<ul class="nav nav-tabs nav-stacked">
		<li><g:link uri="/"><g:message code="ni.com.lora.alldeals"/></g:link><li>
	</ul>	
</g:if>

<ul class="nav nav-tabs nav-stacked">
	<li><g:link controller="deal" action="custom"><g:message code="ni.com.lora.custombuild"/></g:link><li>
	<li><g:link controller="deal" action="custom"><g:message code="ni.com.lora.companycategories"/></g:link></li>
	<li><g:link controller="company" action="companiesList"><g:message code="ni.com.lora.companylist"/></h5></g:link></li>
 </ul>

<ul class="nav nav-tabs nav-stacked">
	<li><g:link uri="/faq">Faq's</g:link></li>
	<li><g:link uri="/promise">Nuestra promesa</g:link></li>
	<li><g:link uri="/howitswork"><g:message code="ni.com.lora.howitworks"/></g:link></li>
</ul>