package miage.SystemeDeReservation.DAO;

import java.util.List;

import miage.SystemeDeReservation.classes.VoitureTable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VoitureDAOImpl implements VoitureDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void addVoiture(VoitureTable v) {
		getCurrentSession().save(v);
	}

	@Override
	public void majVoiture(VoitureTable v) {
		VoitureTable Vmaj = getVoiture(v.getId());
		Vmaj.setMarque(v.getMarque());
		Vmaj.setModele(v.getModele());
		Vmaj.setAnnee(v.getAnnee());
		Vmaj.setImmatriculation(v.getImmatriculation());
	}

	@Override
	public VoitureTable getVoiture(int id) {
		VoitureTable voiture = (VoitureTable) getCurrentSession().get(VoitureTable.class, id);
		return voiture;
	}

	@Override
	public void deleteVoiture(int id) {
		VoitureTable v = getVoiture(id);
		if(v != null){
			getCurrentSession().delete(v);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<VoitureTable> getVoitures() {
		return getCurrentSession().createQuery("from VoitureTable ORDER BY marque,modele").list(); //A vérifier (pour les 3 classes du coup!)
	}
}
