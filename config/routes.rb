Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
     namespace :transactions do
       get "find_all", to: "search#index"
       get "find", to: "search#show"
       get "/:id/invoice", to: "invoice#show"
     end

     resources :items, only: [:index, :show]
     resources :merchants, only: [:index, :show]
     resources :customers, only: [:index, :show]
     resources :invoices, only: [:index, :show]
     resources :invoice_items, only: [:index, :show]
     resources :transactions, only: [:index, :show]
   end
 end
end
