package miage.SystemeDeReservation.Service;

import java.util.List;

import miage.SystemeDeReservation.DAO.VoitureDAO;
import miage.SystemeDeReservation.classes.VoitureTable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class VoitureServiceImpl implements VoitureService {
	
	@Autowired
	private VoitureDAO voitureDAO;

	@Override
	public void addVoiture(VoitureTable v) {
		voitureDAO.addVoiture(v);
	}

	@Override
	public void majVoiture(VoitureTable v) {
		System.out.println("début du majVoiture deserviceIMPL");
		voitureDAO.majVoiture(v);
		System.out.println("fin du majVoiture deserviceIMPL");
	}

	@Override
	public VoitureTable getVoiture(int id) {
		return voitureDAO.getVoiture(id);
	}

	@Override
	public void deleteVoiture(int id) {
		voitureDAO.deleteVoiture(id);
	}

	@Override
	public List<VoitureTable> getVoitures() {
		return voitureDAO.getVoitures();
	}

}
