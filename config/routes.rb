Rails.application.routes.draw do
  root "users#index"
  get 'transactions', to: 'transactions#index'
  get 'merchants', to: 'merchants#index'
  get 'admins', to: 'admins#index'
  get 'clients', to: 'clients#index'

  resources :user, :merchant, only: [:show], shallow: true do
    resources :transactions
  end

  scope :api, module: :api, defaults: { format: :json } do
    resources :transactions, only: [:create, :update, :show] do
      post :create
    end
  end

  scope :api, module: :api, defaults: { format: :json } do
    post 'clients', to: 'clients#show'
  end
end
