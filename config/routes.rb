Rails.application.routes.draw do
  root 'welcome#login'
  resources :posts
  devise_for :users, controllers: {registrations: 'admin/registrations', sessions: 'admin/sessions'}
  # :controllers => { :sessions => "admin/sessions"}
  # devise_scope :user do
  #   get '/', to: 'welcome#login'
  # end




  # devise_scope :user do
  #  get "users/sign_up" => "devise/registrations#new"
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
