package miage.SystemeDeReservation.DAO;

import java.util.List;

import miage.SystemeDeReservation.classes.EmployeTable;

public interface EmployeDAO {
	public void addEmploye(EmployeTable e);
	public void majEmploye(EmployeTable e);
	public EmployeTable getEmploye(int id);
	public void deleteEmploye(int id);
	public List<EmployeTable> getEmployes();
}
