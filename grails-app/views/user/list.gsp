<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common, commonJS, list"/>
</head>
<body>
	<g:if test="${userInstanceList}">
		<div class="btn-toolbar">
			<div class="btn-group">
				<g:link action="create" params="[role:params?.role]" class="btn"><i class="icon-plus"></i></g:link>
			</div>
			<div class="btn-group">
				<g:link action="list" params="[role:'admin']" class="btn"><g:message code="ni.com.lora.admin"/></g:link>
				<g:link action="list" params="[role:'user']" class="btn"><g:message code="ni.com.lora.user"/></g:link>
				<g:link action="list" params="[role:'client']" class="btn"><g:message code="ni.com.lora.client"/></g:link>
			</div>
		</div>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th><i class="icon-home"></i></th>
					<th><i class="icon-pencil"></i></th>
					<th><i class="icon-wrench"></i></th>
					<th><i class="icon-trash"></i></th>
					<th><g:message code='ni.com.lora.username'/></th>
					<th><g:message code='ni.com.lora.email'/></th>
					<th><g:message code='ni.com.lora.identitycard'/></th>
					<th><g:message code='ni.com.lora.role'/></th>
					<th><g:message code='ni.com.lora.isenabled'/></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${userInstanceList}">
				<tr>
					<td style="width:1px;"><g:link controller="company" id="${it.id}"><i class="icon-home"></i></g:link></td>
					<td style="width:1px;"><g:link action="showClient" params="[id:it.id, role:params.role]"><i class="icon-pencil"></i></g:link></td>
					<td style="width:1px;"><g:link action="edit" params="[id:it.id, role:params.role]"><i class="icon-wrench"></i></g:link></td>
					<td style="width:1px;">
						<g:link action="delete" params="[id:it.id, role:params.role]" Onclick="return confirm('${message(code: 'ni.com.lora.delete')}');">
							<i class="icon-trash"></i>
						</g:link>
					</td>	
					<td><g:fieldValue bean="${it}" field="userName"/></td>
					<td><g:fieldValue bean="${it}" field="email"/></td>
					<td><g:fieldValue bean="${it}" field="identityCard"/></td>
					<td>${it?.role?.capitalize()?.encodeAsHTML()}</td>
					<td><g:link action="changeEnabledState" params="[id:it.id, role:params.role]" class="btn btn-mini"><lapp:isEnabled state="${it.enabled}"/></g:link></td>
				</tr>
			    </g:each>
			</tbody>
		</table>
	</g:if>
	<g:else>
		<g:message code="ni.com.lora.nothingtoshow"/>
	</g:else>
	<!--POPOVER-->
	<div class="popover fade right in">
		<div class="arrow"></div>
		<div class="popover-inner">
			<h3 class="popover-title">A Title</h3>
		<div class="popover-content">
			<p>And here's some amazing content. It's very engaging. right?</p>
		</div>
		</div>
	</div>
</body>
</html>