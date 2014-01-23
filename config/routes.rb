BigData::Application.routes.draw do
  root :to => 'uploads#new'
  devise_for :users
  #get "uploads/new"
  #post "uploads/create"
  #get "uploads/show"
  resources :uploads, :only => [:new, :create, :show] 
end
