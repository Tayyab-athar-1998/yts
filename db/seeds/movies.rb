user = User.find_by_email 'root@test.com'

genres = {
  action: Genre.find_by_name('Action'),
  sifi: Genre.find_by_name('SIFI'),
  comedy: Genre.find_by_name('Comedy')
}

video_quality = {
  '480p': VideoQuality.find_by_resolution('480p'),
  '720p': VideoQuality.find_by_resolution('720p'),
  '1080p': VideoQuality.find_by_resolution('1080p'),
  '4K': VideoQuality.find_by_resolution('4K'),
}

movie = Movie.where(name: 'iceage').first_or_create!(
  name: 'iceage',
  number_of_downloads: rand(1...10_000),
  release_date: '10-10-2010',
  is_featured: true,
  synopsis: 'This is iceage!!!!',
  user_id: user.id,
  languages: 'Hindi'
)
movie.genre << genres[:action]
movie.genre << genres[:sifi]
movie.video_quality << video_quality[:'480p']

movie = Movie.where(name: 'harry potter').first_or_create!(
  name: 'harry potter',
  number_of_downloads: rand(1...10_000),
  release_date: '10-11-2010',
  is_featured: false,
  synopsis: 'This is harry potter!!!!',
  user_id: user.id,
  languages: 'English'
)
movie.genre << genres[:sifi]
movie.video_quality << video_quality[:'720p']

user = User.find_by_email 'test@test.com'

movie = Movie.where(name: 'fallen').first_or_create!(
  name: 'fallen',
  number_of_downloads: rand(1...10_000),
  release_date: '2-10-2010',
  is_featured: true,
  synopsis: 'This is fallen!!!!',
  user_id: user.id,
  languages: 'English'
)
movie.genre << genres[:sifi]
movie.video_quality << video_quality[:'1080p']

movie = Movie.where(name: 'Yeh jawani hai dewani').first_or_create!(
  name: 'Yeh jawani hai dewani',
  number_of_downloads: rand(1...10_000),
  release_date: '10-10-2008',
  is_featured: false,
  synopsis: 'This is Yeh jawani hai dewani!!!!',
  user_id: user.id,
  languages: 'English'
)
movie.genre << genres[:comedy]
movie.video_quality << video_quality[:'4K']

movie = Movie.where(name: 'inception').first_or_create!(
  name: 'inception',
  number_of_downloads: rand(1...10_000),
  release_date: '10-10-2009',
  is_featured: false,
  synopsis: 'This is inception!!!!',
  user_id: user.id,
  languages: 'Hindi'
)
movie.genre << genres[:action]
movie.video_quality << video_quality[:'4K']

user = User.find_by_email 'test1@test.com'

movie = Movie.where(name: 'Black').first_or_create!(
  name: 'Black',
  number_of_downloads: rand(1...10_000),
  release_date: '10-12-2010',
  is_featured: true,
  synopsis: 'This is black!!!!',
  user_id: user.id,
  languages: 'English'
)
movie.genre << genres[:sifi]
movie.genre << genres[:action]
movie.genre << genres[:comedy]
movie.video_quality << video_quality[:'4K']

movie = Movie.where(name: 'GOT').first_or_create!(
  name: 'GOT',
  number_of_downloads: rand(1...10_000),
  release_date: '10-10-2011',
  is_featured: false,
  synopsis: 'This is GOT!!!!',
  user_id: user.id,
  languages: 'Hindi'
)
movie.genre << genres[:action]
movie.video_quality << video_quality[:'4K']
