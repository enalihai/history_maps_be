require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email}
    it { should validate_presence_of :username}
    it { should validate_uniqueness_of :username}
    it { should validate_uniqueness_of :email}
  end

  describe 'associations' do
    it { should have_many :favorites }
  end
end
