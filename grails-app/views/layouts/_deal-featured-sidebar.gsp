<table class="table table-condensed table-bordered">
	<thead>
		<tr>
			<th><g:message code="ni.com.lora.daylefttobuy"/></th>
			<th><g:message code="ni.com.lora.productsinstock"/></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${dealInstance?.toDate - dealInstance?.fromDate}</td>
			<td>${dealInstance?.itemsToSale}</td>
		</tr>
	</tbody>
</table>

<legend><g:message code="ni.com.lora.branchandschedules"/></legend>
<h5><g:message code="ni.com.lora.branch"/></h5>

<ul>
	<g:each in="${dealInstance?.subsidiaries}" var="subsidiary">
		<li>${subsidiary?.name}</li>
	</g:each>
</ul>

<h5><g:message code="ni.com.lora.claim"/></h5>
<table class="table table-condensed table-bordered">
	<thead>
		<tr>
			<th><g:message code="ni.com.lora.from"/></th>
			<th><g:message code="ni.com.lora.to"/></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${dealInstance}">
			<tr>
				<td><g:formatDate date="${it?.claimFrom}" type="datetime" style="SHORT"/></td>
				<td><g:formatDate date="${it?.claimUp}" type="datetime" style="SHORT"/></td>
			</tr>
		</g:each>
	</tbody>
	</table>
<h5><g:message code="ni.com.lora.schedule"/></h5>
	<table class="table table-condensed table-bordered">
		<thead>
			<tr>
				<th><g:message code="ni.com.lora.from"/></th>
				<th><g:message code="ni.com.lora.to"/></th>
				<th><g:message code="ni.com.lora.from"/></th>
				<th><g:message code="ni.com.lora.to"/></th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${dealInstance?.company?.schedules}" var="schedule">
				<tr>
					<td><g:fieldValue bean="${schedule}" field="fromDay"/></td>
					<td><g:fieldValue bean="${schedule}" field="toDay"/></td>
					<td><g:fieldValue bean="${schedule}" field="fromHour"/></td>
					<td><g:fieldValue bean="${schedule}" field="toHour"/></td>
				</tr>
			</g:each>
		</tbody>
</table>