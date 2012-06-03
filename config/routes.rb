TwitterSrch::Application.routes.draw do
  
  root to: 'tweets#index'
  post 'tweets/search'
  
end
