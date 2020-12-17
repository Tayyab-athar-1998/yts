puts "Please don't close, it may take few minutes......;"

puts 'Seeding user accounts....'
load "#{Rails.root}/db/seeds/users.rb"

puts 'Seeding genre ....'
load "#{Rails.root}/db/seeds/genres.rb"

puts 'Seeding video qualities....'
load "#{Rails.root}/db/seeds/video_qualities.rb"

puts 'Seeding actors....'
load "#{Rails.root}/db/seeds/actors.rb"

puts 'Seeding movies....'
load "#{Rails.root}/db/seeds/movies.rb"
