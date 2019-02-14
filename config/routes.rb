Rails.application.routes.draw do
  use_doorkeeper
  # devise_for :users
  # resources :roles, path: 'indexr'
  
  # resources :user, path: 'indexur' do
  #   member do
  #     get :confirm_email
  #   end
  # end

  # resources :hotels, path: 'indexh'
  # resources :menus_roles, path: 'indexmr'
  # resources :packages, path: 'indexp'
  # resources :hotels_users, path: 'indexhu'

  # # root 'roles#index'
  # # get 'roles/index'

  # # resources :films
  # # root 'films#index'
  # # resources :bases, path: 'i'
  # get '/bases/hotelList'
  # get '/bases/super'
  # get '/bases/superhome'
  # get '/bases/user'
  # get '/bases/userhome'
  # root 'bases#indux'
  # # get 'roles/index'
  # # get 'roles/new'
  
  # # get 'packages/indux'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  ###########################################################################################
#   namespace :v1 do
#     resources :hotels, only: [:index, :show] do 
#       collection {
#         resources :access
#       }
#       resources :roles
#       resources :users
#     end

#     resources :dashboards, only: :index do 
#       collection {
#         get :home
#       }
#     end
#   end


#   root 'v1/dashboards#index'
# end

##################### V2
# devise_for :users, except: :create
# devise_for :users, :controllers => {:registrations => "registrations"}, skip: [:sessions, :registrations, :passwords]
resources :articles
resources :webreqs
devise_for :users, :controllers => {:registrations => "registrations"}
devise_scope :user do
  get    '/v2/hotels/:hotel_id/users/sign_up', to: 'registrations#new',    as: :newz_user_registration
end
# get 'users/sign_up' => '/v2/hotels/:hotel_id/users'
# get '/v2/hotels/:hotel_id/users/sign_up', to: 'registration#new'
namespace :v2 do
  resources :excels do
      collection { post :import }
  end
  resources :hotels, only: [:index, :show] do 
    # collection {
    #   resources :access
    # }
    resources :roles do
      resources :menus_roles
    end
    
    resources :users do
      # devise_for :users, :controllers => {:registrations => "registrations"}
    end
    # get "/v2/hotels/:hotel_id/cusers/new" => "devise/registrations#new", as: "new_v2_hotel_cuser"
    # post 'v2_hotel_cusers' => 'users#create', as: :v2_hotel_cusers     
  end
  resources :chotels
  resources :packages
  resources :menus
  resources :hotels_users
  resources :dashboards, only: :index do 
    collection {
      get :home
    }

  end
end


root 'v2/dashboards#index'

end
