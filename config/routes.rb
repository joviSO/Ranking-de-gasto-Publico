Rails.application.routes.draw do
  root to: redirect("/parliamentarians")
  resources :parliamentarians do
    collection do
      post :import
      get "gastos", to: "parliamentarians#gastos", as: :gastos
    end
  end

  resources :budget do
    collection do
      get :gastos, to: 'budgets#gastos', as: :gastos

    end
  end

end
