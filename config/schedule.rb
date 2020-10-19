env :PATH, ENV['PATH']
set :output, "log/cron.log"
every 1.day, at: ['14:22 pm'] do
    runner "Restaurant.restaurant_reminder", :environment => "development"
end