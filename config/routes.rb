Spina::Engine.routes.draw do
  resources :inquiries, path: "contact" do
    collection do
      get :thanks
    end
  end

  namespace :admin do
    resources :inquiries, only: %i[index destroy] do
      collection do
        get :read
      end

      member do
        put :mark_as_read
      end
    end
  end
end
