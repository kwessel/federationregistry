<%@ page contentType="text/html"%>

<g:applyLayout name="email">
  <html>
    <head></head>
    <body>

      Unfortunately the Service Provider you've registered has not been accepted into the federation at this time.
      <br><br>
      The details of the Service Provider that was rejected are shown below.
      <br><br>
      <table>
        <tr>
          <td>
            <strong><g:message code="label.internalid" /></strong>: 
          </td>
          <td>
            ${fieldValue(bean: serviceProvider, field: "id")}
          </td>
        </tr>
        <tr>
          <td>
            <strong><g:message code="label.displayname" /></strong>: 
          </td>
          <td>
            ${fieldValue(bean: serviceProvider, field: "displayName")}
          </td>
        </tr>
        <tr>
          <td>
            <strong><g:message code="label.description" /></strong>: 
          </td>
          <td>
            ${fieldValue(bean: serviceProvider, field: "description")}
          </td>
        </tr>
        <tr>
          <td>
            <strong><g:message code="label.entitydescriptor" /></strong>: 
          </td>
          <td>
            ${fieldValue(bean: serviceProvider, field: "entityDescriptor.entityID")}
          </td>
        </tr>
        <tr>
          <td>
            <strong><g:message code="label.organization" /></strong>: 
          </td>
          <td>
            ${fieldValue(bean: serviceProvider, field: "organization.displayName")}
          </td>
        </tr>
      </table>
    
      <br><br>
      If you have any questions about why this Service Provider was not accepted please contact the <a href="http://support.aaf.edu.au">AAF support desk</a>.
    
    </body>
  </html>
</g:applyLayout>