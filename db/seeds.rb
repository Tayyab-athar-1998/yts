puts "Please don't close, it may take few minutes......;"

puts 'Seeding user accounts....'
load "#{Rails.root}/db/seeds/users.rb"

puts 'Seeding genre accounts....'
load "#{Rails.root}/db/seeds/genres.rb"
