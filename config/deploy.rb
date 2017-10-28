require "bundler/capistrano"

set :application, "cap_app"
set :rails_env, "production"

server "vbubuntu1204.com", :web, :app, :db, primary: true

set :repository, "git@github.com:matk2/cap_app.git"
set :scm, :git
set :branch, :master
set :user, "asagao"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{rails_env}"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

after "deploy:update", roles: :app do
  run "/bin/cp #{shared_path}/config/database.yml #{release_path}/config/"
  run "/bin/cp #{shared_path}/config/unicorn.rb #{release_path}/config/"
end

require "capistrano-unicorn"
