<div class="well well-small">
	${dealInstance?.toDate - dealInstance?.fromDate} <g:message code="ni.com.lora.daylefttobuy"/> 
</div>

<div class="well well-small">
	${dealInstance?.itemsToSale} <g:message code="ni.com.lora.productsinstock"/>
</div>


	<h5><g:message code="ni.com.lora.where"/></h5>
	<ul>
		<g:each in="${dealInstance?.subsidiaries}" var="subsidiary">
			<li>${subsidiary?.name}</li>
		</g:each>
	</ul>

	<h5><g:message code="ni.com.lora.when"/></h5>
	<g:message code="ni.com.lora.from"/> <g:formatDate date="${dealInstance?.claimFrom}" type="date" style="medium"/> <g:message code="ni.com.lora.to"/> <g:formatDate date="${dealInstance?.claimUp}" type="date" style="medium"/>

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