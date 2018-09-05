Rails.application.routes.draw do


  #get "subs/edit", :to => 'subs#edit'
  resources :subs do
    resources :topics
  end

  scope 'topics/:topic_id', as: 'topic' do
    resources :comments, only: [:new, :create]
  end

  get "/stinkyfeet", :to => "subs#index"

  root "subs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
