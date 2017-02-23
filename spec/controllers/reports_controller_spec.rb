require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'GET #infected_users' do
    it 'returns http success' do
      get :infected_users
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #uninfected_users' do
    it 'returns http success' do
      get :uninfected_users
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #average_items_per_user' do
    it 'returns http success' do
      get :average_items_per_user
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #points_lost' do
    it 'returns http success' do
      get :points_lost
      expect(response).to have_http_status(:ok)
    end
  end
end
