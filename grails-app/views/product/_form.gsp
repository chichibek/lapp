<label for="avatar"><g:message code="ni.com.lora.avatar"/></label>
<input type="file" name="avatar" id="avatar"/>

<label for="name"><g:message code="ni.com.lora.product.name"/></label>
<g:textField name="name" value="${productInstance?.name}" class="span4" autofocus="true" autocomplete="off"/>

<label for="price"><g:message code="ni.com.lora.product.price"/></label>
<g:textField name="price" value="${productInstance?.price}" class="span4"/>