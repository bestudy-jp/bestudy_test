$('.modal-form').html( '<%= escape_javascript( render :partial => 'admin/text_books/form' ) %>' )
$('#modalForm').modal()
