package miage.SystemeDeReservation.classes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="voitures")
public class VoitureTable {

	//Attributs de la classe.
	@Id
	@GeneratedValue
	private Integer id; //Identificateur unique de la voiture 
	@NotEmpty(message="Marque obligatoire")
	private String marque; //Marque de la voiture. Exemple: Peuge*t
	@NotEmpty(message="Modèle obligatoire")
	private String modele;//Modele de la voiture. Exemple: 3*8
	@NotNull(message="Année obligatoire")
	private Integer annee; //Année de commercialisation de la voiture. Exemple: 2008
	@NotEmpty(message="Immatriculation obligatoire")
	private String immatriculation; //Immatriculatin de la voiture. Exemple: B*-78*-Y*
	
	//Constructeur par défaut, initialise tous les champ à 0 ou "". Créé un employé vide.
	public VoitureTable(){
		marque = "";
		modele="";
		annee = 0;
		immatriculation ="";
	}
		
	//Constructeur
	public VoitureTable(String marque, String modele, int annee, String immatriculation){
		this.marque = marque;
		this.modele=modele;
		this.annee = annee;
		this.immatriculation =immatriculation;
	}
	
	//Getters & Setters
	public int getId(){
		return id;
	}
	
	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	public String getModele() {
		return modele;
	}
	public void setModele(String modele) {
		this.modele = modele;
	}
	public Integer getAnnee() {
		return annee;
	}
	public void setAnnee(Integer annee) {
		this.annee = annee;
	}
	public String getImmatriculation() {
		return immatriculation;
	}
	public void setImmatriculation(String immatriculation) {
		this.immatriculation = immatriculation;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
