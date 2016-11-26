set :output, path + '/log/cron.log'

every 3.minute do
  runner "Coupon.where('created_at < ?', 5.minute.ago).map(&:delete)"
end
