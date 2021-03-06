def generate_random_comment(number)
  charset = Array('A'..'Z') + Array('a'..'z') + [' ']
  Array.new(number) { charset.sample }.join
end

users = [
  User.find_by_email('root@test.com'),
  User.find_by_email('test@test.com'),
  User.find_by_email('test1@test.com')
]

movies = [
  Movie.find_by_name('iceage'),
  Movie.find_by_name('harry potter'),
  Movie.find_by_name('fallen'),
  Movie.find_by_name('Yeh jawani hai dewani'),
  Movie.find_by_name('inception'),
  Movie.find_by_name('Black'),
  Movie.find_by_name('GOT')
]

users.each do |user|
  movies.each do |movie|
    rand(0...10).times do
      Comment.create!(
        movie: movie,
        user: user,
        content: generate_random_comment(rand(10...50))
      )
    end
  end
end
