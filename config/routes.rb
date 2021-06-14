Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/plots', to: 'plots#index'

  delete '/plots/:plot_id/plants/:plant_id', to: 'plot_plants#destroy'

  get '/gardens/:garden_id', to: 'gardens#show'
end
