Spina::Engine.routes.draw do
  resources :inquiries

  namespace :admin do
    resources :inquiries, only: [:index, :show, :destroy] do
      collection do
        get :read
      end

      member do
        patch :mark_as_read
      end
    end
  end
end
