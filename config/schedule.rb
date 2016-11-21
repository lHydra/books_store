env :PATH, ENV['PATH']
set :output, path + '/log/cron.log'

every 3.minute do
  runner "Coupon.where(created_at: (Time.now-5.minute)..Time.now).map(&:delete)"
end
