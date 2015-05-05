# destroy chat

<% if @chat.errors.empty? %>
  location.reload(true)
<% else %>
  alert('<%= escape_javascript @chat.errors.full_messages.join("\n") %>')
<% end %>
