# -*- coding: utf-8 -*-
class SuiviDemandesServiceController < ApplicationController
  unloadable
  before_filter :find_project, :authorize
  #Page d'accueil du plugin
  def index
    #Recherche toutes les demandes qui ont l'Id de ce projet
    @suivi_demandes_service = SuiviDemandesService.where(nom_projet: @project.name).order(:dt_reception_demande).reverse_order
  end
  def find_project
    #Trouve un projet grace a son id
    @project = Project.find(params[:id])
  end
  def new
    #Permet de créer un nouvel objet pour faire un formulaire
    @suivi_demande = SuiviDemandesService.new
  end
  def create
    #Crée un nouvel objet avec les infos récupéré dans le formulaire
    suivi_demande = SuiviDemandesService.new(params[:suivi_demandes_service])
    #Crée un nouvel objet avec l'objet créer auparavant et le nom du projet
    suivi = SuiviDemandesService.nouveau_suivi(suivi_demande,@project.name)
    #Si l'objet créer s'enregistre
    if suivi.save
		notif = Notification.nouvelle_notif(suivi)
		flash[:notice] = 'Nouveau suivi de demandes de service enregistré.'
	else
		flash[:notice] = 'Suivi de demandes de service non enregistré.'
    end
    #On redirige à la page d'accueil
    redirect_to :action => 'index'
  end
  def analyser
    #Trouve la demande par rapport à son ID
    @suivi = SuiviDemandesService.find(params[:id_suivi])
  end

  def save_analyse
    #Trouve une demande grace à son ID
    @suivi = SuiviDemandesService.find(params[:id_suivi])
    statut = @suivi.statut_demande
    #Mets à jours la demande modifié avec le formulaire
    if @suivi.update_attributes(params[:suivi_demandes_service])
      SuiviDemandesService.update(params[:id_suivi], :dt_analyse => Date.current())
      #Si le statut de la demande est valider ou refuser
      if @suivi[:statut_demande] == "Valider" || @suivi[:statut_demande] == "Refuser"
        #Mets à jours les attributs
        SuiviDemandesService.update(params[:id_suivi], :dt_statut_final => Date.current(), :nom_valideur => User.current().name)
      end
      Notification.nouvelle_notif(@suivi, statut)
      flash[:notice] = 'Demande de service analysé.'
    else
      flash[:notice] = 'Cette demande de service ne peut être analysé.'
    end
    #Redirige à l'index
    redirect_to :action => 'index'
  end
  
  def modif
    #Trouve la demande par rapport à son ID
    @suivi = SuiviDemandesService.find(params[:id_suivi])
  end

  def save_modif
    #Trouve une demande grace à son ID
    @suivi = SuiviDemandesService.find(params[:id_suivi])
    #Mets à jours la demande modifié avec le formulaire
    if @suivi.update_attributes(params[:suivi_demandes_service])
      flash[:notice] = 'Demande de service modifié.'
    else
      flash[:notice] = 'Cette demande de service ne peut être modifié.'
    end
    #Redirige à l'index
    redirect_to :action => 'index'
  end
  
  def notifications
	@notifications = Notification.where(project: @project.name).order(:id).reverse_order
  end
end
