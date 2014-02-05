Peekinonme::Application.routes.draw do
  root 'welcome#index'

  devise_for :users do
    resources :patients
  end
end
