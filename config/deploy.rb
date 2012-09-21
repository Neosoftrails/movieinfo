set :rvm_ruby_string, 'ruby-1.9.2p320@movieinfo'

set :application, "movieinfo"
set :use_sudo, false

set :scm, :git
set :repository,  "https://github.com/Neosoftrails/movieinfo.git"
set :scm_passphrase, "neosoft"

set :user, "root"

role :web, "180.149.241.115"                          # Your HTTP server, Apache/etc
role :app, "180.149.241.115"                          # This may be the same as your `Web` server
role :db,  "180.149.241.115", :primary => true # This is where Rails migrations will run

set :deploy_to, "/var/www/movieinfo"
set :keep_releases, 3 
set :server, :passenger

after "deploy:update_code", "deploy:migrate"
after "deploy:migrate", "bundler:install_gems"
after "bundler:install_gems", "bundler:update_gems"
after "bundler:update_gems", "deploy:update_crontab"


namespace :deploy do
  task :start, :roles => :app do
	# DO nothing
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  task :restart, :roles => :app do
  	run "chown -R apache:apache #{current_release}/public"
    run "touch #{current_release}/tmp/restart.txt"
  end
  
  desc "Update the crontab file"
  task :update_crontab, :roles => :db do
    run "cd #{current_release} && whenever --update-crontab #{application}"
  end
end

namespace :bundler do
  desc "Run: bundle install"
  task :install_gems, :role => :app do
     run "cd #{current_release} bundle install"
  end

  desc "Run: bundle update"
  task :update_gems, :role => :app do
     run "cd #{current_release} bundle update"
  end
end
