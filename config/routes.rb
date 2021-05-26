Rails.application.routes.draw do
  devise_for :customers

  namespace :admin do
    devise_for :admins
      root to: 'homes#top'
        resources :genres, only:[:index, :create, :edit, :update] do
        resources :items, except:[:destroy]
        end
          resources :orders, only:[:show, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
