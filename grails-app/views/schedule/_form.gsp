<label for="fromDay"><g:message code="ni.com.lora.fromday"/></label>
<g:select name="fromDay" from="${['Sunday','Monday','Thusday','Wednesday','Thursday','Friday','Saturday']}" value="${scheduleInstance?.fromDay}"/>

<label for="toDay"><g:message code="ni.com.lora.today"/></label>
<g:select name="toDay" from="${['Sunday','Monday','Thusday','Wednesday','Thursday','Friday','Saturday']}" value="${scheduleInstance?.toDay}"/>

<label for="fromHour"><g:message code="ni.com.lora.fromhour"/></label>
<g:select name="fromHour" from="${scheduleInstance?.constraints?.fromHour?.inList}" value="${scheduleInstance?.fromHour}"/>

<label for="toHour"><g:message code="ni.com.lora.tohour"/></label>
<g:select name="toHour" from="${scheduleInstance?.constraints?.toHour?.inList}" value="${scheduleInstance?.toHour}"/>