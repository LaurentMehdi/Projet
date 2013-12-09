package miage.SystemeDeReservation.Service;

import java.util.List;

import miage.SystemeDeReservation.classes.VoitureTable;

public interface VoitureService {
	public void addVoiture(VoitureTable e);
	public void majVoiture(VoitureTable e);
	public VoitureTable getVoiture(int id);
	public void deleteVoiture(int id);
	public List<VoitureTable> getVoitures();
}
