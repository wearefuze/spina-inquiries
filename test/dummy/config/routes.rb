Dummy::Application.routes.draw do
  mount Spina::Engine => '/'
  mount Spina::Inquiries::Engine => "/spina-inquiries"
  
  Spina::Engine.routes.draw do
    resources :inquiries, path: "contact"
    get "/thank-you", to: "inquiries#thanks"
  end
end
