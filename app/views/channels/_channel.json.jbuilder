json.(channel, :slug, :user_id, :team_id)

json.messages channel.messages do |message|
  json.body message.body
  json.date message.created_at
  json.user_name message.user.name
end

json.url channel_url(channel, format: :json)
