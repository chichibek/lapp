<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="common,commonJS"/>
</head>
<body>
	<legend>
		<g:message code="ni.com.lora.updateProfile"/>
	</legend>
	<div class="row">
		<div class="span5">
			<g:uploadForm name="form" action="updateProfile">
				<label for="avatar"><g:message code="ni.com.lora.avatar"/></label>
				<input type="file" name="avatar" id="avatar"/>
				<label for="fullName"><g:message code="ni.com.lora.fullname"/></label>
				<g:textField name="fullName" value="${fieldValue(bean:userProfileInstance, field:'fullName')}" class="span4"/>
				<label for="gender"><g:message code="ni.com.lora.gender"/></label>
				<g:select name="gender" from="${['male','female']}" value="${fieldValue(bean:userProfileInstance, field:'gender')}"/>
				<label for="birthDay"><g:message code="ni.com.lora.birthDay"/></label>
				<g:textField name="birthDay" value="${formatDate(format:'yyyy-MM-dd',date:userProfileInstance?.birthDay)}"/>
				<label for="city"><g:message code="ni.com.lora.city"/></label>
				<g:select name="city" from="${['Leon','Esteli','Matagalpa']}" value="${fieldValue(bean:userProfileInstance, field:'city')}"/>
				<br>
				<g:submitButton name="send" value="${message(code:'ni.com.lora.update')}" class="btn"/>
			</g:uploadForm>
		</div>
		<div class="span4">
			<g:if test="${userProfileInstance?.avatar}">
				<img src="${createLink(action:'renderAvatar')}"/>
				<br>
				<g:link action="unlinkAvatar">x</g:link>
			</g:if>
		</div>
	</div>
</body>
</html>
