class Favorite < ApplicationRecord
  validates_presence_of :title
  # validates_presence_of :other_titles
  # validates_presence_of :location_id
  # validates_presence_of :photo
  # validates_presence_of :pdf
  # validates_presence_of :details
  
  belongs_to :user
end
