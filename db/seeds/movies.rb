user = User.find_by_email 'root@test.com'

Movie.where(name: 'iceage').first_or_create!(
  name: 'iceage',
  number_of_downloads: rand(1...10_000),
  release_date: '10-10-2010',
  is_featured: true,
  synopsis: 'This is iceage!!!!',
  user_id: user.id,
  languages: 'Hindi',
  video_quality: ['480p'],
  genres: %w[Action SIFI]
)

Movie.where(name: 'harry potter').first_or_create!(
  name: 'harry potter',
  number_of_downloads: rand(1...10_000),
  release_date: '10-11-2010',
  is_featured: false,
  synopsis: 'This is harry potter!!!!',
  user_id: user.id,
  languages: 'English',
  video_quality: ['720p'],
  genres: %w[SIFI]
)
user = User.find_by_email 'test@test.com'

Movie.where(name: 'fallen').first_or_create!(
  name: 'fallen',
  number_of_downloads: rand(1...10_000),
  release_date: '2-10-2010',
  is_featured: true,
  synopsis: 'This is fallen!!!!',
  user_id: user.id,
  languages: 'English',
  video_quality: ['1080p'],
  genres: %w[SIFI]
)

Movie.where(name: 'Yeh jawani hai dewani').first_or_create!(
  name: 'Yeh jawani hai dewani',
  number_of_downloads: rand(1...10_000),
  release_date: '10-10-2008',
  is_featured: false,
  synopsis: 'This is Yeh jawani hai dewani!!!!',
  user_id: user.id,
  languages: 'English',
  video_quality: ['4K'],
  genres: %w[Comedy]
)
Movie.where(name: 'inception').first_or_create!(
  name: 'inception',
  number_of_downloads: rand(1...10_000),
  release_date: '10-10-2009',
  is_featured: false,
  synopsis: 'This is inception!!!!',
  user_id: user.id,
  languages: 'Hindi',
  video_quality: ['4K'],
  genres: %w[Action]
)
user = User.find_by_email 'test1@test.com'

Movie.where(name: 'Black').first_or_create!(
  name: 'Black',
  number_of_downloads: rand(1...10_000),
  release_date: '10-12-2010',
  is_featured: true,
  synopsis: 'This is black!!!!',
  user_id: user.id,
  languages: 'English',
  video_quality: ['4K'],
  genres: %w[Action SIFI Comedy]
)

Movie.where(name: 'GOT').first_or_create!(
  name: 'GOT',
  number_of_downloads: rand(1...10_000),
  release_date: '10-10-2011',
  is_featured: false,
  synopsis: 'This is GOT!!!!',
  user_id: user.id,
  languages: 'Hindi',
  video_quality: ['4K'],
  genres: %w[Action]
)
