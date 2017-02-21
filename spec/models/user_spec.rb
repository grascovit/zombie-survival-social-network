require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :name }

  it { should validate_presence_of :age }

  it { should validate_presence_of :gender }

  it { should validate_presence_of :latitude }

  it { should validate_presence_of :longitude }

  it { should have_many :items }
end
