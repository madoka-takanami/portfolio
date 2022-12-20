namespace :random_notion do
  desc "ランダムに選んだ飲食店をメールする"
  task notion_mail: :environment do
    UserMailer.notion_email.deliver_now
  end
end
