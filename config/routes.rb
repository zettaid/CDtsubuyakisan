Rails.application.routes.draw do
  devise_for :users

  root 'public/users#top'

  namespace :admin do
    resources :cds do
    end
    resources :artists do
    end
    resources :labels do
    end
    resources :musics do
    end
    resources :genres do
    end
    resources :users, only: [:show, :index, :edit, :update, :destroy] do
    end

  end

  namespace :public do
    resources :cds do
      collection do
        get 'search' => 'cds#search'
      end
    end
    resources :artists do
    end
    resources :labels do
    end
    resources :musics do
    end
    resources :genres do
    end
    resources :users, only: [:show, :edit, :update, :destroy] do
    end

  end

  resources :carts do
    get 'confirm' => 'carts#confirm'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
