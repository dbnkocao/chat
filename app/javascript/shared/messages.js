let set_chat = (name) => {
  document.querySelector('.chat_name').innerHTML = name;
}

let clean_messages = () => {
  document.querySelector('.messages').innerHTML = "";
  document.querySelector('.chat_name').innerHTML = "";
}

window.add_message = (message, message_date, name) => {
  const messages = document.querySelector('.messages');
  let messages_text = ""
  
  messages_text += '<div class="message col s12">' +
    '<div class="col m2 l1">' +
    '<i class="material-icons prefix right profile_icon">account_circle</i>' +
    '</div>' +
    '<div class="col m10 s9">' +
    '<div class="row">' +
    '<b>' + name + '</b> <span class="date">' + message_date + '</span>' +
    '</div>' +
    '<div class="row">' + message + '</div>' +
    '</div>' +
    '</div>'
  
  messages.insertAdjacentHTML('beforeend', messages_text);

}

window.open = async (id, type) => {
  clean_messages();
  const response = await fetch(`/${type}/${id}.json`);
  const data = await response.json();

  if (type == "talks")
    set_chat(data['user']['name']);
  else
    set_chat(data['slug']);

  // const team_id = document.querySelector(".team_id").getAttribute("value");
  // window.change_chat(id, type, team_id)

  if (data['messages']) {
    data['messages'].forEach((message, index) => {
      window.add_message(message.body, message.date, message.user_name)
    })
  }

  //     error: (jqXHR, textStatus, errorThrown) ->
  //       Materialize.toast('Problem to get ' + type + ' informations &nbsp;<b>:(</b>', 4000, 'red')

  return false

}

window.add = (slug, id, type) => {
  additional = type == "channel" ? "#" : "";
  target = document.querySelector(`.${type}`);
  target.prepend(
    '<li class="' + type + '_' + id + '">' +
    '  <div>' +
    '<a href="#" class="open_' + type + '">' +
    '<span id="' + id + '">' + additional + slug + '</span>' +
    '</a>' +
    '<a class="right remove_' + type + '" href="#" id="' + id + '">' +
    '<i class="material-icons" id="' + id + '">settings</i>' +
    '</a>' +
    '</div>' +
    '</li>'
  );

}