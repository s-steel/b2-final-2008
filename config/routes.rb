Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :doctors, only: [:show] do
      patch '/patients/:id', to: 'patients#remove'
    end
# ^^ one unrestful route in order to remove a patient from a doctor, but not delete from the database

    resources :hospitals, only: [:show]

end
