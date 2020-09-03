json.(talk, :user_one_id, :user_two_id, :team_id)

json.messages talk.messages do |message|
  json.body message.body
  json.date message.created_at.strftime("%d/%m/%Y %k:%M")
  json.user_name message.user.name
end
