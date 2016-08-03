namespace :goku do
  desc "TODO"
  task gpush: :environment do
      puts "Pushing to git!"
      system("git push")
  end

  desc "TODO"
  task okupush: :environment do
      puts "Pushing to heroku master!"
      system("git push heroku master")
  end

  desc "TODO"
  task okumigrate: :environment do
      puts "Migrating database..."
      system("heroku run rake db:migrate")
  end

end
