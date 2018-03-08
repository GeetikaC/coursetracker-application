Rails.application.routes.draw do

	#localhost:3000/api/v1/clients
	namespace :api, format: 'json' do
		namespace :v1 do
			resources :clients
			resources :projects
		end
	end

  root 'courses#index'
  resources :courses
  resources :instructors
  resources :students
  resources :registrations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
