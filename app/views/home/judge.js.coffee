<% if @self_message %>
window.talk.appendMessage(false, '<%= @self_message %>')
<% end %>

<% @messages.each do |message| %>
  <% content = message[:content] %>
  <% selections = message[:selections] || [] %>
  <% delay = message[:delay] %>
  <% if selections %>
selections = JSON.parse('<%= raw JSON.generate(selections) %>')
  <% end %>
setTimeout(->
  window.talk.appendMessage(true, '<%= content %>', selections)
, <%= delay %>)
<% end %>
