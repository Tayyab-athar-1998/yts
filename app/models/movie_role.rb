class MovieRole < ApplicationRecord
  belongs_to :movie
  belongs_to :actor

  validates :role_played, presence: true, inclusion: {
    in: %w[actor director],
    message: '%<value> is not a allowed role'
  }
  validates :staring_as, presence: true, if: :role_played == 'actor'
end
