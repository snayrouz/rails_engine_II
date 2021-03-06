Rails.application.routes.draw do
 namespace :api do
   namespace :v1 do
     resources :items, only: [:index, :show]
     resources :merchants, only: [:index, :show]
     resources :customers, only: [:index, :show]
     resources :invoices, only: [:index, :show]
     resources :invoice_items, only: [:index, :show]
     resources :transactions, only: [:index, :show]
   end
 end
end
