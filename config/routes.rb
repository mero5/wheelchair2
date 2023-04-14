Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:passwords] , controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index,:show,:edit,:update]
    resources :items
    resources :categories, only: [:index, :edit, :create, :update, :destroy]
    get 'orders/earnings'
    resources :orders, only:[:index,:show,:update]
    resources :order_details,only:[:update]
    resources :repairs, only:[:index,:show,:update]
    resources :rooms, only: [:show, :index]
    resource :message, only: [:create]
  end

  scope module: :public do
    get 'customers/profile' => 'customers#show'
    patch 'customers/profile' => 'customers#update'
    get 'customers/profile/edit' => 'customers#edit'
    get 'customers/unsubscribe'
    patch 'customers/withdrawal'
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:show] do
      resource :favorites, only: [:create, :destroy]
    end
    get 'favorites' => 'favorites#index'
    resources :categories, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    delete 'cart_items' => 'cart_items#destroy_all'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/success' => 'orders#success'
    resources :orders, only: [:index, :new, :create, :show]
    resources :rooms, only: [:show, :create]
    resource :message, only: [:create]
    post 'repairs/confirm' => 'repairs#confirm'
    get 'repairs/thanx' => 'repairs#thanx'
    resources :repairs, only: [:index, :new, :create, :show]
  end

  root to: "homes#top"
  get 'about' => "homes#about"
  get '/search', to: 'searches#search'
  get '/category_search', to: 'searches#category_search'

end
