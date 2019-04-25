Rails.application.routes.draw do

  devise_for :users

  root 'public/users#top'
  get 'user_index' => 'admin/users#', as: 'users'


  namespace :admin do
    resources :cds, :except => :show do
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
      collection do
        get 'search' => 'users#search'
      end
    end

    resources :shops
    resources :reviews
    resources :histories do
      collection do
        get 'search' => 'histories#search'
      end
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
      collection do
        get 'search' => 'users#search'
      end
    end


    resources :reviews

  end

  resources :carts do
    delete 'orders/:id' => 'carts#delete_order',as: 'order_delete'
    get 'confirm' => 'carts#confirm'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
