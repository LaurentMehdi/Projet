package miage.SystemeDeReservation.DAO;

import java.util.List;

import miage.SystemeDeReservation.classes.ReservationTable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOImpl implements ReservationDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void addReservation(ReservationTable r) {
		getCurrentSession().save(r);
	}

	@Override
	public void majReservation(ReservationTable r) {
		ReservationTable Rmaj = getReservation(r.getId());
		
		Rmaj.setEmploye(r.getEmploye());
		Rmaj.setVoiture(r.getVoiture());
		Rmaj.setAnnee(r.getAnnee());
		Rmaj.setAnneef(r.getAnneef());
		Rmaj.setMois(r.getMois());
		Rmaj.setMoisf(r.getMoisf());
		Rmaj.setJour(r.getJour());
		Rmaj.setJourf(r.getJourf());
		Rmaj.setRaisonReservation(r.getRaisonReservation());
	}

	@Override
	public ReservationTable getReservation(int id) {
		ReservationTable Reservation = (ReservationTable) getCurrentSession().get(ReservationTable.class, id);
		return Reservation;
	}

	@Override
	public void deleteReservation(int id) {
		ReservationTable r = getReservation(id);
		if(r != null){
			getCurrentSession().delete(r);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReservationTable> getReservations() {
		return getCurrentSession().createQuery("from ReservationTable").list(); //A vérifier (pour les 3 classes du coup!)
	}
}
