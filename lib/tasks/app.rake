namespace :app do
  desc "Setup this RegistrationApp"
  task setup: :environment do
		exec("cd #{Rails.root.try(:to_s)} && bundle install && bundle exec rake db:migrate && bundle exec rake db:seed")
  end

  desc "TODO"
  task start: :environment do
  	exec("cd #{Rails.root.try(:to_s)} && rails s")
  end

end
