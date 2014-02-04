Peekinonme::Application.routes.draw do
  root 'welcome#index'
  resources :patients
  resources :caregivers

  devise_for :users, :controllers => { :registrations => "registrations" }
end
