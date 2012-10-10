<label for="username"><g:message code="ni.com.lora.username"/></label>
<g:textField name="userName" value="${userInstance?.userName}" class="span4" autofocus="true"/>

<label for="fullName"><g:message code="ni.com.lora.fullname"/></label>
<g:textField name="profile.fullName" value="${userInstance?.profile?.fullName}" class="span4"/>

<label for="email"><g:message code="ni.com.lora.email"/></label>
<g:textField name="email" value="${userInstance?.email}" class="span4"/>

<label for="address"><g:message code="ni.com.lora.address"/></label>
<g:textField name="address" value="${userInstance?.address}" class="span4"/>

<label for="identityCard"><g:message code="ni.com.lora.identitycard"/></label>
<g:textField name="identityCard" value="${userInstance?.identityCard}" class="span4"/>