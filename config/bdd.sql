CREATE DATABASE IF NOT EXISTS succursale;
USE succursale;
# -----------------------------------------------------------------------------
#       TABLE : APPRENANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS APPRENANT
 (
   ID_PERSONNE INTEGER(2) NOT NULL  ,
   ID_CLIENT INTEGER(2) NOT NULL  ,
   NOM VARCHAR(100) NOT NULL  ,
   PRENOM VARCHAR(100) NOT NULL  ,
   MAIL VARCHAR(100) NOT NULL  
   , PRIMARY KEY (ID_PERSONNE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE APPRENANT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_APPRENANT_CLIENT
     ON APPRENANT (ID_CLIENT ASC);

# -----------------------------------------------------------------------------
#       TABLE : PERSONNE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PERSONNE
 (
   ID_PERSONNE INTEGER(2) NOT NULL  AUTO_INCREMENT,
   NOM VARCHAR(100) NOT NULL  ,
   PRENOM VARCHAR(100) NOT NULL  ,
   MAIL VARCHAR(100) NOT NULL  
   , PRIMARY KEY (ID_PERSONNE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : FORMATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FORMATEUR
 (
   ID_PERSONNE INTEGER(2) NOT NULL  ,
   LOGIN VARCHAR(100) NOT NULL  ,
   MDP VARCHAR(100) NOT NULL  ,
   NOM VARCHAR(100) NOT NULL  ,
   PRENOM VARCHAR(100) NOT NULL  ,
   MAIL VARCHAR(100) NOT NULL  
   , PRIMARY KEY (ID_PERSONNE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SOUS_THEME
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SOUS_THEME
 (
   ID_SOUS_THEME INTEGER(2) NOT NULL  AUTO_INCREMENT,
   ID_THEME INTEGER(2) NOT NULL  ,
   LIBELLE VARCHAR(150) NOT NULL  ,
   CODE VARCHAR(10) NOT NULL  ,
   DESCRIPTION VARCHAR(1000) NOT NULL  
   , PRIMARY KEY (ID_SOUS_THEME) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE SOUS_THEME
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_SOUS_THEME_THEME
     ON SOUS_THEME (ID_THEME ASC);

# -----------------------------------------------------------------------------
#       TABLE : FORMATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FORMATION
 (
   ID_FORMATION INTEGER(2) NOT NULL  AUTO_INCREMENT,
   ID_PERSONNE INTEGER(2) NOT NULL  ,
   ANNULATION VARCHAR(1500) NULL  
   , PRIMARY KEY (ID_FORMATION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE FORMATION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_FORMATION_FORMATEUR
     ON FORMATION (ID_PERSONNE ASC);

# -----------------------------------------------------------------------------
#       TABLE : CLIENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLIENT
 (
   ID_CLIENT INTEGER(2) NOT NULL  AUTO_INCREMENT,
   NOM VARCHAR(150) NOT NULL  ,
   ADRESSE CHAR(32) NOT NULL  ,
   TELEPHONE VARCHAR(16) NOT NULL  ,
   MAIL VARCHAR(100) NOT NULL  
   , PRIMARY KEY (ID_CLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SUCCURSALE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SUCCURSALE
 (
   ID_SUCCURSALE INTEGER(2) NOT NULL  AUTO_INCREMENT,
   ADRESSE VARCHAR(150) NOT NULL  ,
   TELEPHONE VARCHAR(16) NOT NULL  ,
   MAIL VARCHAR(100) NOT NULL  
   , PRIMARY KEY (ID_SUCCURSALE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : GESTIONNAIRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS GESTIONNAIRE
 (
   ID_PERSONNE INTEGER(2) NOT NULL  ,
   ID_SUCCURSALE INTEGER(2) NOT NULL  ,
   LOGIN VARCHAR(100) NOT NULL  ,
   MDP VARCHAR(100) NOT NULL  ,
   NOM VARCHAR(100) NOT NULL  ,
   PRENOM VARCHAR(100) NOT NULL  ,
   MAIL VARCHAR(100) NOT NULL  
   , PRIMARY KEY (ID_PERSONNE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE GESTIONNAIRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_GESTIONNAIRE_SUCCURSALE
     ON GESTIONNAIRE (ID_SUCCURSALE ASC);

# -----------------------------------------------------------------------------
#       TABLE : SALLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SALLE
 (
   ID_SALLE INTEGER(2) NOT NULL  AUTO_INCREMENT,
   ID_SUCCURSALE INTEGER(2) NOT NULL  ,
   NUMERO INTEGER(2) NOT NULL  ,
   CAPACITE INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_SALLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE SALLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_SALLE_SUCCURSALE
     ON SALLE (ID_SUCCURSALE ASC);

# -----------------------------------------------------------------------------
#       TABLE : THEME
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS THEME
 (
   ID_THEME INTEGER(2) NOT NULL  AUTO_INCREMENT,
   LIBELLE VARCHAR(150) NOT NULL  ,
   CODE VARCHAR(10) NOT NULL  
   , PRIMARY KEY (ID_THEME) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : FORMATION_SALLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FORMATION_SALLE
 (
   ID_SALLE INTEGER(2) NOT NULL  AUTO_INCREMENT,
   ID_FORMATION INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_SALLE,ID_FORMATION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE FORMATION_SALLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_FORMATION_SALLE_SALLE
     ON FORMATION_SALLE (ID_SALLE ASC);

CREATE  INDEX I_FK_FORMATION_SALLE_FORMATION
     ON FORMATION_SALLE (ID_FORMATION ASC);

# -----------------------------------------------------------------------------
#       TABLE : FORMATION_THEME
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FORMATION_THEME
 (
   ID_SOUS_THEME INTEGER(2) NOT NULL  ,
   ID_FORMATION INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_SOUS_THEME,ID_FORMATION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE FORMATION_THEME
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_FORMATION_THEME_SOUS_THEME
     ON FORMATION_THEME (ID_SOUS_THEME ASC);

CREATE  INDEX I_FK_FORMATION_THEME_FORMATION
     ON FORMATION_THEME (ID_FORMATION ASC);

# -----------------------------------------------------------------------------
#       TABLE : PRESENCE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PRESENCE
 (
   ID_PERSONNE INTEGER(2) NOT NULL  ,
   ID_FORMATION INTEGER(2) NOT NULL  ,
   DATE_HEURE DATETIME NOT NULL  ,
   DUREE TIME NOT NULL  
   , PRIMARY KEY (ID_PERSONNE,ID_FORMATION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PRESENCE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PRESENCE_APPRENANT
     ON PRESENCE (ID_PERSONNE ASC);

CREATE  INDEX I_FK_PRESENCE_FORMATION
     ON PRESENCE (ID_FORMATION ASC);

# -----------------------------------------------------------------------------
#       TABLE : FORMATEUR_THEME
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FORMATEUR_THEME
 (
   ID_SOUS_THEME INTEGER(2) NOT NULL  ,
   ID_PERSONNE INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_SOUS_THEME,ID_PERSONNE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE FORMATEUR_THEME
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_FORMATEUR_THEME_SOUS_THEME
     ON FORMATEUR_THEME (ID_SOUS_THEME ASC);

CREATE  INDEX I_FK_FORMATEUR_THEME_FORMATEUR
     ON FORMATEUR_THEME (ID_PERSONNE ASC);

# -----------------------------------------------------------------------------
#       TABLE : SALLE_THEME
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SALLE_THEME
 (
   ID_SALLE INTEGER(2) NOT NULL  ,
   ID_SOUS_THEME INTEGER(2) NOT NULL  
   , PRIMARY KEY (ID_SALLE,ID_SOUS_THEME) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE SALLE_THEME
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_SALLE_THEME_SALLE
     ON SALLE_THEME (ID_SALLE ASC);

CREATE  INDEX I_FK_SALLE_THEME_SOUS_THEME
     ON SALLE_THEME (ID_SOUS_THEME ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE APPRENANT 
  ADD FOREIGN KEY FK_APPRENANT_CLIENT (ID_CLIENT)
      REFERENCES CLIENT (ID_CLIENT) ;


ALTER TABLE APPRENANT 
  ADD FOREIGN KEY FK_APPRENANT_PERSONNE (ID_PERSONNE)
      REFERENCES PERSONNE (ID_PERSONNE) ;


ALTER TABLE FORMATEUR 
  ADD FOREIGN KEY FK_FORMATEUR_PERSONNE (ID_PERSONNE)
      REFERENCES PERSONNE (ID_PERSONNE) ;


ALTER TABLE SOUS_THEME 
  ADD FOREIGN KEY FK_SOUS_THEME_THEME (ID_THEME)
      REFERENCES THEME (ID_THEME) ;


ALTER TABLE FORMATION 
  ADD FOREIGN KEY FK_FORMATION_FORMATEUR (ID_PERSONNE)
      REFERENCES FORMATEUR (ID_PERSONNE) ;


ALTER TABLE GESTIONNAIRE 
  ADD FOREIGN KEY FK_GESTIONNAIRE_SUCCURSALE (ID_SUCCURSALE)
      REFERENCES SUCCURSALE (ID_SUCCURSALE) ;


ALTER TABLE GESTIONNAIRE 
  ADD FOREIGN KEY FK_GESTIONNAIRE_FORMATEUR (ID_PERSONNE)
      REFERENCES FORMATEUR (ID_PERSONNE) ;


ALTER TABLE SALLE 
  ADD FOREIGN KEY FK_SALLE_SUCCURSALE (ID_SUCCURSALE)
      REFERENCES SUCCURSALE (ID_SUCCURSALE) ;


ALTER TABLE FORMATION_SALLE 
  ADD FOREIGN KEY FK_FORMATION_SALLE_SALLE (ID_SALLE)
      REFERENCES SALLE (ID_SALLE) ;


ALTER TABLE FORMATION_SALLE 
  ADD FOREIGN KEY FK_FORMATION_SALLE_FORMATION (ID_FORMATION)
      REFERENCES FORMATION (ID_FORMATION) ;


ALTER TABLE FORMATION_THEME 
  ADD FOREIGN KEY FK_FORMATION_THEME_SOUS_THEME (ID_SOUS_THEME)
      REFERENCES SOUS_THEME (ID_SOUS_THEME) ;


ALTER TABLE FORMATION_THEME 
  ADD FOREIGN KEY FK_FORMATION_THEME_FORMATION (ID_FORMATION)
      REFERENCES FORMATION (ID_FORMATION) ;


ALTER TABLE PRESENCE 
  ADD FOREIGN KEY FK_PRESENCE_APPRENANT (ID_PERSONNE)
      REFERENCES APPRENANT (ID_PERSONNE) ;


ALTER TABLE PRESENCE 
  ADD FOREIGN KEY FK_PRESENCE_FORMATION (ID_FORMATION)
      REFERENCES FORMATION (ID_FORMATION) ;


ALTER TABLE FORMATEUR_THEME 
  ADD FOREIGN KEY FK_FORMATEUR_THEME_SOUS_THEME (ID_SOUS_THEME)
      REFERENCES SOUS_THEME (ID_SOUS_THEME) ;


ALTER TABLE FORMATEUR_THEME 
  ADD FOREIGN KEY FK_FORMATEUR_THEME_FORMATEUR (ID_PERSONNE)
      REFERENCES FORMATEUR (ID_PERSONNE) ;


ALTER TABLE SALLE_THEME 
  ADD FOREIGN KEY FK_SALLE_THEME_SALLE (ID_SALLE)
      REFERENCES SALLE (ID_SALLE) ;


ALTER TABLE SALLE_THEME 
  ADD FOREIGN KEY FK_SALLE_THEME_SOUS_THEME (ID_SOUS_THEME)
      REFERENCES SOUS_THEME (ID_SOUS_THEME) ;

