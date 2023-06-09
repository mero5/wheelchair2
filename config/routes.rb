Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:passwords] , controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    patch 'customers/customer_update/:id' => 'customers#customer_update' ,as: 'customer_update'
    resources :customers, only: [:index,:show,:edit,:update, :create]  #会員
    resources :items  #商品
    resources :colors  #カラー
    resources :cloths  #シート生地カラー
    resources :categories, only: [:index, :edit, :create, :update, :destroy]  #カテゴリ
    get 'orders/earnings'
    resources :orders, only:[:index,:show,:update]
    get 'order_details/history/:id' => 'order_details#history', as: 'order_details_history'
    resources :order_details,only:[:update, :index, :show]
    resources :deliveries, only: [:show]
    patch 'repairs/repair_update/:id' => 'repairs#repair_update' ,as: 'repair_update'
    resources :repairs, only:[:index, :show, :update, :create]
    patch 'made_to_orders/made_to_order_update/:id' => 'made_to_orders#made_to_order_update' ,as: 'made_to_order_update'
    resources :made_to_orders, only:[:index, :show, :update, :create]
    resources :contacts, only:[:index,:show,:update]
    resources :rooms, only: [:show, :index]
    resource :message, only: [:create]
  end

  scope module: :public do
    get 'customers' => 'registrations#new'
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
    resources :order_details
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    delete 'cart_items' => 'cart_items#destroy_all'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/success' => 'orders#success'
    resources :orders, only: [:index, :new, :create, :show]
    resources :rooms, only: [:show, :create, :index]
    resource :message, only: [:create]
    post 'repairs/confirm' => 'repairs#confirm'
    get 'repairs/thanx' => 'repairs#thanx'
    resources :repairs, only: [:index, :new, :create, :show]
    post 'made_to_orders/confirm' => 'made_to_orders#confirm'
    post 'made_to_orders/back' => 'made_to_orders#back', as: 'made_to_orders_back'
    get 'made_to_orders/thanx' => 'made_to_orders#thanx'
    resources :made_to_orders, only:[:index, :new, :create, :show]
    resources :notifications, only: [:index]
  end

  root to: "homes#top"
  get 'about' => "homes#about"
  get '/search', to: 'searches#search'
  get '/member_search', to: 'searches#member_search'
  get '/category_search', to: 'searches#category_search'
  post 'contacts/confirm' => 'contacts#confirm'
  post 'contacts/back' => 'contacts#back', as: 'back'
  get 'contacts/thanx' => 'contacts#thanx'
  resources :contacts, only:[:new, :create, :show, :index]

end
