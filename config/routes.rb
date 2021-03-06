Rails.application.routes.draw do
  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end

  resources :student_payments, only: :index

  get '/reports/subjects', to: "reports#subjects", as: :report_subjects

  root to: "visitors#index"

  devise_for :users 
end
