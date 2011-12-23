
<p><g:message code="fedreg.templates.servicecategories.descriptive" /></p>
  <g:if test="${categories}">
  <table>
    <thead>
      <tr>
        <th><g:message code="label.name" /></th>
        <th><g:message code="label.description" /></th>
        <th/>
      </tr>
    </thead>
    <tbody>
    <g:each in="${ categories.sort{it.id} }" status="i" var="cat">
      <tr>
        <td>${cat.name.encodeAsHTML()}</td>
        <td>${cat.description?.encodeAsHTML()}</td>
        <td>
          <fr:hasPermission target="descriptor:${descriptor.id}:category:remove">
            <a class="confirm-unlink-category btn" data-category="${cat.id}"><g:message code='label.delete'/></a>
          </fr:hasPermission>
        </td>
      </tr>
    </g:each>
    </tbody>
  </table>
  </g:if>
  <g:else>
    <div>
      <p class="alert-message block-message warn"><g:message code="fedreg.templates.servicecategories.noresults"/></p>
    </div>
  </g:else>

<div id="unlink-category-modal" class="modal hide fade">
  <div class="modal-header">
    <a href="#" class="close">×</a>
    <h3><g:message code="fedreg.templates.servicecategories.remove.confirm.title"/></h3>
  </div>
  <div class="modal-body">
    <p><g:message code="fedreg.templates.servicecategories.remove.confirm.descriptive"/></p>
  </div>
  <div class="modal-footer">
    <a class="btn close-modal"><g:message code="label.cancel" /></a>
    <a class="btn danger unlink-category"><g:message code="label.delete" /></a>
  </div>
</div>