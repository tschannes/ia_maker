IaMaker::Application.routes.draw do

	resources :level0s, as: 'first' do
		resources :level1s, as: 'second' do
			resources :level2s, as: 'third' do
			end
		end
	end
	get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "users#new", :as => "signup"
	resources :users
	resources :sessions
	root to: 'level0s#index'
end
