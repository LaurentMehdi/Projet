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
		System.out.println("début majVoiture de DAOIMPL");
		System.out.println("début du get de majVoiture de DAOIMPL");
		VoitureTable Vmaj = getVoiture(v.getId());
		System.out.println("fin du get de majVoiture de DAOIMPL");
		Vmaj.setMarque(v.getMarque());
		Vmaj.setModele(v.getModele());
		Vmaj.setAnnee(v.getAnnee());
		Vmaj.setImmatriculation(v.getImmatriculation());
		System.out.println("fin du majVoiture de DAOIMPL");
	}

	@Override
	public VoitureTable getVoiture(int id) {
		VoitureTable voiture = (VoitureTable) getCurrentSession().get(VoitureTable.class, id);
		System.out.println("voitureid "+voiture.getId());
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
