Blog::Application.routes.draw do
  get '/login', :to => 'sessions#new', :as => 'login'
  get '/logout', :to => 'sessions#destroy', :as => 'logout'
  get '/tag/:tag' => 'posts#index', :as => :tag_posts, :constraints => { :tag => /[0-z\.]+/ }
  get '/editor/:editor' => 'posts#index', :as => :editor_posts
  get '/date/:year/:month' => 'posts#index', :as => :date_posts
  get '/sitemap.:format' => 'main#sitemap', :as => :sitemap

  root :to => 'main#index'

  resource :session
  resources :posts, :only => [:index, :show]

  namespace :admin do
    root :to => 'main#index'

    resources :posts do
      member do
        get :delete
      end
    end

    resources :editors
    resource :profile, :only => [:edit, :update]
  end
end
