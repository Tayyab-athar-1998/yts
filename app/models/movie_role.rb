class MovieRole < ApplicationRecord
  enum roles: %w[actor director]
  belongs_to :movie
  belongs_to :actor

  validates :role_played, presence: true, inclusion: {
    in: roles,
    message: '%<value> is not a allowed role'
  }
  validates :staring_as, presence: true, if: -> { role_played == 'actor' }
  validates_uniqueness_of :role_played, scope: %i[movie_id actor_id]
end
