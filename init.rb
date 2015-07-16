# -*- coding: utf-8 -*-
Redmine::Plugin.register :gestion_demande do
  name 'Gestion des demandes'
  author 'Anthony Hartock/Dimitri Dallongeville'
  description 'Plugin pour la gestion des demandes'
  version '0.0.1'
  #Onglet du menu projet qui s'appel "suivi"
  menu :project_menu, :gestion_demande, { :controller => 'suivi_demandes_service', :action => 'index' }, :caption => 'Suivi', :after => :activity
  #Permet de gérer les permissions des roles pour les actions
  project_module :suivi_demandes_service do
    permission :index_suivi_demandes_service, :suivi_demandes_service => :index
    permission :new_suivi_demandes_service, :suivi_demandes_service => :new
    permission :create_suivi_demandes_service, :suivi_demandes_service => :create
    permission :analyser_suivi_demandes_service, :suivi_demandes_service => :analyser
    permission :save_analyse_suivi_demandes_service, :suivi_demandes_service => :save_analyse
    permission :modif_suivi_demandes_service, :suivi_demandes_service => :modif
    permission :save_modif_suivi_demandes_service, :suivi_demandes_service => :save_modif
	permission :notifications_suivi_demandes_service, :suivi_demandes_service => :notifications
	permission :index_gd, :gd => :index
	permission :new_gd, :gd => :new
	permission :create_gd, :gd => :create
  end
end
