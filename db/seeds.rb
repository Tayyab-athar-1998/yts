puts "Please don't close, it may take few minutes......".yellow

puts "Seeding user accounts....".green
load "#{Rails.root}/db/seeds/users.rb"
