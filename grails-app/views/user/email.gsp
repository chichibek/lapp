<%@ page contentType="text/html"%>
<r:require module="common"/>
<h4>Hola ${user}</h4>
<hr>

<p>
<g:message code='ni.com.lora.messagemail'/>
</p>

<hr>

<label for="pass" class="pass"><g:message code='ni.com.lora.pass'/></label>: <div style="width:85px; height:20px; background:#BBE1EA; border-radius:3px; line-height:20px; padding-left:10px;"><b>${pass}</b></div>