Rails.application.routes.draw do
	constraints subdomain:'api' do
	  resources :reviews
	  resources :movies
	end

  root "movies#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
