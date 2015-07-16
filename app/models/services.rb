# -*- coding: utf-8 -*-
class Services < ActiveRecord::Base
  unloadable
  attr_accessible :Reference_Service, :Date_signature_contrat, :Date_debut_service, :Date_previsionnelle_fin_service, :Date_fin_service, :Statut_service, :Societe, :Entite, :Nom_prenom_demandeur, :Fonction_demandeur, :Ressources_DQI,:Domaine_activite,:Offre_service,:Charges_DQI, :Remarques
  def self.nouveau_suivi(suivi)
    nouveau_suivi_services = self.new do |s|
      s.Reference_Service = suivi.Reference_Service
      s.Date_signature_contrat = suivi.Date_signature_contrat
      s.Date_debut_service = suivi.Date_debut_service
      s.Date_previsionnelle_fin_service = suivi.Date_previsionnelle_fin_service
      s.Date_fin_service = suivi.Date_fin_service
      s.Statut_service = "Accepté"
      s.Societe = suivi.Societe
      s.Entite = suivi.Entite
      s.Nom_prenom_demandeur = User.current.name
      s.Fonction_demandeur = suivi.Fonction_demandeur
      s.Ressources_DQI = suivi.Ressources_DQI
      s.Domaine_activite = suivi.Domaine_activite
      s.Offre_service = suivi.Offre_service
      s.Charges_DQI = suivi.Charges_DQI
      s.Remarques = suivi.Remarques
    end
  end
end
