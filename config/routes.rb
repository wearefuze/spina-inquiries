Spina::Engine.routes.draw do
  namespace :admin do
    resources :inquiries, only: [:index, :show, :destroy] do
      collection do
        get :inbox
        get :spam
      end

      member do
        get :inbox_show
        patch :mark_as_read
        patch :unmark_spam
      end
    end
  end
end
