namespace :db do
  desc 'Fully reloading of development environment'
  task :up_ do
    raise 'Not allowed to run on production' unless Rails.env.development?
    system("rake db:drop")
    system("rake db:create")
    system("rake db:migrate")
    system("RAILS_ENV=test rake db:migrate")
    sleep 1
    system("rake db:seed")
  end
end
