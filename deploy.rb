require 'bundler/capistrano'

set :application, 'dtcrafts'
set :repository, 'https://delphidev5/svn/dtcrafts_rails/trunk'
set :scm, :subversion
set :rvm_ruby_string, :local
set :rvm_type, :system
set :rvm_install_with_sudo, true
set :user, 'deploy'
set :deploy_to, "/home/#{user}/#{application}"
set :ssh_options, { :forward_agent => true }
set :use_sudo, false

server '192.168.2.4', :app, :web, :db, :primary => true
default_run_options[:pty] = true  # Must be set for the password prompt
default_run_options[:shell] = '/bin/bash'


namespace :deploy do
  task :start do
    run "/etc/init.d/puma start"
  end
  task :stop do
    run "/etc/init.d/puma stop"
  end
  task :restart do
    run "/etc/init.d/puma restart"
  end
end


after 'deploy:restart', 'deploy:cleanup'
after 'deploy:finalize_update', 'assets:link_static_assets'

namespace :assets do
  task :link_static_assets do
    run "ln -s /media #{release_path}/public/media"
    run "ln -s /media/syscat #{release_path}/public/syscat"
  end
end


