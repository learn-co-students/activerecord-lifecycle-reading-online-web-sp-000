Rails.application.routes.draw do
  get '/posts/:id', to: 'posts#show'
  get '/posts/:id/edit', to: 'posts#edit', as:'edit_post'
  patch '/posts/:id', to: 'posts#update', as: 'post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
