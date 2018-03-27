Rails.application.routes.draw do
  devise_for :users
  root to: "buckets#index"
  resources :buckets do
    member do
      put 'like',     to: 'buckets#like'
      put 'dislike',  to: 'buckets#dislike'
      put 'add',      to: 'buckets#add_to_my_list'
      put 'remove',   to: 'buckets#remove_from_my_list'
    end
  end
  get 'my_list',      to: 'buckets#my_list'
end
