Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :press_clippings
  end
end
