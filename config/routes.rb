Rails.application.routes.draw do

  devise_for :users

  root 'public/users#top'
  get 'user_index' => 'admin/users#', as: 'users'

  namespace :admin do
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

    resources :users, only: [:show, :index, :edit, :update, :destroy] do
    end

    resources :shops
    resources :reviews

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


    resources :reviews

  end

  resources :carts do
    get 'confirm' => 'carts#confirm'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
