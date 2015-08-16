Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  get '/questions/name', to: 'questions#image_question'
  post '/answer', to: 'answers#submit_answer'
end
