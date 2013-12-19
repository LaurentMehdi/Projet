package miage.SystemeDeReservation.controller;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import miage.SystemeDeReservation.Service.EmployeService;
import miage.SystemeDeReservation.Service.ReservationService;
import miage.SystemeDeReservation.Service.VoitureService;
import miage.SystemeDeReservation.classes.EmployeTable;
import miage.SystemeDeReservation.classes.ReservationTable;
import miage.SystemeDeReservation.classes.VoitureTable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@Autowired
	private EmployeService employeService;
	
	@Autowired
	private VoitureService voitureService;
	
	@Autowired
	private ReservationService reservationService;
	
	private List<EmployeTable> employes;
	private List<VoitureTable> voitures;
	private List<ReservationTable> reservations;
	
	
	@RequestMapping(value="/")
	public ModelAndView mainPage() {
		return new ModelAndView("home");
	}

	@RequestMapping(value="/index")
	public ModelAndView indexPage() {
		return new ModelAndView("home");
	}

	@RequestMapping(value="/employe/add")
	public ModelAndView addEmployePage() {
		ModelAndView modelAndView = new ModelAndView("CreationEmploye");
		modelAndView.addObject("employe", new EmployeTable("nom","prenom",2,"51561","mej@uh.fr","Homme"));
		return modelAndView;
	}
	
	@RequestMapping(value="/voiture/add")
	public ModelAndView addVoiturePage() {
		ModelAndView modelAndView = new ModelAndView("CreationVoiture");
		modelAndView.addObject("voiture", new VoitureTable("peugeot","406",1254,"fze-45fez-ezf"));
		return modelAndView;
	}
	

	@RequestMapping(value="/reservation/add")
	public ModelAndView addReservationPage() {
		ModelAndView modelAndView = new ModelAndView("CreationReservation");
		modelAndView.addObject("voitures",voitureService.getVoitures());
		//System.out.println("employe " + employeService.getEmployes().size());
		modelAndView.addObject("employes",employeService.getEmployes());
		modelAndView.addObject("reservation", new ReservationTable());
		return modelAndView;
	}

		@RequestMapping(value="/employe/add/process")
		public ModelAndView addingEmploye(@Valid @ModelAttribute("employe") EmployeTable employe,BindingResult result) {
			ModelAndView modelAndView;
			if(result.hasErrors()){
				modelAndView = new ModelAndView("CreationEmploye");
			}else{
				String nomadd = employe.getNom();
				String prenomadd = employe.getPrenom();
				List<EmployeTable> listeemploye  = employeService.getEmployes();	
				for (EmployeTable employeTable : listeemploye) {
					String prenomemployeTable = employeTable.getPrenom();
					String nomemployeTable = employeTable.getNom();
					if((nomadd.equals(nomemployeTable))&&(prenomadd.equals(prenomemployeTable))){
						modelAndView = new ModelAndView("CreationEmploye");
						modelAndView.addObject("message", "Il y a déjà une personne avec ce nom et prénom"); 
						return modelAndView;
					}
				}
				modelAndView = new ModelAndView("listeEmploye");
				employeService.addEmploye(employe);
				employes = employeService.getEmployes();
				modelAndView.addObject("employes", employes);
			}
			return modelAndView;
		}
		
		@RequestMapping(value="/voiture/add/process")
		public ModelAndView addingVoiture(@Valid @ModelAttribute("voiture") VoitureTable voiture,BindingResult result) {
			ModelAndView modelAndView;
			if(result.hasErrors()){
				modelAndView = new ModelAndView("CreationVoiture");
			}else{
				String immatriculationvoitureadd = voiture.getImmatriculation();
				List<VoitureTable> listevoiture  = voitureService.getVoitures();	
				for (VoitureTable voitureTable : listevoiture) {
					String immatriculationvoitureTable = voitureTable.getImmatriculation();
					if(immatriculationvoitureadd.equals(immatriculationvoitureTable)){
						modelAndView = new ModelAndView("CreationVoiture");
						modelAndView.addObject("message", "Il y a déjà une voiture avec cette plaque d'immatriculation"); 
						return modelAndView;
					}
				}
				modelAndView = new ModelAndView("listeVoiture");
				voitureService.addVoiture(voiture);
				voitures = voitureService.getVoitures();
				modelAndView.addObject("voitures", voitures);
			}
			return modelAndView;
		}

		@RequestMapping(value="/reservation/add/process")
		public ModelAndView addingReservatio(@Valid @ModelAttribute("reservation") ReservationTable reservation,BindingResult result) {
			ModelAndView modelAndView;
			if(result.hasErrors()){
				modelAndView = new ModelAndView("CreationReservation");
				modelAndView.addObject("voitures", voitures);
				modelAndView.addObject("employes", employes);
			}else{
				
				Date datedebutreservation = reservation.getDébut();
				System.out.println("datedebutreservation : "+datedebutreservation);
				Date datefinreservation = reservation.getFin();
				System.out.println("Datefinreservation : "+datefinreservation);
				if((datefinreservation.before(datedebutreservation))){
					modelAndView = new ModelAndView("CreationReservation");
					modelAndView.addObject("voitures", voitures);
					modelAndView.addObject("employes", employes);
					modelAndView.addObject("message", "La date de fin de réservation doit être ultérieure à la date de début de réservation!!!"); 
					return modelAndView;
				}
			
				int id_employereservation = reservation.getEmploye();
				int id_voiturereservation = reservation.getVoiture();
				List<ReservationTable> listereservation  = reservationService.getReservations();
				for(ReservationTable reservationTable : listereservation) {
					Date datedebut = reservationTable.getDébut();
					Date datefin = reservationTable.getFin();
					int id_employe = reservationTable.getEmploye();
					int id_voiture = reservationTable.getVoiture();
					if(
							(
									(
											datedebutreservation.equals(datedebut)||datedebutreservation.equals(datefin)
											
									)||(
											datedebutreservation.before(datefin)&&datedebutreservation.after(datedebut)
									)||(
											datefinreservation.before(datefin)&&datefinreservation.after(datedebut)
									)||(
											datefinreservation.equals(datedebut)||datefinreservation.equals(datefin)
									)||(
											datedebutreservation.before(datedebut)&&datefinreservation.after(datefin)
										)
							)&&
							(
									(id_employe==id_employereservation)||(id_voiture==id_voiturereservation)	
							)
							
							
						){
						modelAndView = new ModelAndView("CreationReservation");
						modelAndView.addObject("voitures", voitures);
						modelAndView.addObject("employes", employes);
						modelAndView.addObject("message", "Il y a déjà une réservation dans la même plage de date"); 
						return modelAndView;
					}					
				}
					//System.out.println("Comme n'existe pas on continue");
					modelAndView = new ModelAndView("AffichageReservation");
					reservationService.addReservation(reservation);
					reservations = reservationService.getReservations();
					modelAndView.addObject("reservations", reservations);
			}
			return modelAndView;
		}
		
		@RequestMapping(value="/employe/list")
		public ModelAndView listOfEmployes() {
			ModelAndView modelAndView = new ModelAndView("listeEmploye");
			employes = employeService.getEmployes();
			modelAndView.addObject("employes", employes);
			if(employes.isEmpty()){
				modelAndView.addObject("messages", "Il n'y a aucun utilisateur pour le moment");
			}
			return modelAndView;
		}
		
		@RequestMapping(value="/voiture/list")
		public ModelAndView listedesVoitures() {
			ModelAndView modelAndView = new ModelAndView("listeVoiture");
			voitures = voitureService.getVoitures();
			modelAndView.addObject("voitures", voitures);
			if(voitures.isEmpty()){
				modelAndView.addObject("messages", "Il n'y a aucune voiture pour le moment");
			}
			return modelAndView;
		}
		
		@RequestMapping(value="/reservation/list")
		public ModelAndView reservation() {
			ModelAndView modelAndView = new ModelAndView("AffichageReservation");
			reservations = reservationService.getReservations();
			modelAndView.addObject("reservations", reservations);
			
			return modelAndView;
		}
		
		@RequestMapping(value="/employe/edit/{id}", method=RequestMethod.GET)
		public ModelAndView editEmployePage(@PathVariable Integer id) {
			ModelAndView modelAndView = new ModelAndView("ModificationEmploye");
			EmployeTable employe = employeService.getEmploye(id);
			modelAndView.addObject("employe",employe);
			return modelAndView;
		}
		
		
		
		
		@RequestMapping(value="/voiture/edit/{id}", method=RequestMethod.GET)
		public ModelAndView editVoiturePage(@PathVariable Integer id) {
			ModelAndView modelAndView = new ModelAndView("ModificationVoiture");
			VoitureTable voiture = voitureService.getVoiture(id);
			modelAndView.addObject("voiture",voiture);
			return modelAndView;
		}

		
		
		@RequestMapping(value="/employe/edit/{id}", method=RequestMethod.POST)
		public ModelAndView edditingEmploye(@Valid @ModelAttribute("employe") EmployeTable employe,BindingResult result,@PathVariable Integer id) {
			ModelAndView modelAndView ;
			if(result.hasErrors()){
				employe.setId(id);
				modelAndView = new ModelAndView("ModificationEmploye");
			}else{
				employe.setId(id);
				employeService.majEmploye(employe);
				modelAndView = new ModelAndView("listeEmploye");
				employes = employeService.getEmployes();
				modelAndView.addObject("employes", employes);
			}
			return modelAndView;
		}
		
		@RequestMapping(value="/voiture/edit/{id}", method=RequestMethod.POST )
		public ModelAndView edditingVoiture(@Valid @ModelAttribute("voiture") VoitureTable voiture,BindingResult result,@PathVariable Integer id) {
			ModelAndView modelAndView ;
			if(result.hasErrors()){
				voiture.setId(id);
				modelAndView = new ModelAndView("ModificationVoiture");
			}else{
			voiture.setId(id);
			voitureService.majVoiture(voiture);
			modelAndView = new ModelAndView("listeVoiture");
			voitures = voitureService.getVoitures();
			modelAndView.addObject("voitures", voitures);
			}
			return modelAndView;
		}
		
		@RequestMapping(value="/reservation/edit/{id}", method=RequestMethod.POST )
		public ModelAndView edditingReservation(@Valid @ModelAttribute("reservation") ReservationTable reservation,BindingResult result,@PathVariable Integer id) {
			ModelAndView modelAndView ;
			if(result.hasErrors()){
				reservation.setId(id);
				modelAndView = new ModelAndView("ModificationReservation");
				modelAndView.addObject("voitures", voitures);
				modelAndView.addObject("employes", employes);
			}else{
			reservation.setId(id);
			reservationService.majReservation(reservation);
			modelAndView = new ModelAndView("AffichageReservation");
			reservations = reservationService.getReservations();
			modelAndView.addObject("reservations", reservations);
			}
			return modelAndView;
		}
		
		
		
		@RequestMapping(value="/reservation/edit", method=RequestMethod.GET)
		public ModelAndView editReservationPage(@RequestParam(value = "modif") String modif) {
			ModelAndView modelAndView = new ModelAndView("ModificationReservation");
			ReservationTable reservation = reservationService.getReservation(Integer.parseInt(modif));
			modelAndView.addObject("voitures",voitureService.getVoitures());
			modelAndView.addObject("employes",employeService.getEmployes());
			modelAndView.addObject("reservation",reservation);	
			return modelAndView;
		}
				

		@RequestMapping(value="/employe/delete/{id}", method=RequestMethod.GET)
		public ModelAndView deleteEmploye(@PathVariable Integer id) {
			ModelAndView modelAndView = new ModelAndView("listeEmploye");
			employeService.deleteEmploye(id);
			employes = employeService.getEmployes();
			List<ReservationTable> listereservation  = reservationService.getReservations();
			//Suppression des réservations du client
			for(ReservationTable reservationTable : listereservation) {
				if(reservationTable.getEmploye()==id){
					reservationService.deleteReservation(reservationTable.getId());
				}
			}
			//On maj la liste des reservations
			reservations=reservationService.getReservations();
			modelAndView.addObject("employes", employes);
			return modelAndView;
		}

		@RequestMapping(value="/voiture/delete/{id}", method=RequestMethod.GET)
		public ModelAndView deleteVoiture(@PathVariable Integer id) {
			ModelAndView modelAndView = new ModelAndView("listeVoiture");
			voitureService.deleteVoiture(id);
			voitures = voitureService.getVoitures();
			List<ReservationTable> listereservation  = reservationService.getReservations();
			//Suppression des réservations de la voiture
			for(ReservationTable reservationTable : listereservation) {
				if(reservationTable.getVoiture()==id){
					reservationService.deleteReservation(reservationTable.getId());
				}
			}
			//On maj la liste des reservations
			reservations=reservationService.getReservations();
			modelAndView.addObject("voitures", voitures);
			return modelAndView;
		}
		
		@RequestMapping(value="/reservation/delete", method=RequestMethod.GET)
		public ModelAndView deleteReservation(@RequestParam(value = "suppr") String suppr) {
			ModelAndView modelAndView = new ModelAndView("AffichageReservation");
			reservationService.deleteReservation(Integer.parseInt(suppr));
			reservations = reservationService.getReservations();
			modelAndView.addObject("reservations", reservations);
			return modelAndView;
		}
	}

