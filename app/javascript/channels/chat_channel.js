import consumer from "./consumer";

document.addEventListener("DOMContentLoaded", function () {
  window.cable_subscribe();
});

window.cable_subscribe = () => {
  if (window.app != undefined) window.app.unsubscribe();

  const messagable_id = document
    .querySelector("#message_messagable_id")
    .getAttribute("value");
  const messagable_type = document
    .querySelector("#message_messagable_type")
    .getAttribute("value");
  const team_id = document.querySelector(".team_id").getAttribute("value");

  window.app = consumer.subscriptions.create(
    {
      channel: "ChatChannel",
      team_id: team_id,
      messagable_id: messagable_id,
      messagable_type: messagable_type,
    },
    {
      connected() {
        console.log("connected!");
      },

      disconnected() {
        // Called when the subscription has  been terminated by the server
      },

      received(data) {
        window.add_message(data["message"], data["date"], data["name"]);
      },
    }
  );
};
