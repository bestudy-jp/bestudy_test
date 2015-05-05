# update genre

<% if @genre.errors.empty? %>
  location.reload(true)
<% else %>
  alert('<%= escape_javascript @genre.errors.full_messages.join("\n") %>')
<% end %>
