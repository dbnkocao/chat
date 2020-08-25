document.addEventListener('DOMContentLoaded', () => {
  let new_message = document.querySelector(".new_message");
  new_message.addEventListener('keypress', (e) => {
    if (e.which == 13 && e.shiftKey == false) {
      form = e.target.closest('form')
      form.submit();
      e.target.value = "";
    }
  })
})
