<% @chats.each do |chat| %>
window.talk.appendMessage(<%= chat.user_chat ? 'false' : 'true' %>, '<%= chat.message %>', null, '<%= chat.admin_name.blank? ? 'bestudy' : chat.admin_name %>')
$('#hidden-input-chat-id').val('<%= chat.id %>')
$('#hidden-input-from').val('<%= chat.created_at.strftime('%Y/%m/%d %H:%M:%S') %>')
<% end %>

