Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :services
  get '/servicos', to: 'services#index'
  # ação 'caminho_no_navegador', to: 'controller#acao'
end
