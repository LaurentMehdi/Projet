package miage.SystemeDeReservation.DAO;

import java.util.List;

import miage.SystemeDeReservation.classes.VoitureTable;



public interface VoitureDAO {
	public void addVoiture(VoitureTable e);
	public void majVoiture(VoitureTable e);
	public VoitureTable getVoiture(int id);
	public void deleteVoiture(int id);
	public List<VoitureTable> getVoitures();
}
