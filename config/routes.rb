Rails.application.routes.draw do
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
    resources :histories do
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
  end

  resources :carts do
    get 'confirm' => 'carts#confirm'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
