Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root 'public/users#top'


namespace :admin do
  resources :users
  resources :shops
end

namespace :public do
  resources :users
end



end
