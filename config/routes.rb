# Rails.application.routes.draw do
#   get 'feedbacks/new'
#   get 'feedbacks/create'
#   get 'feedbacks/show'
#   get 'feedbacks/index'
#   get 'feedbacks/edit'
#   get 'algorithms/index'
#   get 'algorithms/show'
#   get 'algorithms/new'
#   get 'tasks/create'
#   get 'features', to: "pages#features", as: :features
#   get 'faq', to: "pages#faq", as: :faq
#   devise_for :users
#   root to: 'pages#home'
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end

Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: "pages#about", as: :about
  get 'faq', to: "pages#faq", as: :faq
  get 'dashboard', to: "pages#dashboard", as: :dashboard
  resources :tasks , only: [:create, :index, :show] do
    resources :feedbacks
  end
  resources :algorithms, only: [:index, :show]

  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
