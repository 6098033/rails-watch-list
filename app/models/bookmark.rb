class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: {minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id}
  def self.find_by_movie_and_list(movie, list)
    Bookmark.find_by(list: list, movie: movie)
  end
end
