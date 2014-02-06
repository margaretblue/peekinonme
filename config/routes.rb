Peekinonme::Application.routes.draw do


  root 'welcome#index'

  devise_for :users, :controllers => { :registrations => 'registrations'}, :path => 'account'
  resources :users, :only => [:show], shallow: true do
    resources :patients, shallow: true do
      resources :checkins
    end
  end

end
