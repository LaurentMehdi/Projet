package miage.SystemeDeReservation.Service;

import java.util.List;

import miage.SystemeDeReservation.DAO.ReservationDAO;
import miage.SystemeDeReservation.classes.ReservationTable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDAO reservationDAO;

	@Override
	public void addReservation(ReservationTable r) {
		reservationDAO.addReservation(r);
	}

	@Override
	public void majReservation(ReservationTable r) {
		reservationDAO.majReservation(r);
	}

	@Override
	public ReservationTable getReservation(int id) {
		return reservationDAO.getReservation(id);
	}

	@Override
	public void deleteReservation(int id) {
		reservationDAO.deleteReservation(id);
	}

	@Override
	public List<ReservationTable> getReservations() {
		return reservationDAO.getReservations();
	}

}
