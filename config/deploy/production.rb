set :stage, :production
set :branch, 'master'
set :rails_env, 'production'
set :migration_role, 'db'

set :deploy_to, '/var/www/app/bestudy_test'

server 'bestudy.jp', user: 'deploy', roles: %w( web app db )
