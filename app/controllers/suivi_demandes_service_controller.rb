# -*- coding: utf-8 -*-
class SuiviDemandesServiceController < ApplicationController
  unloadable
  before_filter :find_project, :authorize
  def index
    @suivi_demandes_service = SuiviDemandesService.where(nom_projet: @project.name).order(:dt_reception_demande).reverse_order
  end
  def find_project
    @project = Project.find(params[:id])
  end
  def new
    @suivi_demande = SuiviDemandesService.new
  end
  def create
    suivi_demande = SuiviDemandesService.new(params[:suivi_demandes_service])
    suivi = SuiviDemandesService.nouveau_suivi(suivi_demande,@project.name)
    if suivi.save
      flash[:notice] = 'Nouveau suivi de demandes de service enregistré.'
    else
      flash[:notice] = 'Suivi de demandes de service non enregistré.'
    end
    redirect_to :action => 'index'
  end
end
