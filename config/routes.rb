Rails.application.routes.draw do
  root "soofa_demo#home"
  resources :demos
end
