set :stage, :staging
set :branch, 'master'
set :rails_env, 'development'
set :migration_role, 'db'

set :deploy_to, '/var/www/app/bestudy_test_staging'

server 'bestudy.jp', user: 'deploy', roles: %w( web app db )
