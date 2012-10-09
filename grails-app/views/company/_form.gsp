<label for="logo"><g:message code="ni.com.lora.logo"/></label>
<input type="file" name="logo" id="logo"/>

<label for="name"><g:message code="ni.com.lora.name"/></label>
<g:textField name="name" value="${companyInstance?.name}" class="span4" autofocus="true" autocomplete="off"/>

<label for="manager"><g:message code="ni.com.lora.manager"/></label>
<g:textField name="manager" value="${(companyInstance?.manager) ?: 'here should be the fullname of current client'}" class="span4"/>

<label for="telephone"><g:message code="ni.com.lora.telephone"/></label>
<g:textField name="telephone" value="${companyInstance?.telephone}" class="span4"/>

<label for="email"><g:message code="ni.com.lora.email"/></label>
<g:textField name="email" value="${companyInstance?.email}" class="span4"/>

<label for="companyService"><g:message code="ni.com.lora.companyservice"/></label>
<g:select name="companyService" from="${companyInstance.constraints.companyService.inList}" value="${companyInstance?.companyService}" valueMessagePrefix="companyInstance?.companyService" noSelection="['': '']"/>