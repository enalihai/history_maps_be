require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location_id  }
    it { should validate_presence_of :title }
    it { should validate_presence_of :other_titles  }
    it { should validate_presence_of :pdf  }
    it { should validate_presence_of :photo  }
    it { should validate_presence_of :details  }
  end

  describe 'associations' do
    it { should belong_to :user }
  end
end
