require 'rails_helper'

RSpec.describe InfectionAlertsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/infection_alerts').to route_to('infection_alerts#index')
    end

    it 'routes to #received_infection_alerts' do
      expect(get: '/users/1/received_infection_alerts').to route_to('infection_alerts#received_infection_alerts', user_id: '1')
    end

    it 'routes to #reported_infection_alerts' do
      expect(get: '/users/1/reported_infection_alerts').to route_to('infection_alerts#reported_infection_alerts', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/infection_alerts/1').to route_to('infection_alerts#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/infection_alerts').to route_to('infection_alerts#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/infection_alerts/1').to route_to('infection_alerts#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/infection_alerts/1').to route_to('infection_alerts#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/infection_alerts/1').to route_to('infection_alerts#destroy', id: '1')
    end
  end
end
