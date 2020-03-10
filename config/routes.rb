# == Route Map
#
# 
# 
#   RuCaptcha's cache_store requirements are stored across processes and machines,
#   such as :mem_cache_store, :redis_store, or other distributed storage.
#   But your current set is [:file_store, "tmp/cache"], it has changed to :file_store for working.
#   NOTE: :file_store is still not a good way, it only works with single server case.
# 
#   Please make config file `config/initializers/rucaptcha.rb` to setup `cache_store`.
#   More infomation please read GitHub RuCaptcha README file.
#   https://github.com/huacnlee/rucaptcha
# 
#                      Prefix Verb   URI Pattern                          Controller#Action
#                  ru_captcha        /rucaptcha                           RuCaptcha::Engine
#                 rails_admin        /staff                               RailsAdmin::Engine
#   reset_password_api_v1_sms POST   /api/v1/sms/reset_password(.:format) api/v1/sms#reset_password
#                  api_v1_sms POST   /api/v1/sms(.:format)                api/v1/sms#create
# api_v1_reset_password_index POST   /api/v1/reset_password(.:format)     api/v1/reset_password#create
#             api_v1_sessions DELETE /api/v1/sessions(.:format)           api/v1/sessions#destroy
#                             POST   /api/v1/sessions(.:format)           api/v1/sessions#create
#                api_v1_users POST   /api/v1/users(.:format)              api/v1/users#create
#             api_v1_accounts GET    /api/v1/accounts(.:format)           api/v1/accounts#index
#              api_v1_notices GET    /api/v1/notices(.:format)            api/v1/notices#index
#              api_v1_banners GET    /api/v1/banners(.:format)            api/v1/banners#index
#            api_v1_transfers GET    /api/v1/transfers(.:format)          api/v1/transfers#index
#                             POST   /api/v1/transfers(.:format)          api/v1/transfers#create
#           done_api_v1_order POST   /api/v1/orders/:id/done(.:format)    api/v1/orders#done
#               api_v1_orders GET    /api/v1/orders(.:format)             api/v1/orders#index
#                             POST   /api/v1/orders(.:format)             api/v1/orders#create
#             api_v1_products GET    /api/v1/products(.:format)           api/v1/products#index
#             api_v1_my_index GET    /api/v1/my(.:format)                 api/v1/my#index
#              api_v1_markets GET    /api/v1/markets(.:format)            api/v1/markets#index
#           api_v1_activities GET    /api/v1/activities(.:format)         api/v1/activities#index
#             api_v1_deposits GET    /api/v1/deposits(.:format)           api/v1/deposits#index
#            api_v1_withdraws GET    /api/v1/withdraws(.:format)          api/v1/withdraws#index
#                             POST   /api/v1/withdraws(.:format)          api/v1/withdraws#create
#        invite_page_my_index GET    /my/invite_page(.:format)            my#invite_page
#       id_documents_my_index GET    /my/id_documents(.:format)           my#id_documents
#                    my_index PATCH  /my(.:format)                        my#update
#                    deposits POST   /deposits(.:format)                  deposits#create
#               sign_up_index GET    /sign_up(.:format)                   sign_up#index
#                             POST   /sign_up(.:format)                   sign_up#create
#                         sms POST   /sms(.:format)                       sms#create
#                        root GET    /                                    download#index
# 
# Routes for RuCaptcha::Engine:
#   root GET  /           ru_captcha/captcha#index
# 
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
# 

Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/staff', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :sms, :only => [:create] do
        collection do
          post :reset_password
        end
      end
      resources :reset_password, :only => [:create]
      resources :sessions, :only => [:create] do
        collection do
          delete '/', :to => 'sessions#destroy'
        end
      end
      resources :users, :only => [:create]
      resources :accounts, :only => [:index]
      resources :notices, :only => [:index]
      resources :banners, :only => [:index]
      resources :transfers, :only => [:index, :create]
      resources :orders, :only => [:index, :create] do
        member do
          post 'done'
        end
      end
      resources :products, :only => [:index]
      resources :my, :only => [:index]
      resources :markets, :only => [:index]
      resources :activities, :only => [:index]
      resources :deposits, :only => [:index]
      resources :withdraws, :only => [:index, :create]
    end
  end

  resources :my, :only => [] do
    collection do
      get :invite_page
      get :id_documents
      patch :update
    end
  end

  resource :deposits, :only => [:create]

  resources :sign_up, :only => [:index, :create]
  resources :sms, :only => [:create]

  root :controller => 'download', :action => 'index'
end
