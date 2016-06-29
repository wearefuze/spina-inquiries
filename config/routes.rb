Spina::Engine.routes.draw do
  namespace :admin do
    resources :clients, only: [:index, :show, :destroy]
  end
end
