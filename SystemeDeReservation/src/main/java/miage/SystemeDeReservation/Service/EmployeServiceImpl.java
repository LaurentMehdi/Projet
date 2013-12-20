package miage.SystemeDeReservation.Service;

import java.util.List;

import miage.SystemeDeReservation.DAO.EmployeDAO;
import miage.SystemeDeReservation.classes.EmployeTable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class EmployeServiceImpl implements EmployeService {
	
	@Autowired
	private EmployeDAO employeDAO;

	@Override
	public void addEmploye(EmployeTable e) {
		employeDAO.addEmploye(e);
	}

	public void majEmploye(EmployeTable e) {
		employeDAO.majEmploye(e);
	}

	@Override
	public EmployeTable getEmploye(int id) {
		
		return employeDAO.getEmploye(id);
	}

	@Override
	public void deleteEmploye(int id) {
		employeDAO.deleteEmploye(id);
	}

	@Override
	public List<EmployeTable> getEmployes() {
		return employeDAO.getEmployes();
	}


}
