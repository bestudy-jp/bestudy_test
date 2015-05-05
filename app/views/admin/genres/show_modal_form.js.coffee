$('.modal-form').html( '<%= escape_javascript( render :partial => 'admin/genres/form' ) %>' )
$('#modalForm').modal()
