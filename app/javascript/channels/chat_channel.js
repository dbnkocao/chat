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
  const current_user = document
    .querySelector("#current_user")
    .getAttribute("value");
  const user_two_id = document
    .querySelector("#talk_user_two_id")
    .getAttribute("value");

  window.app = consumer.subscriptions.create(
    {
      channel: "ChatChannel",
      team_id: team_id,
      messagable_id: messagable_id,
      current_user: current_user,
      messagable_type: messagable_type,
      user_two_id: user_two_id,
    },
    {
      connected() {
        console.log("connected!");
      },

      disconnected() {
        console.log("disconnected!");
        // Called when the subscription has  been terminated by the server
      },

      received(data) {
        console.log("received!");

        window.add_message(data["message"], data["date"], data["name"]);
      },
    }
  );
};
