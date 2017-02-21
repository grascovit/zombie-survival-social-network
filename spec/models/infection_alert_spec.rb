require 'rails_helper'

RSpec.describe InfectionAlert, type: :model do
  it { should belong_to :infected_user }

  it { should belong_to :reporter_user }
end
