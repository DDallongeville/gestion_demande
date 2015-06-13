Redmine::Plugin.register :gestion_demande do
  name 'Gestion des demandes'
  author 'Anthony Hartock/Dimitri Dallongeville'
  description 'Plugin pour la gestion des demandes'
  version '0.0.1'
  menu :project_menu, :gestion_demande, { :controller => 'suivi_demandes_service', :action => 'index' }, :caption => 'Suivi', :after => :activity
  project_module :suivi_demandes_service do
    permission :index_suivi_demandes_service, :suivi_demandes_service => :index
    permission :new_suivi_demandes_service, :suivi_demandes_service => :new
    permission :create_suivi_demandes_service, :suivi_demandes_service => :create
  end
end
