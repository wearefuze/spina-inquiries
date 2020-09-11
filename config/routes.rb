Spina::Engine.routes.draw do
  namespace :admin do
    resources :inquiries, only: [:index, :show, :destroy] do
      member do
        get :read
        patch :mark_as_read
      end
    end
  end
end
