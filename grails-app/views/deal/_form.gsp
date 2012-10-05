<label for="product"><g:message code="ni.com.lora.product"/></label>
<g:select name="product" from="${companyInstance?.products}" optionKey="name" value="${dealInstance?.product}"/>

<label for="price"><g:message code="ni.com.lora.price"/></label>
<g:textField name="price" value="${dealInstance?.price}"/>

<label for="itemsToSale"><g:message code="ni.com.lora.itemstosale"/></label>
<g:textField name="itemsToSale" value="${dealInstance?.itemsToSale}"/>

<label for="fromDate"><g:message code="ni.com.lora.fromdate"/></label>
<g:textField name="fromDate" value="${dealInstance?.fromDate}"/>

<label for="toDate"><g:message code="ni.com.lora.todate"/></label>
<g:textField name="toDate" value="${dealInstance?.toDate}"/>

<label for="claimFrom"><g:message code="ni.com.lora.claimfrom"/></label>
<g:textField name="claimFrom" value="${dealInstance?.claimFrom}"/>

<label for="claimUp"><g:message code="ni.com.lora.claimup"/></label>
<g:textField name="claimUp" value="${dealInstance?.claimUp}"/>

<label for="gender"><g:message code="ni.com.lora.gender"/></label>
<g:select name="gender" from="${dealInstance?.constraints?.gender?.inList}" value="${dealInstance?.gender}"/>

<label for="age"><g:message code="ni.com.lora.age"/></label>
<g:select name="age" from="${dealInstance?.constraints?.age?.inList}" value="${dealInstance?.age}"/>

<label for=""><g:message code="ni.com.lora.branchs"/></label>
<g:each in="${companyInstance?.branches}" var="branch">
	<g:if test="${dealInstance.subsidiaries?.name?.contains(branch?.name)}">
		<g:checkBox name="${branch?.name}" checked="true"/> ${branch?.name?.encodeAsHTML()}
	</g:if>
	<g:else>
		<g:checkBox name="${branch?.name}"/> ${branch?.name?.encodeAsHTML()}
	</g:else>
	<br>
</g:each>

<br>

<label for="description"><g:message code="ni.com.lora.description"/></label>
<g:textArea name="description" value="${dealInstance?.description}"/>