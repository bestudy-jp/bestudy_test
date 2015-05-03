<% if @inquiry.errors.empty? %>
$('form#new_inquiry input[type=text], form#new_inquiry input[type=email], form#new_inquiry textarea').val('')
alert 'メッセージを送りました！'

<% else %>
console.log('error!')

<% end %>
