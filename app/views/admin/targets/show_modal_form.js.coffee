$('.modal-form').html( '<%= escape_javascript( render :partial => 'admin/targets/form' ) %>' )
$('#modalForm').modal()
