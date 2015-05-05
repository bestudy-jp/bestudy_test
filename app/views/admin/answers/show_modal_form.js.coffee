$('.modal-form').html( '<%= escape_javascript( render :partial => 'admin/answers/form' ) %>' )
$('#modalForm').modal()
