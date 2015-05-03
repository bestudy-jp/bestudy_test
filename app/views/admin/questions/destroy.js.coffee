# destroy question

<% if @question.errors.empty? %>
  location.reload(true)
<% else %>
  alert('<%= escape_javascript @question.errors.full_messages.join("\n") %>')
<% end %>
