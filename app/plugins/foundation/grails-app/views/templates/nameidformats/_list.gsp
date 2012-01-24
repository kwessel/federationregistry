<div id="nameidformats">
  <g:if test="${nameIDFormats}">
    <table class="borderless">
      <thead>
        <tr>
          <th><g:message code="label.supportedformat" /></th>
          <th><g:message code="label.description" /></th>
          <th/>
        </tr>
      </thead>
      <tbody>
      <g:each in="${ nameIDFormats.sort{it.id} }" status="i" var="nidf">
        <tr>
          <td>${nidf.uri.encodeAsHTML()}</td>
          <td>${nidf.description?.encodeAsHTML()}</td>
          <td>
            <fr:hasPermission target="descriptor:${descriptor.id}:nameidformat:remove">
              <a class="confirm-delete-nameid btn" data-formatid="${nidf.id}"><g:message code="label.delete"/></a>
            </fr:hasPermission>
          </td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </g:if>
  <g:else>
    <div>
      <p class="alert-message block-message error"><g:message code="fedreg.templates.nameidformats.noresults"/></p>
    </div>
  </g:else>
</div>