Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

namespace :admin do
  resources :stats, only: [:index]
end
#SAME AS ^^^^^ but with different helpers
#scope '/admin', module: 'admin' do
#  resources :stats, only: [:index]
#end
#It makes site/admin/stats work

  root 'posts#index'
end
