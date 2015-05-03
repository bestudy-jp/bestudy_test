$('.modal-form').html( '<%= escape_javascript( render :partial => 'admin/questions/form' ) %>' )
$('#modalForm').modal()
