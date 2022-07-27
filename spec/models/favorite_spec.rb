require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location}
  end
  
  describe 'associations' do
    it { should belong_to :user }
  end
end
