# -*- coding: utf-8 -*-
class SuiviDemandesService < ActiveRecord::Base
  has_many :notification
  attr_accessible :ref_demande, :dt_reception_demande, :statut_demande, :societe, :bu, :nom_projet, :nom_demandeur, :fonction_demandeur, :activite, :offre_service, :charge, :remarque, :dt_analyse, :id, :dt_statut_final, :fonction_valideur, :ressource_dqi, :nom_valideur
  validates :ref_demande, presence: true
  def self.nouveau_suivi(suivi,nom_projet)
    #Créer un nouvel objet nouveau_suivi en récupérant les attributs de suivi et le nom du projet
    nouveau_suivi = self.new do |n|
      n.fonction_demandeur = suivi.fonction_demandeur
      n.ref_demande = suivi.ref_demande
      n.dt_reception_demande = Date.current()
      n.statut_demande = "Nouvelle"
      n.societe = suivi.societe
      n.bu = suivi.bu
      n.nom_projet = nom_projet
      n.nom_demandeur = User.current.name
#      n.fonction_demandeur = User.current.role
      n.activite = suivi.activite
      n.offre_service = suivi.offre_service
#      n.charge = suivi.charge
      n.remarque = suivi.remarque
    end
  end
end
