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
if $('.talk-container').height() <= $(window).height() - $('.select-container').height() - 20
  $('.talk-container').css('padding-bottom', $(window).height() - $('.talk-container').height() - $('.select-container').height() - 20)
else
  $('.talk-container').css('padding-bottom', 'inherit')

<% if @messages.count <= 0 %>
$('body').fadeOut(1000)
setTimeout(->
  location.href = '/home/done'
, 1500)
<% end %>
