# -*- coding: utf-8 -*-
# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
#Route pour la page d'accueil
get 'projects/:id/suivi_demandes_service/', to: 'suivi_demandes_service#index', as: :suivi_demandes_service
#Route pour accéder au formulaire d'une nouvelle demande
get 'projects/:id/suivi_demandes_service/new', to: 'suivi_demandes_service#new', as: :suivi_demandes_service_new
#Route pour créer une nouvelle demande
post 'project/:id/suivi_demandes_service/create/', :to => 'suivi_demandes_service#create', as: :suivi_demandes_service_create
#Route pour afficher le formulaire d'analyse d'une demande
get 'project/:id/suivi_demandes_service/analyser/:id_suivi', :to => 'suivi_demandes_service#analyser', as: :suivi_demandes_service_analyser
#Route pour faire les modifications de l'analyse
patch 'project/:id/suivi_demandes_service/save_analyse/:id_suivi', :to => 'suivi_demandes_service#save_analyse', as: :suivi_demandes_service_save_analyse
get 'project/:id/suivi_demandes_service/modif/:id_suivi', :to => 'suivi_demandes_service#modif', as: :suivi_demandes_service_modif
patch 'project/:id/suivi_demandes_service/save_modif/:id_suivi', :to => 'suivi_demandes_service#save_modif', as: :suivi_demandes_service_save_modif
get 'project/:id/suivi_demandes_service/notifications', :to => 'suivi_demandes_service#notifications', as: :suivi_demandes_service_notifications
get'project/:id/gd', :to => 'gd#index', as: :gd
get 'projects/:id/gd/new', :to =>'gd#new', as: :gd_new
post 'project/:id/gd/create/', :to => 'gd#create', as: :gd_create