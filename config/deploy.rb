require "bundler/capistrano"

set :application, 'Deploy Watcher'
set :repository,  'https://github.com/brunofrank/deploy-watch.git'

set :scm, :git

server "deploy@terminal.bolsafinanceira.com:21212", :app, :web, :main, :primary => true

set :use_sudo, false
set :deploy_to, "/home/deploy/www/deploy_watch/"

namespace :deploy do

  desc "Restart the server"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Run database migrations"
  task :migrations do
    run "cd #{current_path}; rake db:migrate RAILS_ENV=#{ENV['RAILS_ENV']}"
  end

end

after 'deploy:assets:precompile', "deploy:cleanup"