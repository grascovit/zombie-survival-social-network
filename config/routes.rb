Rails.application.routes.draw do
  resources :users do
    resources :items
    get 'received_infection_alerts', to: 'infection_alerts#received_infection_alerts'
    get 'reported_infection_alerts', to: 'infection_alerts#reported_infection_alerts'  
  end

  resources :items
  resources :infection_alerts
end
