Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  post "bookmkfolder/newfolder" => "bookmkfolder#newfolder"
  get "bookmkfolder/createfolder" => "bookmkfolder#createfolder"
  # post "bookmkfolder/createfolder" => "bookmkfolder#createfolder"
  devise_for :users, controllers: {registrations: 'admin/registrations', :omniauth_callbacks => "admin/omniauth_callbacks"}
  # :controllers => { :sessions => "admin/sessions"}
  # devise_scope :user do
  #   get '/', to: 'welcome#login'
  # end




  # devise_scope :user do
  #  get "users/sign_up" => "devise/registrations#new"
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
