Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :press_clippings do
      member do
        get :images
        get :new_image
        post :create_image
        get 'images/:image_id/edit', to: :edit_image, as: :edit_image
        patch 'images/:image_id/update', to: :update_image, as: :update_image
        delete 'images/:image_id', to: :delete_image, as: :delete_image
        post :update_positions
      end
    end
  end
end
