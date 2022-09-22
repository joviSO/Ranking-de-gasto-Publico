Rails.application.routes.draw do
  root to: redirect("/congressmen")
  resources :congressmen do
    collection do
      post :import
    end
  end

end
