class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true

  has_many :favorites
end
