Rails.application.routes.draw do
  root to: redirect("/parliamentarians")
  resources :parliamentarians do
    collection do
      post :import
    end
  end

end
