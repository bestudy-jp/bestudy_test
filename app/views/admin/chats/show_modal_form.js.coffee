$('.modal-form').html( '<%= escape_javascript( render :partial => 'admin/chats/form' ) %>' )
$('#modalForm').modal()
