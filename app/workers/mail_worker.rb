class MailWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'mailers'

  def perform(user_id)
    user = User.find(user_id)
    UserMailer.welcome(user).deliver_later
  end
end
