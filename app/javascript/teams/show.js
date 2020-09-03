toggleSidebar = () => {
  let sidebar = document.querySelector(".side-nav-channel");
  if (sidebar.style.display == "block") {
    sidebar.style.display = "none";
  } else {
    sidebar.style.display = "block";
  }
};

document.addEventListener("DOMContentLoaded", () => {
  const channel_id = document
    .querySelector("ul.channels > li > div > div > a > span")
    .getAttribute("id");
  if (channel_id != undefined) window.open(channel_id, "channels");
});

document.addEventListener("DOMContentLoaded", () => {
  const channels = document.querySelectorAll(".open_channel, .open_user");
  channels.forEach((channel) => {
    channel.addEventListener("click", (e) => {
      let css_class = channel.getAttribute("class");
      let type = css_class == "open_channel" ? "Channel" : "Talk";
      if (type == "Channel") {
        window.open(e.target.id, "channels");
        document
          .getElementById("message_messagable_id")
          .setAttribute("value", e.target.id);
      } else {
        window.open(e.target.id, "talks");
        document
          .getElementById("talk_user_two_id")
          .setAttribute("value", e.target.id);
      }
      document
        .getElementById("message_messagable_type")
        .setAttribute("value", type);
    });
  });
});
