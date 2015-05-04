# create text_book

<% if @text_book.errors.empty? %>
  location.reload(true)
<% else %>
  alert('<%= escape_javascript @text_book.errors.full_messages.join("\n") %>')
<% end %>
