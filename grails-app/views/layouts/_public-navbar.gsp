<div class="navbar navbar-static-top navbar-inverse">
   <div class="navbar-inner">
      <div class="container">
   	  <g:link controller="deal" action="all" class="brand">Muerta la lora</g:link>
   	  <ul class="nav pull-right">
   		<li><g:link controller="deal" action="all"><g:message code="ni.com.lora.alldeals"/></g:link></li>
            <g:if test="${!session?.user}">
      		   <li><g:link controller="user" action="login"><g:message code="ni.com.lora.signlogin"/></g:link></li>
            </g:if>
            <g:else>
               <li><g:link controller="buy" action="list"><g:message code="ni.com.lora.settings"/></g:link></li>
               <li><g:link controller="user" action="logout"><g:message code="ni.com.lora.logout"/></g:link></li>
            </g:else>
   		</ul>
      </div>
   </div>
</div>