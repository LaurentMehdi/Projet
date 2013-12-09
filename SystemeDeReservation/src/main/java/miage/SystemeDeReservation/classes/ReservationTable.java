package miage.SystemeDeReservation.classes;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="reservations")
public class ReservationTable {

	//Attributs de la classe.
	@Id
	@GeneratedValue
	private Integer id;
	
	@NotNull
	private int employe;
	
	@NotNull
	private int voiture;
	
	@NotNull
	private int annee;
	
	@NotNull
	private int anneef;
	
	@NotNull
	private int mois;
	
	@NotNull
	private int moisf;
	
	@NotNull
	private int jour;
	
	@NotNull
	private int jourf;
	
	
	
	@NotEmpty
	private String raisonReservation;
	
	//Constructeur par défaut, initialise tous les champ à 0 ou "". Créé un employé vide.
	public ReservationTable() {
		this.employe = 0;
		this.voiture = 0;
		this.jour = 0;
		this.jourf = 0;
		this.mois = 0;
		this.moisf = 0;
		this.raisonReservation = "";
	}
		
	//Constructeur
	public ReservationTable(int employe, int voiture, int debut, int fin, int mdebut , int mfin , int adebut, int afin , String raisonReservation){
		this.employe = 0;
		this.voiture = 0;
		this.jour = debut;
		this.jourf = fin;
		this.mois = mdebut;
		this.moisf = mfin;
		this.annee = adebut;
		this.anneef = afin;
		this.raisonReservation = raisonReservation;
	}
	
	
	
	public int getAnnee() {
		return annee;
	}

	public void setAnnee(int annee) {
		this.annee = annee;
	}

	public int getAnneef() {
		return anneef;
	}

	public void setAnneef(int anneef) {
		this.anneef = anneef;
	}

	public int getMois() {
		return mois;
	}

	public void setMois(int mois) {
		this.mois = mois;
	}

	public int getMoisf() {
		return moisf;
	}

	public void setMoisf(int moisf) {
		this.moisf = moisf;
	}

	public int getJourf() {
		return jourf;
	}

	public void setJourf(int jourf) {
		this.jourf = jourf;
	}

	public int getJour() {
		return jour;
	}

	public void setJour(int jour) {
		this.jour = jour;
	}

	//Getters & Setters
	public int getId(){
		return id;
	}

	
	public void setId(Integer id) {
		this.id = id;
	}

	public int getEmploye() {
		return employe;
	}

	public void setEmploye(int employe) {
		this.employe = employe;
	}

	public int getVoiture() {
		return voiture;
	}

	public void setVoiture(int voiture) {
		this.voiture = voiture;
	}

	public String getRaisonReservation() {
		return raisonReservation;
	}

	public void setRaisonReservation(String raisonReservation) {
		this.raisonReservation = raisonReservation;
	}
	 
	
}
