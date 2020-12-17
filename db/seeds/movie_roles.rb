ACTOR = 'actor'.freeze
DIRECTOR = 'director'.freeze

actors = {
  leo: Actor.find_by_name('Leo'),
  tayyab: Actor.find_by_name('Tayyab'),
  hamza: Actor.find_by_name('Hamza'),
  nph: Actor.find_by_name('NPH'),
  joey: Actor.find_by_name('Joey')
}

movies = {
  iceage: Movie.find_by_name('iceage'),
  harry_potter: Movie.find_by_name('harry potter'),
  fallen: Movie.find_by_name('fallen'),
  yeh_jawani_hai_dewani: Movie.find_by_name('Yeh jawani hai dewani'),
  inception: Movie.find_by_name('inception'),
  black: Movie.find_by_name('Black'),
  got: Movie.find_by_name('GOT')
}

MovieRole.where(movie_id: movies[:iceage].id, actor_id: actors[:leo].id, role_played: ACTOR).first_or_create!(
  role_played: ACTOR,
  movie: movies[:iceage],
  actor: actors[:leo],
  staring_as: 'actor1'
)

MovieRole.where(movie_id: movies[:iceage].id, actor_id: actors[:leo].id, role_played: DIRECTOR).first_or_create!(
  role_played: DIRECTOR,
  movie: movies[:iceage],
  actor: actors[:leo]
)

MovieRole.where(movie_id: movies[:harry_potter].id, actor_id: actors[:tayyab].id, role_played: ACTOR).first_or_create!(
  role_played: ACTOR,
  movie: movies[:harry_potter],
  actor: actors[:tayyab],
  staring_as: 'actor2'
)

MovieRole.where(movie_id: movies[:harry_potter].id, actor_id: actors[:leo].id, role_played: ACTOR).first_or_create!(
  role_played: ACTOR,
  movie: movies[:harry_potter],
  actor: actors[:leo],
  staring_as: 'actor2'
)

MovieRole.where(movie_id: movies[:harry_potter].id, actor_id: actors[:hamza].id, role_played: DIRECTOR).first_or_create!(
  role_played: DIRECTOR,
  movie: movies[:harry_potter],
  actor: actors[:hamza]
)

MovieRole.where(movie_id: movies[:fallen].id, actor_id: actors[:tayyab].id, role_played: ACTOR).first_or_create!(
  role_played: ACTOR,
  movie: movies[:fallen],
  actor: actors[:tayyab],
  staring_as: 'actor2'
)

MovieRole.where(movie_id: movies[:fallen].id, actor_id: actors[:nph].id, role_played: ACTOR).first_or_create!(
  role_played: ACTOR,
  movie: movies[:fallen],
  actor: actors[:nph],
  staring_as: 'actor2'
)

MovieRole.where(movie_id: movies[:fallen].id, actor_id: actors[:hamza].id, role_played: DIRECTOR).first_or_create!(
  role_played: DIRECTOR,
  movie: movies[:fallen],
  actor: actors[:hamza]
)

MovieRole.where(
  movie_id: movies[:yeh_jawani_hai_dewani].id, actor_id: actors[:tayyab].id, role_played: ACTOR).first_or_create!(
    role_played: ACTOR,
    movie: movies[:yeh_jawani_hai_dewani],
    actor: actors[:tayyab],
    staring_as: 'actor2'
  )

MovieRole.where(
  movie_id: movies[:yeh_jawani_hai_dewani].id, actor_id: actors[:nph].id, role_played: ACTOR).first_or_create!(
    role_played: ACTOR,
    movie: movies[:yeh_jawani_hai_dewani],
    actor: actors[:nph],
    staring_as: 'actor2'
  )

MovieRole.where(
  movie_id: movies[:yeh_jawani_hai_dewani].id, actor_id: actors[:joey].id, role_played: DIRECTOR).first_or_create!(
    role_played: DIRECTOR,
    movie: movies[:yeh_jawani_hai_dewani],
    actor: actors[:joey]
  )

MovieRole.where(
  movie_id: movies[:inception].id, actor_id: actors[:tayyab].id, role_played: ACTOR).first_or_create!(
    role_played: ACTOR,
    movie: movies[:inception],
    actor: actors[:tayyab],
    staring_as: 'actor2'
  )

MovieRole.where(
  movie_id: movies[:inception].id, actor_id: actors[:nph].id, role_played: ACTOR).first_or_create!(
    role_played: ACTOR,
    movie: movies[:inception],
    actor: actors[:nph],
    staring_as: 'actor2'
  )

MovieRole.where(
  movie_id: movies[:inception].id, actor_id: actors[:joey].id, role_played: DIRECTOR).first_or_create!(
    role_played: DIRECTOR,
    movie: movies[:inception],
    actor: actors[:joey]
  )

MovieRole.where(movie_id: movies[:black].id, actor_id: actors[:tayyab].id, role_played: ACTOR).first_or_create!(
  role_played: ACTOR,
  movie: movies[:black],
  actor: actors[:tayyab],
  staring_as: 'actor2'
)

MovieRole.where(movie_id: movies[:black].id, actor_id: actors[:leo].id, role_played: ACTOR).first_or_create!(
  role_played: ACTOR,
  movie: movies[:black],
  actor: actors[:leo],
  staring_as: 'actor2'
)

MovieRole.where(movie_id: movies[:black].id, actor_id: actors[:hamza].id, role_played: DIRECTOR).first_or_create!(
  role_played: DIRECTOR,
  movie: movies[:black],
  actor: actors[:hamza]
)

MovieRole.where(movie_id: movies[:got].id, actor_id: actors[:leo].id, role_played: ACTOR).first_or_create!(
  role_played: ACTOR,
  movie: movies[:got],
  actor: actors[:leo],
  staring_as: 'actor1'
)

MovieRole.where(movie_id: movies[:got].id, actor_id: actors[:leo].id, role_played: DIRECTOR).first_or_create!(
  role_played: DIRECTOR,
  movie: movies[:got],
  actor: actors[:leo]
)
