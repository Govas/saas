class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date
  def get_ratings
    self.uniq.pluck(:rating)
  end
end
