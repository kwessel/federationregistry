
<g:if test="${endpoints}">
<table>
	<tbody>
	<g:each in="${endpoints.sort{it.id} }" status="i" var="ep">
		<tr>
			<td colspan="3"><h4><g:message code="label.endpoint"/> ${i+1}</h4></td>
		</tr>
		<tr>
			<th><g:message code="label.status" /></th>
			<td>
			<g:if test="${ep.active}">
				<div class="icon icon_tick"><g:message code="label.active" /></div>
			</g:if>
			<g:else>
				<div class="icon icon_cross"><g:message code="label.inactive" /></div>
			</g:else>
			</td>
			<td>
				<n:confirmaction action="fedreg.endpoint_toggle(${ep.id}, '${endpointType}', '${containerID}' );" title="${message(code: 'fedreg.template.endpoints.toggle.confirm.title')}" msg="${message(code: 'fedreg.template.endpoints.toggle.confirm.descriptive')}" accept="${message(code: 'label.accept')}" cancel="${message(code: 'label.cancel')}" label="${message(code: 'label.togglestate')}" icon="refresh" />
			</td>
		</tr>
		<tr>
			<th><g:message code="label.location" /></th>
			<td>${ep.location.uri.encodeAsHTML()}</td>
			<td>
				<g:if test="${allowremove}">
						<n:confirmaction action="fedreg.endpoint_delete(${ep.id}, '${endpointType}', '${containerID}' );" title="${message(code: 'fedreg.template.endpoints.remove.confirm.title')}" msg="${message(code: 'fedreg.template.endpoints.remove.confirm.descriptive')}" accept="${message(code: 'label.accept')}" cancel="${message(code: 'label.cancel')}" label="${message(code: 'label.delete')}" icon="trash" />
				</g:if>
			</td>
		</tr>
		<g:if test="${resloc}">
		<tr>
			<th><g:message code="label.responselocation" /></th>
			<td colspan="2">${(ep.responseLocation?.uri ?:ep.location.uri).encodeAsHTML()}</td>
		</tr>
		</g:if>
		<tr>
			<th><g:message code="label.binding" /></th>
			<td>${ep.binding.uri.encodeAsHTML()}</td>
			<td/>
		</tr>
		<g:if test="${i+1 != endpoints.size()}">
		<tr>
			<td colspan="3"><hr></td>
		</tr>
		</g:if>
	</g:each>
	</tbody>
</table>
</g:if>
<g:else>
	<div>
		<p class="icon icon_information"><g:message code="fedreg.template.endpoints.noresults"/></p>
	</div>
</g:else>