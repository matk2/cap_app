set :rails_env, "staging"
server "stg.vbubuntu1204.com", :web, :app, :db, primary: true
set :deploy_to, "/home/#{user}/#{rails_env}"
