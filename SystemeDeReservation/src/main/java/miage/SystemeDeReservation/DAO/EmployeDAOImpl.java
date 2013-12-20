package miage.SystemeDeReservation.DAO;

import java.util.List;

import miage.SystemeDeReservation.classes.EmployeTable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeDAOImpl implements EmployeDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void addEmploye(EmployeTable e) {
		getCurrentSession().save(e);
	}

	@Override
	public void majEmploye(EmployeTable e) {
		EmployeTable Emaj = getEmploye(e.getId());
		
		Emaj.setNom(e.getNom());
		Emaj.setPrenom(e.getPrenom());
		Emaj.setMail(e.getMail());
		Emaj.setTel(e.getTel());
		Emaj.setSexe(e.getSexe());
		getCurrentSession().update(Emaj);
	}

	@Override
	public EmployeTable getEmploye(int id) {
		EmployeTable employe = (EmployeTable) getCurrentSession().get(EmployeTable.class, id);
		return employe;
	}

	@Override
	public void deleteEmploye(int id) {
		EmployeTable e = getEmploye(id);
		if(e != null){
			getCurrentSession().delete(e);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeTable> getEmployes() {
		return getCurrentSession().createQuery("from EmployeTable ORDER BY nom,prenom").list(); //A vérifier (pour les 3 classes du coup!)
	}

}
