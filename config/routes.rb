Rails.application.routes.draw do

  get "posts/:id", to: "posts#show", as: :post

  get "posts/:id/edit", to: "posts#edit", as: :edit_post

  patch "posts/:id", to: "posts#update"

end
