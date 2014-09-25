WorshipTuner::Application.routes.draw do
  resources :songs, :song_arrangements, :song_arrangement_files
  resources :blog_posts, path: 'blog' do
    get :dashboard, on: :collection
  end
  resources :blog_post_comments
  resources :blog_post_tags

  devise_for :users, path_names: { sign_up: 'register', sign_in: 'sign-in', sign_out: 'sign-out' }

  root to: 'static_pages#home'
  
  match '/how-it-works',  to: 'static_pages#how_it_works', as: '/how_it_works'
  match '/who-we-are',    to: 'static_pages#who_we_are', as: '/who_we_are'

  match '/contact',     to: 'contact#contact', via: :get
  match '/contact',     to: 'contact#contact_email', via: :post
end
