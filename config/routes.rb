Rails.application.routes.draw do
  
  resources :posts
  devise_for :users
  # , :controllers => { :sessions => "welcome"}
  devise_scope :user do
    get '/', to: 'devise/sessions#new'
  end




  # devise_scope :user do
  #  get "users/sign_up" => "devise/registrations#new"
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
