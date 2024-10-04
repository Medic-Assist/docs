-- Création de la base de données
CREATE DATABASE IF NOT EXISTS MedicAssist;


USE MedicAssist;

-- Création des Tables
CREATE TABLE IF NOT EXISTS CentreMedical (
  idCentreMed INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  adresse VARCHAR(255) NOT NULL,
  codePostal INT NOT NULL, 
  ville VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Utilisateur (
  idUser INT PRIMARY KEY AUTO_INCREMENT, 
  prenom VARCHAR(100) NOT NULL,
  nom VARCHAR(100) NOT NULL,
  Role ENUM('Patient','Proche','PersonnelMed') NOT NULL
  
);

CREATE TABLE IF NOT EXISTS UserRainbow (
  idRainBow VARCHAR(255),
  idUser INT,
  PRIMARY KEY (idRainBow, idUser),
  FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Patient (
  idUser INT PRIMARY KEY,
  adresse_principale VARCHAR(255) NOT NULL,
  codePostal_principal INT NOT NULL, 
  ville_principale VARCHAR(255) NOT NULL,
  adresse_temporaire VARCHAR(255), -- a n'utiliser si jamais on ne part pas du lieu habituel
  codePostal_temporaire INT ,
  ville_temporaire VARCHAR(255) ,
  FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Proche (
  idUser INT PRIMARY KEY,
  adresse VARCHAR(255),
  codePostal INT, 
  ville VARCHAR(255),
  FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PersonnelMed (
  idUser INT PRIMARY KEY,
  idCentreMed INT,
  FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser) ON DELETE CASCADE,
  FOREIGN KEY (idCentreMed) REFERENCES CentreMedical(idCentreMed) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS RDV (
  idRDV INT PRIMARY KEY AUTO_INCREMENT,
  intitule VARCHAR(255),
  horaire TIME NOT NULL,
  dateRDV DATE NOT NULL,
  idUser INT,
  idCentreMed INT,
  isADRPrincipale BOOLEAN,
  FOREIGN KEY (idUser) REFERENCES Utilisateur(idUser) ON DELETE CASCADE,
  FOREIGN KEY (idCentreMed) REFERENCES CentreMedical(idCentreMed) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Proche_Patient (
  idPatient INT,
  idProche INT,
  PRIMARY KEY (idPatient, idProche),
  FOREIGN KEY (idPatient) REFERENCES Patient(idUser) ON DELETE CASCADE,
  FOREIGN KEY (idProche) REFERENCES Proche(idUser) ON DELETE CASCADE
);


