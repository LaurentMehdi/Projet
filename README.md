Reservation project
======
Made by Mehdi belhadj Ahmed  & Ehrhart Laurent.
Project made for the second year of Master Miage (Master of Business Informatics).

Configure & run the project (on Ecplise Kernel):
- Clone a Git Repository and type the URI (https://github.com/LaurentMehdi/Projet)
- File -> import -> project from Git -> Existing local repository -> Choose the good project and click next -> Select the good repository and click next -> Finish
- Right Click on the project -> Run As -> Maven Build -> Then put "tomcat7:run" on the input Goals -> Then click Run


Use the software:

The main page has the URI: http://localhost:8080/SystemeDeReservation

Tab "Employés":
- See the list of all employees by clicking on "Liste des employés"
- Add an employee by clicking on "Création"
  - You will have to enter all informations about the new employee
  - Then click on "Valider"
  - You can abort by clicking on "Annuler"
  - All fields are mandatory. You cannot create an employee if you haven't fill all fields
- Modify an employee by clicking on "Editer" on an existing employee
- Delete an employee by clicking on "Supprimer" on an existing employee

Tab "Voitures":
- See the list of all cars by clicking on "Liste des voitures"
- Add an car by clicking on "Création"
  - You will have to enter all informations about the new car
  - Then click on "Valider"
  - You can abort by clicking on "Annuler"
  - All fields are mandatory. You cannot create a car if you haven't fill all fields
- Modify a car by clicking on "Editer" on an existing car
- Delete a car by clicking on "Supprimer" on an existing car

Tab "Reservations":
- See the list of all reservations by clicking on "Liste des réservations". You will see all the existing reservations on the planning.
- Add a reservation by clicking on "Création"
  - You will have to enter all informations about the new reservation
  - Then click on "Valider"
  - You can abort by clicking on "Annuler"
  - All fields are mandatory. You cannot create a reservation if you haven't fill all fields
- Modify a reservation by selecting a reservation and clicking on "Modification"
- Delete a reservation by selecting a reservation and clicking on "Suppression"
