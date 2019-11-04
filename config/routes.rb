Rails.application.routes.draw do
  get 'feedbacks/new'
  get 'feedbacks/create'
  get 'feedbacks/show'
  get 'feedbacks/index'
  get 'feedbacks/edit'
  get 'algorithms/index'
  get 'algorithms/show'
  get 'algorithms/new'
  get 'sessions/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
