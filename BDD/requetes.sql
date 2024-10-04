/*Utitlisateur de medic Assists avec id Rainbow*/
SELECT * 
FROM Utilisateur U
JOIN UserRainbow UR ON UR.idUser = U.idUser
WHERE UR.idRainBow = 'charline.beaudeux@gmail.com'

/*Utitlisateur RainBow avec id Medic Assist*/
SELECT * 
FROM UserRainbow UR
JOIN  Utilisateur U ON U.idUser = UR.idUser
WHERE U.idUser = 1

/*Les RDV du patient avec l'id xx*/
SELECT * 
FROM RDV
WHERE idUser = xx

/*Les proches du Patient avec l'id xx*/
SELECT *
FROM Proche Pro
Left Join Proche_Patient PP ON PP.idProche = Pro.idUser
WHERE PP.idPatient = xx

/*Trouver un Patient grâce a son nom/prénom*/
SELECT * 
FROM Utilisateur 
WHERE Role = 'Patient' AND (prenom like %'prenom'% OR nom like %'nom'%)

/*Personnels médical référent de la où est mon RDV*/
SELECT PM.idUser, U.prenom, U.nom
FROM RDV 
LEFT JOIN PersonnelMed PM ON PM.idCentreMed = RDV.idCentreMed
LEFT JOIN Utilisateur U ON U.idUser = PM.idUser

/*Listes de tous les Centres médicaux*/
SELECT * FROM CentreMedical

/*Listes des Personnels med par Centre médical*/
SELECT CM.idCentreMed, CM.nom, PM.idUser, U.prenom, U.nom
FROM PersonnelMed PM
JOIN CentreMedical CM ON CM.idCentreMed = PM.idCentreMed
JOIN Utilisateur U ON U.idUser = PM.idUser
ORDER BY CM.idCentreMed;


/*Mettre à jour l'horaire et la date d'un rendez-vous*/
UPDATE RDV
SET horaire = '11:30', dateRDV = '2024-09-25'
WHERE idRDV = 1 AND idUser = 1;  -- Modifier le rendez-vous 1 pour l'utilisateur 1 (par exemple Alice)


/*Récuperer tous les Patients*/
SELECT * FROM Utilisateur WHERE role = 'Patient'

/*Mettre à jour l'adresse principale et temporaire d'un patient*/
UPDATE Patient
SET adresse_temporaire = 'Nouvelle adresse temporaire',
    codePostal_temporaire = 75003,
    ville_temporaire = 'Nouvelle ville temporaire'
WHERE idUser = ...

UPDATE RDV
SET isADRPrincipal = FALSE
WHERE dateRDV = CURDATE() AND idUser = xx;

/*Mettre à jour les informations d'un utilisateur*/
UPDATE Utilisateur
SET prenom = 'Nouveauprenom', nom = 'Nouveaunom'
WHERE idUser = 1;  -- Modifier l'utilisateur avec idUser = 1 (par exemple Alice)

/*Modifier les infos d'un Patient*/
UPDATE Patient
SET adresse_principale = 'Nouvelle adresse principale',
    codePostal_principal = 75002,
    ville_principale = 'Nouvelle ville principale',
    adresse_temporaire = 'Nouvelle adresse temporaire',
    codePostal_temporaire = 75003,
    ville_temporaire = 'Nouvelle ville temporaire'
WHERE idUser = 1;  -- Modifier le patient avec idUser = 1 (par exemple Alice)

/*Modifier les infos d'un PersonnelMed*/
UPDATE PersonnelMed
SET idCentreMed = 2
WHERE idUser = ...