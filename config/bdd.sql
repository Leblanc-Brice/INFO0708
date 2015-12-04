drop database if exists succursale;

create database if not exists succursale;
use succursale;
# -----------------------------------------------------------------------------
#       table : apprenant
# -----------------------------------------------------------------------------

create table if not exists apprenant
 (
   id_personne integer not null  ,
   id_client integer not null  ,
   nom varchar(100) not null  ,
   prenom varchar(100) not null  ,
   mail varchar(100) not null  
   , primary key (id_personne) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table apprenant
# -----------------------------------------------------------------------------


create  index i_fk_apprenant_client
     on apprenant (id_client asc);

# -----------------------------------------------------------------------------
#       table : personne
# -----------------------------------------------------------------------------

create table if not exists personne
 (
   id_personne integer not null  ,
   nom varchar(100) not null  ,
   prenom varchar(100) not null  ,
   mail varchar(100) not null  
   , primary key (id_personne) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : formateur
# -----------------------------------------------------------------------------

create table if not exists formateur
 (
   id_personne integer not null  ,
   login varchar(100) not null  ,
   mdp varchar(100) not null  ,
   nom varchar(100) not null  ,
   prenom varchar(100) not null  ,
   mail varchar(100) not null  
   , primary key (id_personne) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : sous_theme
# -----------------------------------------------------------------------------

create table if not exists sous_theme
 (
   id_sous_theme integer not null  ,
   id_theme integer not null  ,
   libelle varchar(150) not null  ,
   code varchar(10) not null  ,
   description varchar(1000) not null  
   , primary key (id_sous_theme) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table sous_theme
# -----------------------------------------------------------------------------


create  index i_fk_sous_theme_theme
     on sous_theme (id_theme asc);

# -----------------------------------------------------------------------------
#       table : formation
# -----------------------------------------------------------------------------

create table if not exists formation
 (
   id_formation integer not null  ,
   id_personne integer not null  ,
   annulation varchar(1500) null  
   , primary key (id_formation) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table formation
# -----------------------------------------------------------------------------


create  index i_fk_formation_formateur
     on formation (id_personne asc);

# -----------------------------------------------------------------------------
#       table : client
# -----------------------------------------------------------------------------

create table if not exists client
 (
   id_client integer not null  ,
   nom varchar(150) not null  ,
   adresse varchar(150) not null  ,
   telephone varchar(16) not null  ,
   mail varchar(100) not null  
   , primary key (id_client) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : succursale
# -----------------------------------------------------------------------------

create table if not exists succursale
 (
   id_succursale integer not null  ,
   adresse varchar(150) not null  ,
   telephone varchar(16) not null  ,
   mail varchar(100) not null  
   , primary key (id_succursale) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : gestionnaire
# -----------------------------------------------------------------------------

create table if not exists gestionnaire
 (
   id_personne integer not null  ,
   id_succursale integer not null  ,
   login varchar(100) not null  ,
   mdp varchar(100) not null  ,
   nom varchar(100) not null  ,
   prenom varchar(100) not null  ,
   mail varchar(100) not null  
   , primary key (id_personne) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table gestionnaire
# -----------------------------------------------------------------------------


create  index i_fk_gestionnaire_succursale
     on gestionnaire (id_succursale asc);

# -----------------------------------------------------------------------------
#       table : salle
# -----------------------------------------------------------------------------

create table if not exists salle
 (
   id_salle integer not null  ,
   id_succursale integer not null  ,
   numero integer not null  ,
   capacite integer not null  
   , primary key (id_salle) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table salle
# -----------------------------------------------------------------------------


create  index i_fk_salle_succursale
     on salle (id_succursale asc);

# -----------------------------------------------------------------------------
#       table : theme
# -----------------------------------------------------------------------------

create table if not exists theme
 (
   id_theme integer not null  ,
   libelle varchar(150) not null  ,
   code varchar(10) not null  
   , primary key (id_theme) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : formation_salle
# -----------------------------------------------------------------------------

create table if not exists formation_salle
 (
   id_salle integer not null  ,
   id_formation integer not null  
   , primary key (id_salle,id_formation) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table formation_salle
# -----------------------------------------------------------------------------


create  index i_fk_formation_salle_salle
     on formation_salle (id_salle asc);

create  index i_fk_formation_salle_formation
     on formation_salle (id_formation asc);

# -----------------------------------------------------------------------------
#       table : formation_theme
# -----------------------------------------------------------------------------

create table if not exists formation_theme
 (
   id_sous_theme integer not null  ,
   id_formation integer not null  
   , primary key (id_sous_theme,id_formation) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table formation_theme
# -----------------------------------------------------------------------------


create  index i_fk_formation_theme_sous_theme
     on formation_theme (id_sous_theme asc);

create  index i_fk_formation_theme_formation
     on formation_theme (id_formation asc);

# -----------------------------------------------------------------------------
#       table : presence
# -----------------------------------------------------------------------------

create table if not exists presence
 (
   id_personne integer not null  ,
   id_formation integer not null  ,
   date_heure datetime not null  ,
   duree time not null  
   , primary key (id_personne,id_formation) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table presence
# -----------------------------------------------------------------------------


create  index i_fk_presence_apprenant
     on presence (id_personne asc);

create  index i_fk_presence_formation
     on presence (id_formation asc);

# -----------------------------------------------------------------------------
#       table : formateur_theme
# -----------------------------------------------------------------------------

create table if not exists formateur_theme
 (
   id_sous_theme integer not null  ,
   id_personne integer not null  
   , primary key (id_sous_theme,id_personne) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table formateur_theme
# -----------------------------------------------------------------------------


create  index i_fk_formateur_theme_sous_theme
     on formateur_theme (id_sous_theme asc);

create  index i_fk_formateur_theme_formateur
     on formateur_theme (id_personne asc);

# -----------------------------------------------------------------------------
#       table : salle_theme
# -----------------------------------------------------------------------------

create table if not exists salle_theme
 (
   id_salle integer not null  ,
   id_sous_theme integer not null  
   , primary key (id_salle,id_sous_theme) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table salle_theme
# -----------------------------------------------------------------------------


create  index i_fk_salle_theme_salle
     on salle_theme (id_salle asc);

create  index i_fk_salle_theme_sous_theme
     on salle_theme (id_sous_theme asc);


# -----------------------------------------------------------------------------
#       creation des references de table
# -----------------------------------------------------------------------------


alter table apprenant 
  add foreign key fk_apprenant_client (id_client)
      references client (id_client) ;


alter table apprenant 
  add foreign key fk_apprenant_personne (id_personne)
      references personne (id_personne) ;


alter table formateur 
  add foreign key fk_formateur_personne (id_personne)
      references personne (id_personne) ;


alter table sous_theme 
  add foreign key fk_sous_theme_theme (id_theme)
      references theme (id_theme) ;


alter table formation 
  add foreign key fk_formation_formateur (id_personne)
      references formateur (id_personne) ;


alter table gestionnaire 
  add foreign key fk_gestionnaire_succursale (id_succursale)
      references succursale (id_succursale) ;


alter table gestionnaire 
  add foreign key fk_gestionnaire_formateur (id_personne)
      references formateur (id_personne) ;


alter table salle 
  add foreign key fk_salle_succursale (id_succursale)
      references succursale (id_succursale) ;


alter table formation_salle 
  add foreign key fk_formation_salle_salle (id_salle)
      references salle (id_salle) ;


alter table formation_salle 
  add foreign key fk_formation_salle_formation (id_formation)
      references formation (id_formation) ;


alter table formation_theme 
  add foreign key fk_formation_theme_sous_theme (id_sous_theme)
      references sous_theme (id_sous_theme) ;


alter table formation_theme 
  add foreign key fk_formation_theme_formation (id_formation)
      references formation (id_formation) ;


alter table presence 
  add foreign key fk_presence_apprenant (id_personne)
      references apprenant (id_personne) ;


alter table presence 
  add foreign key fk_presence_formation (id_formation)
      references formation (id_formation) ;


alter table formateur_theme 
  add foreign key fk_formateur_theme_sous_theme (id_sous_theme)
      references sous_theme (id_sous_theme) ;


alter table formateur_theme 
  add foreign key fk_formateur_theme_formateur (id_personne)
      references formateur (id_personne) ;


alter table salle_theme 
  add foreign key fk_salle_theme_salle (id_salle)
      references salle (id_salle) ;


alter table salle_theme 
  add foreign key fk_salle_theme_sous_theme (id_sous_theme)
      references sous_theme (id_sous_theme) ;

