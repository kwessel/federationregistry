
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="compliance" />
        <g:set var="entityName" value="${message(code: 'identityProviderAttributeCompliance.label')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
	
		<h2><g:message code="compliance.attributes.identityprovider.label" args="${[idp?.organization?.displayName]}" /></h2>
		
		<div class="categorysummary">
		<g:each in="${categorySupport}" status="i" var="currentStatus">
			<div class="category">
				<h3>${currentStatus.name}</h3>
				<div class="numeric">
					<strong>${currentStatus.supportedCount.encodeAsHTML()}<span class="total"> / ${currentStatus.totalCount.encodeAsHTML()}</span></strong>
				</div>
				<div class="graphic">	
					
						<img src="http://chart.apis.google.com/chart?
						chs=225x50
						&chco=2dac3f,ea2f31
						&chd=t:${currentStatus.supportedCount.encodeAsHTML()},${(currentStatus.totalCount -currentStatus.supportedCount).encodeAsHTML()}
						&chds=0,${currentStatus.totalCount.encodeAsHTML()},0,${currentStatus.totalCount.encodeAsHTML()}
						&cht=p3
						&chl=<g:message code="compliance.attributes.supported"/>|<g:message code="compliance.attributes.notsupported"/>"
						alt="${currentStatus.name} chart" />
					
				</div>
			</div>
		</g:each>
		</div>
		<div class="categorydetail">

			<g:each in="${categorySupport}" status="i" var="currentStatus">
				<div class="category">
					<div class="numeric">
						<strong>${currentStatus.name.encodeAsHTML()} - ${currentStatus.supportedCount}<span class="total"> / ${currentStatus.totalCount.encodeAsHTML()}</span></strong>
					</div>
				
					<table class="cleantable buttons">
	                    <thead>
	                        <tr>
                        
	                            <th><g:message code="attribute.label" /></th>
								<th/>
								<th/>
							                        
	                        </tr>
	                    </thead>
	                    <tbody>
	                    <g:each in="${currentStatus.available}" status="j" var="attr">
	                        <tr class="${(j % 2) == 0 ? 'odd' : 'even'}">
                        
	                            <td>${attr.friendlyName.encodeAsHTML()}</td>
                        
	                            <td>
									<g:if test="${currentStatus.supported.contains(attr)}">
										<span class="icon icon_tick"><g:message code="compliance.attributes.supported"/></span>
									</g:if>
									<g:else>
										<span class="icon icon_cross"><g:message code="compliance.attributes.notsupported"/></span>
									</g:else>
								</td>
								
								<td><g:link action="attribute" id="${attr.id}" class="button icon icon_view icon_view_attributeSupport"><g:message code="attributeSupport.view.label" /></g:link></td>
	                        </tr>
	                    </g:each>
	                    </tbody>
	                </table>
				</div>

			</g:each>
		</div>

	</body>
</html>
