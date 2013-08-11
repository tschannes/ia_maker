IaMaker::Application.routes.draw do

  resources :level0s, as: 'first' do
    resources :level1s, as: 'second' do 
      resources :level2s, as: 'third' do
      end
    end
  end
  root to: 'level0s#index'
end
