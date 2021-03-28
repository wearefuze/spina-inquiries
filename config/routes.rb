Spina::Engine.routes.draw do
  resources :inquiries, path: "contact" do
    collection do
      get :thanks
    end
  end

  namespace :admin do
    resources :inquiries, only: %i[index show destroy] do
      collection do
        get :read
        get :spam
        patch :destroy_spam
      end

      member do
        patch :mark_as_read
        patch :mark_as_spam
      end
    end
  end
end
