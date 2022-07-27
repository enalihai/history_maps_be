class Favorite < ApplicationRecord
  validates_presence_of :location
  belongs_to :user
end
