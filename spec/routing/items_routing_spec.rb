require 'rails_helper'

RSpec.describe ItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'users/1/items').to route_to('items#index', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/items/1').to route_to('items#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'users/1/items').to route_to('items#create', user_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: 'users/1/items/1').to route_to('items#update', id: '1', user_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'users/1/items/1').to route_to('items#update', id: '1', user_id: '1')
    end

    it 'routes to #trade via PUT' do
      expect(put: 'trade').to route_to('items#trade')
    end

    it 'routes to #trade via PATCH' do
      expect(patch: 'trade').to route_to('items#trade')
    end

    it 'routes to #destroy' do
      expect(delete: 'users/1/items/1').to route_to('items#destroy', id: '1', user_id: '1')
    end
  end
end
