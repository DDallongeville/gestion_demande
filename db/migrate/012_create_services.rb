class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :Reference_Service
	  t.date :Date_signature_contrat
	  t.date :Date_debut_service
	  t.date :Date_previsionnelle_fin_service
	  t.date :Date_fin_service
      t.string :Statut_service
	  t.string :Societe
      t.string :Entite
      t.string :Nom_prenom_demandeur
      t.string :Fonction_demandeur
	  t.string :Ressources_DQI
	  t.string :Domaine_activite
	  t.string :Offre_service
	  t.string :Charges_DQI
      t.string :Remarques
    end
  end
end
