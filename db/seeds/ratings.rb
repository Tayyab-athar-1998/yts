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
    Rating.where(movie_id: movie.id, user_id: user.id).first_or_create!(
      movie: movie,
      user: user,
      value: rand(0...10)
    )
  end
end
