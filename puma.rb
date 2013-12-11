bind 'unix:///home/deploy/dtcrafts/shared/sockets/puma.sock'
pidfile '/home/deploy/dtcrafts/shared/pids/puma.pid'
state_path '/home/deploy/dtcrafts/shared/sockets/puma.state'
environment 'production'

restart_command '/etc/init.d/puma restart'
threads 16,32
workers 8

