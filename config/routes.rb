Rails.application.routes.draw do
  root to: 'people#index'
  resources :users, path: :usuarios
  resources :attendances, path: :atendimentos
  resources :people, path: :cidadaos
  resources :technicians, path: :tecnicos
  resources :assistances, path: :beneficios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :services, path: :servicos
  #get '/servicos', to: 'services#index'
  # ação 'caminho_no_navegador', to: 'controller#acao'
end
