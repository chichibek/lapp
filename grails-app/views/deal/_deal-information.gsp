<table class="table table-bordered table-hover">
	<tbody>
		<tr>
			<td><g:message code="ni.com.lora.state"/></td>
			<td><lapp:dealState state="${dealInstance?.state}"/></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.published"/></td>
			<td><span class="label label-info"><lapp:isPublished state="${dealInstance?.published}"/></span></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.product"/></td>
			<td><g:fieldValue bean="${dealInstance}" field="product"/></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.price"/></td>
			<td><g:fieldValue bean="${dealInstance}" field="price"/></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.itemstosale"/></td>
			<td>${dealInstance?.itemsToSale}</td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.itemssaled"/></td>
			<td><g:include controller="buy" action="totalItemsSaled" params="[deal:dealInstance]"/></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.fromdate"/></td>
			<td><g:formatDate formatDate="yyyy-MM-dd" type="date" style="medium" date="${dealInstance?.fromDate}"/></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.todate"/></td>
			<td><g:formatDate formatDate="yyyy-MM-dd" type="date" style="medium" date="${dealInstance?.toDate}"/></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.claimfrom"/></td>
			<td><g:formatDate formatDate="yyyy-MM-dd" type="date" style="medium" date="${dealInstance?.claimFrom}"/></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.claimup"/></td>
			<td><g:formatDate formatDate="yyyy-MM-dd" type="date" style="medium" date="${dealInstance?.claimUp}"/></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.gender"/></td>
			<td><g:fieldValue bean="${dealInstance}" field="gender"/></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.age"/></td>
			<td><g:fieldValue bean="${dealInstance}" field="age"/></td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.branchs"/></td>
			<td>
				<g:each in="${dealInstance?.subsidiaries}" var="subsidiary">
					<g:fieldValue bean="${subsidiary}" field="name"/>
					<br>
				</g:each>
			</td>
		</tr>
		<tr>
			<td><g:message code="ni.com.lora.description"/></td>
			<td><g:fieldValue bean="${dealInstance}" field="description"/></td>
		</tr>
	</tbody>
</table>