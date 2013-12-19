package miage.SystemeDeReservation.classes;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

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
	
	/*@DateTimeFormat(pattern="MM/dd/yyyy")
	@NotNull(message="Date de d�but de r�servation obligatoire")*/
	private Date d�but;
	
	/*@DateTimeFormat(pattern="MM/dd/yyyy")
	@NotNull(message="Date de fin de r�servation obligatoire")*/
	private Date fin;
	
	@NotEmpty(message="Raison de la r�servation obligatoire")
	private String raisonReservation;
	
	//Constructeur par d�faut, initialise tous les champ � 0 ou "". Cr�� un employ� vide.
	public ReservationTable() {
		this.employe = 0;
		this.voiture = 0;
		this.d�but = null;
		this.fin = null;
		this.raisonReservation = "";
	}
		
	//Constructeur
	public ReservationTable(int employe, int voiture, Date d�but, Date fin , String raisonReservation){
		this.employe = 0;
		this.voiture = 0;
		this.d�but = d�but;
		this.fin = fin;
		this.raisonReservation = raisonReservation;
	}
	
	
	public Date getD�but() {
		return d�but;
	}

	public void setD�but(Date d�but) {
		this.d�but = d�but;
	}

	public Date getFin() {
		return fin;
	}

	public void setFin(Date fin) {
		this.fin = fin;
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
