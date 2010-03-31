<script type="text/javascript">
	$(function() {
		certificateDialogInit();
		$("#newcertificate").hide();
		
		$("#addcertficatelink").click(function() {
			$("#addcertificate").hide();
			$("#newcertificate").show('slide');
		});
		
		$("#closenewcertificatelink").click(function() {
			$("#searchcontact").hide('slide');
			$("#availablecontacts").hide();
			$("#addcontact").show('slide');
			$("#availablecontacts").empty();
		});
		
		$("#newcertificatedata").bind('paste', function() { setTimeout(function() {verifyNewCertificateData();}, 100); });
	});
	
	function certificateDialogInit() {
		$("#certificateconfirmationdialog").dialog({
			bgiframe: true,
			resizable: false,
			modal: true,
			autoOpen: false,
			width: 400,
			overlay: {
				backgroundColor: '#000',
				opacity: 0.5
			}
		});
	}
	
	function verifyNewCertificateData() {
		$("#working").trigger("fedreg.working");
		var dataString = "cert=" + $("#newcertificatedata").val();
		$.ajax({
			type: "POST",
			url: newCertificateValidationEndpoint,
			data: dataString,
			success: function(res) {
				$("#newcertificatedetails").html(res)
		    },
		    error: function (xhr, ajaxOptions, thrownError) {
				growl('error', xhr.responseText);
		    }
		});
	}
</script>

<div id="certificatemanagement">
	<div id="addcertificate" class="searcharea">
		<a id="addcertficatelink" href="#" class="button icon icon_add"><g:message code="fedreg.link.addcertficate"/></a>
	</div>
	
	<div id="newcertificate">
		<h4>Add new certificate</h4>
		<p>Paste your PEM formatted public key below</p>
		<g:textArea name="newcertificatedata" rows="50" cols="120"/>
		<div id="newcertificatedetails">
		</div>
	</div>

	<div id="certificateconfirmationdialog" title="Add Certificate">
		<div class="popup">
			<p><g:message code="fedreg.template.certificate.confirmaddition"/></p>
			<div class="buttons">
				<a href="#" class="modal_close button icon icon_accept" onClick="addCertificate();">Accept</a>
				<a href="#" onClick="$('#certificateconfirmationdialog').dialog('close');" class="modal_close button icon icon_cancel">Cancel</a>    
			</div>
		</div>
	</div>
</div>