class Notification < ActiveRecord::Base
  belongs_to :suivi_demandes_service
  attr_accessible :id_suivi, :old_suivi, :old_status, :new_status, :role, :dt_notification
  def self.nouvelle_notif(suivi1, statut = nil)
    nouvelle_notif = self.new do |n|
      n.id_suivi = suivi1.id
      n.ref_suivi = suivi1.ref_demande
	  n.project = suivi1.nom_projet
      n.dt_notification = Date.current()
      if statut == nil
        n.new_status = suivi1.statut_demande
        n.role = suivi1.fonction_demandeur
      else
        n.new_status = suivi1.statut_demande
        n.old_status = statut
        n.role = suivi1.fonction_valideur
      end
    end
    nouvelle_notif.save
  end
end
