# update answer

<% if @answer.errors.empty? %>
  location.reload(true)
<% else %>
  alert('<%= escape_javascript @answer.errors.full_messages.join("\n") %>')
<% end %>
