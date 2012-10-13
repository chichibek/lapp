<div id="productlogo">
	<g:each in="${allProduct}" var="product" status="i">
		<g:if test="${product?.avatar}">
			<div class="pull-right">
				<img src="${createLink(action:'renderProductAvatar', id:product?.id)}" alt="${product?.name}" class="img-polaroid">
				<br>
				${product.name} - ${product.price}
			</div>
		</g:if>
	</g:each>
</div>