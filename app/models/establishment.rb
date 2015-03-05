class Establishment < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  # validates :address, uniqueness: {message: "Already in DB"}

  def average_ratings(column)
    values = reviews.map { |value| value[column] }.compact
    return 'no rating' if values.empty?
    ((values.inject(:+).to_f)/values.length).round(0)
  end
end
