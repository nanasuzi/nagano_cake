Rails.application.routes.draw do

  devise_for :customers, controllers: {
    :registrations => 'public/registrations',
    :sessions => 'public/sessions'
  }

root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
    scope module: :public do
      resources :items, only:[:index, :show]
        delete "/cart_items" => "cart_items#destroy_all"
          resources :cart_items, except:[:new, :show, :edit]
            resources :orders, only:[:new, :create, :index, :show]
              post "/orders/check" => "orders#check"
                get "/orders/complete" => "orders#complete"
                  resources :addresses, except:[:new, :show]
    end











    devise_for :admins, path: 'admin', controllers: {
      :sessions => 'admin/sessions'
    }

  namespace :admin do
      root to: 'homes#top'
        resources :genres, only:[:index, :create, :edit, :update]
          resources :items, except:[:destroy]

            resources :orders, only:[:show, :update]
              resources :order_details, only:[:update]
                resources :customers, only:[:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
