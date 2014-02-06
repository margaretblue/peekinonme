Peekinonme::Application.routes.draw do


  root 'welcome#index'

  devise_for :users, :controllers => { :registrations => 'registrations'}, :path => 'account'

  resources :users, shallow: true do
    resources :patients, shallow: true do
      resources :checkins do
        get 'checkin'
      end
    end
  end
end
