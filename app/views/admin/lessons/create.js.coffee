# create lesson

<% if @lesson.errors.empty? %>
  location.reload(true)
<% else %>
  alert('<%= escape_javascript @lesson.errors.full_messages.join("\n") %>')
<% end %>
