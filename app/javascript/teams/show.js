toggleSidebar = () => {
  let sidebar = document.querySelector('.side-nav-channel');
  if(sidebar.style.display == 'block'){
    sidebar.style.display = 'none';
  } else {
    sidebar.style.display = 'block';
  }
}

// document.addEventListener('DOMContentLoaded', () => {
//   channels = document.querySelectorAll('.open_channel');
//   channels.forEach(channel => {
//     channel.addEventListener('click', () => {
//       console.log(channel.dataset.id);

//     });
//   });
// });

document.addEventListener('DOMLoadedContent', () => {
  const channel_id = document.querySelector('ul.channels li:first div a span').getAttribute('id')
  
  if (channel_id != undefined)
    window.open($('ul.channels li:first div a span').attr('id'), 'channels')
})

document.addEventListener('DOMContentLoaded', () => {
  const channels = document.querySelectorAll('.open_channel')
  channels.forEach(channel => {
    channel.addEventListener('click', (e) => {
      window.open(e.target.id, 'channels')
    })
  });
});
