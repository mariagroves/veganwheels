env :PATH, ENV['PATH']
set :output, "log/cron.log"
every 10.hours do
    runner "Order.delete_expired_orders", :environment => "development"
end