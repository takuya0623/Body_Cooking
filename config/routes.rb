Rails.application.routes.draw do
  
  #admin側のdevise
  namespace :admin do
  devise_for :admins, controllers: {
  sessions: 'admin/admins/sessions',
  registrations: 'admin/admins/registrations',
  passwords: 'admin/admins/passwords'
}
end
  
#customer側のdevise
  scope module: 'user' do
  devise_for :users, controllers: {
    sessions: 'user/users/sessions',
    registrations: 'user/users/registrations',
    passwords: 'user/users/passwords'
  }
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# admin側のルーティング(URLの頭にadminがつく)
namespace :admin do
  root :to => 'home#top'
  resources :users, only: [:index, :show, :edit, :update]
  resources :calories
  get 'search' => 'search#search'
end

# customer側のルーティング
scope module: 'user' do
  root :to => 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  resources :calories, only: [:index, :show]
  resource :users, only: [:show, :edit, :update, :destroy]
  get 'user/withdraw' => 'users#withdraw', as: 'withdraw_user'
  patch 'user/change' => 'users#change',as: 'change_user'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'user/:id/follow' =>'users#follow', as: 'follows'
  get 'user/:id/followed'=>'users#followed', as: 'followed'
  resources :materials
  resources :procedures
  resources :posts do
    resource :favorites,only: [:create, :destroy]
		resources :post_comments,only: [:create, :destroy]
	end
  get 'user/choise'=>'posts#choise',as: 'choise_post'

  end

end
