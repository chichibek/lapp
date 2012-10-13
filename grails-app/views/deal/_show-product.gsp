<div id="productlogo">
	<g:each in="${allProduct}" var="product" status="i">
		<g:if test="${product?.avatar}">
		<img src="${createLink(action:'renderProductAvatar', id:product?.id)}" alt="${product?.name}" class="img-polaroid pull-left">
		</g:if>
		<br>
		<div>${product.name} - ${product.price}</div>
	</g:each>
</div>