Rails.application.routes.draw do

root 'trip#index'

resources :trips do
  resources :locations 
end



end
