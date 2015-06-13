# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'projects/:id/suivi_demandes_service/', to: 'suivi_demandes_service#index', as: :suivi_demandes_service
get 'projects/:id/suivi_demandes_service/new', to: 'suivi_demandes_service#new', as: :suivi_demandes_service_new
post 'project/:id/suivi_demandes_service/create/', :to => 'suivi_demandes_service#create', as: :suivi_demandes_service_create
