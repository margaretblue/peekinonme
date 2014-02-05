Peekinonme::Application.routes.draw do
  root 'welcome#index'

  devise_for :users, :controllers => { :registrations => 'registrations'}, :path => 'account'

  resources :users, :only => [:show] do
    resources :patients
  end

end
