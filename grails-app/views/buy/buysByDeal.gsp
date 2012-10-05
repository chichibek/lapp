<!DOCTYPE html>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="panel">
	<title></title>
	<r:require modules="common, commonJS"/>
</head>
<body>
	<div class="row">
		<div class="span5">
			<g:link controller="deal" action="list" params="[id:params.company]" class="btn"><i class="icon-chevron-left"></i></g:link>
		</div>
		<div class="span5">
			<g:link controller="deal" action="detail" params="[id:params.id,company:params.company,back:actionName]" class="btn pull-right"><g:message code="ni.com.lora.dealinfo"/></g:link>
		</div>
	</div>
	<br>
	<g:if test="${buyInstanceList}">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th><g:message code="ni.com.lora.deal"/></th>
					<th><g:message code="ni.com.lora.user"/></th>
					<th><g:message code="ni.com.lora.address"/></th>
					<th><g:message code="ni.com.lora.email"/></th>
					<th><g:message code="ni.com.lora.identitycard"/></th>
					<th><g:message code="ni.com.lora.quantity"/></th>
					<th><g:message code="ni.com.lora.total"/></th>
					<th><g:message code="ni.com.lora.paid"/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${buyInstanceList}" var="buy" status="i">
				<tr>
					<td>${i}</td>
					<td>${buy?.deal}</td>
					<td>${buy?.user}</td>
					<td><g:include controller="user" action="getUserInfo" params="[user:buy?.user, flag:'address']"/></td>
					<td><g:include controller="user" action="getUserInfo" params="[user:buy?.user, flag:'email']"/></td>
					<td><g:include controller="user" action="getUserInfo" params="[user:buy?.user, flag:'identityCard']"/></td>
					<td>${buy?.quantity}</td>
					<td>${buy?.quantity * buy?.deal?.price}</td>
					<td>
						<g:link action="changePaidState" params="[id:buy.id,deal:params.id,company:params.company]" class="btn btn-mini">
							<lapp:isPaid paid="${buy.paid}"/>
						</g:link>
					</td>
				</tr>
				</g:each>
			</tbody>
		</table>
	</g:if>
</body>
</html>