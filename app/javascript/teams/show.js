toggleSidebar = () => {
  let sidebar = document.querySelector('.side-nav-channel');
  if(sidebar.style.display == 'block'){
    sidebar.style.display = 'none';
  } else {
    sidebar.style.display = 'block';
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const channel_id = document.querySelector('ul.channels > li > div > div > a > span').getAttribute('id');
  if (channel_id != undefined)
    window.open(channel_id, 'channels')
})

document.addEventListener('DOMContentLoaded', () => {
  const channels = document.querySelectorAll('.open_channel')
  channels.forEach(channel => {
    channel.addEventListener('click', (e) => {
      window.open(e.target.id, 'channels')
      document.getElementById('message_messagable_type').setAttribute('value', 'Channel')
      document.getElementById('message_messagable_id').setAttribute('value', e.target.id)
    })
  });
});
