Rails.application.routes.draw do
  get 'pig_latin/index'
  post :'piglatin', to: 'pig_latin#translate'

  root 'pig_latin/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
