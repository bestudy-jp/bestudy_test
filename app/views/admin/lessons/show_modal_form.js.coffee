$('.modal-form').html( '<%= escape_javascript( render :partial => 'admin/lessons/form' ) %>' )
$('#modalForm').modal()
