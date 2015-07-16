# -*- coding: utf-8 -*-
class GdController < ApplicationController
  unloadable
  before_filter :find_project, :authorize
  
  def index 
    @gd = Services.all
  end

  def find_project
    @project = Project.find(params[:id])
  end
  def new
    @suivi_service = Services.new
  end
  def create
    suivi_service = Services.new(params[:gd])
    suivi = Services.nouveau_suivi(suivi_service)
    if suivi.save
      flash[:notice] = 'Nouveau suivi de services enregistré.'
    else
      flash[:notice] = 'Suivi de services non enregistré.'
    end
    redirect_to :action => 'index'
  end
end
