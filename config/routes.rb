Rails.application.routes.draw do
  root 'bookmkfolders#index'
  resources :bookmkfolders do
    resources :bookmks
  end

  resources :bookmks
  # resources :posts
  # post "bookmkfolder/newfolder" => "bookmkfolder#newfolder"

  post "/bookmkfolders/createfolder" => "bookmkfolders#createfolder"
  post "/bookmkfolders/:bookmkfolder_id" => "bookmks#createbookmk"
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
