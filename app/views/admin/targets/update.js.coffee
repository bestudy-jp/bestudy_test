# update target

<% if @target.errors.empty? %>
  location.reload(true)
<% else %>
  alert('<%= escape_javascript @target.errors.full_messages.join("\n") %>')
<% end %>
