<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<g:if test="${companyInstanceList}">
		<h5>${userInstance}</h5>
			<g:if test="${session?.user?.role == 'admin'}">
			<table class="table">
				<thead>
					<tr>
						<th><i class="icon-shopping-cart"></i></th>
						<th><i class="icon-home"></i></th>
						<th><i class="icon-list"></i></th>
						<th><i class="icon-calendar"></i></th>
						<th><i class="icon-pencil"></i></th>
						<th><i class="icon-wrench"></i></th>
						<th><i class="icon-trash"></i></th>
						<th><g:message code='ni.com.lora.name'/></th>
						<th><g:message code='ni.com.lora.manager'/></th>
						<th><g:message code='ni.com.lora.telephone'/></th>
						<th><g:message code='ni.com.lora.email'/></th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${companyInstanceList}">
					<tr>
						<td><g:link controller="deal" params="[id:it.id,company:params.id]"><i class="icon-shopping-cart"></i></g:link></td>
						<td><g:link controller="branch" params="[id:it.id,company:params.id]"><i class="icon-home"></i></g:link></td>
						<td><g:link controller="product" params="[id:it.id,company:params.id]"><i class="icon-list"></i></g:link></td>
						<td><g:link controller="schedule" params="[id:it.id,company:params.id]"><i class="icon-calendar"></i></g:link></td>
						<td><g:link action="show" params="[id:it.id,company:params.id]"><i class="icon-pencil"></i></g:link></td>
						<td><g:link action="edit" params="[id:it.id,company:params.id]"><i class="icon-wrench"></i></g:link></td>
						<td>
							<g:link action="delete" params="[id:it.id,company:params.id]" Onclick="return confirm('${message(code:'ni.com.lora.delete')}');">
								<i class="icon-trash"></i>
							</g:link>
						</td>
						<td><g:fieldValue bean="${it}" field="name"/></td>
						<td><g:fieldValue bean="${it}" field="manager"/></td>
						<td><g:fieldValue bean="${it}" field="telephone"/></td>
						<td><g:fieldValue bean="${it}" field="email"/></td>
					</tr>
				    </g:each>
				</tbody>
			</table>
		</g:if>
		<g:elseif test="${session?.user?.role == 'client'}">
			<g:each in="${companyInstanceList}" var="company">
				<div class="well well-small">
					<div class="row">
						<div class="span1">
							<g:if test="${company?.logo}">
								<img src="${createLink(controller:'company', action='renderLogo', id:company.id)}" alt="${company?.name}" class="img-polaroid">
							</g:if>
							<g:else>
								<r:img uri="/images/persona.jpg" class="img-polaroid"/>
							</g:else>
						</div>
						<div class="span8">
							<table>
								<tbody>
									<tr>
										<td><strong><g:message code="ni.com.lora.name"/></strong></td>
										<td>${company?.name}</td>
									</tr>
									<tr>
										<td><strong><g:message code="ni.com.lora.manager"/></strong></td>
										<td>${company?.manager}</td>
									</tr>
									<tr>
										<td><strong><g:message code="ni.com.lora.companyservice"/></strong></td>
										<td>${company?.companyService}</td>
									</tr>
									<tr>
										<td><strong><g:message code="ni.com.lora.telephone"/></strong></td>
										<td>${company?.telephone}</td>
									</tr>
									<tr>
										<td><strong><g:message code="ni.com.lora.email"/></strong></td>
										<td>${company?.email}</td>
									</tr>
									<tr>
										<td><strong><g:message code="ni.com.lora.datecreated"/></strong></td>
										<td><g:formatDate date="${company?.dateCreated}" type="datetime" style="MEDIUM"/></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="span10">
							<div class="btn-toolbar">
								<div class="btn-group">
									<g:link controller="branch" action="list" class="btn"><i class="icon-home"></i></g:link>	
									<g:link controller="branch" action="list" class="btn"><i class="icon-list"></i></g:link>	
									<g:link controller="branch" action="list" class="btn"><i class="icon-calendar"></i></g:link>	
								</div>
								<div class="btn-group">
									<g:link controller="branch" action="list" class="btn"><i class="icon-shopping-cart"></i></g:link>
								</div>
							</div>
						</div>
					</div>
				</div>
			</g:each>
		</g:elseif>
	</g:if>
	<g:else>
		<div class="alert">
			<g:message code="ni.com.lora.nothingtoshow"/>
		</div>
	</g:else>
</body>
</html>