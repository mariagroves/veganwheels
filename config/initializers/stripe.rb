Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key:      ENV['STRIPE_SECRET_KEY'],
    stripe_account_signing_secret:  ENV['STRIPE_ACCOUNT_WEBHOOK_SECRET_KEY'],
    stripe_connect_signing_secret: ENV['STRIPE_CONNECT_WEBHOOK_SECRET_KEY']
  }
  
Stripe.api_key = Rails.configuration.stripe[:secret_key]

StripeEvent.signing_secrets = [
  Rails.configuration.stripe[:stripe_account_signing_secret],
  Rails.configuration.stripe[:stripe_connect_signing_secret]
]
StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed', StripeCheckoutSessionService.new
  events.subscribe 'account.updated', StripeConnectedAccountService.new
end