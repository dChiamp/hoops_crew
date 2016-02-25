# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# setting env dev breaks it
set :environment, "development"
set :output, '/Users/kerberus/dev/hoops_crew/hoops_crew/log/cron_log.log'
every '* * * * *' do
  rake 'send_email'
  # command "echo 'sanity check 2'"
end





