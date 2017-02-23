Rails.application.routes.draw do
  resources :users do
    resources :items
    get 'received_infection_alerts', to: 'infection_alerts#received_infection_alerts'
    get 'reported_infection_alerts', to: 'infection_alerts#reported_infection_alerts'
  end

  resources :items, only: [:show]
  resources :infection_alerts

  put 'trade', to: 'items#trade'
  patch 'trade', to: 'items#trade'

  get 'reports/infected_users'
  get 'reports/uninfected_users'
  get 'reports/average_items_per_user'
  get 'reports/points_lost'
end
