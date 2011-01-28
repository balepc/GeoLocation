set :application, "GeoCity"
set :repository,  "git@github.com:balepc/GeoLocation.git"
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/opt/applications/#{application}"

set :scm, :git
set :user, 'deploy'
# set :git_shallow_clone, 1
# set :git_enable_submodules, 1
set :deploy_via, :remote_cache
set :branch, 'master'
# set :repository_cache, "#{application}-src"
# set :key_relesaes, 3
# set :use_sudo, false
set :ssh_options, :forward_agent => true

role :app, "gipoo.net"
role :web, "gipoo.net"
role :db,  "gipoo.net", :primary => true

namespace :deploy do
  desc "restart passenger app"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :after_update_code, :roles => [:app] do
    run "cp #{shared_path}/settings.yml #{release_path}/config/"
  end
end