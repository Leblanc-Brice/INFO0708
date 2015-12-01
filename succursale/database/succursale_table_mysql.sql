drop database if exists succursale;

create database if not exists succursale;
use succursale;
# -----------------------------------------------------------------------------
#       table : personne
# -----------------------------------------------------------------------------

create table if not exists personne
 (
   id_personne integer(5) not null  ,
   nom char(100) not null  ,
   prenom char(50) not null  ,
   mail char(50) not null  ,
   adresse char(150) not null  
   , primary key (id_personne) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : formation
# -----------------------------------------------------------------------------

create table if not exists formation
 (
   id_formation integer(5) not null  ,
   id_personne integer(5) not null  ,
   date_heure datetime not null  
   , primary key (id_formation) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table formation
# -----------------------------------------------------------------------------


create  index i_fk_formation_gestionnaire
     on formation (id_personne asc);

# -----------------------------------------------------------------------------
#       table : succursale
# -----------------------------------------------------------------------------

create table if not exists succursale
 (
   id_succursale integer(5) not null  ,
   adresse char(150) not null  ,
   telephone char(12) not null  ,
   mail char(50) not null  
   , primary key (id_succursale) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : gestionnaire
# -----------------------------------------------------------------------------

create table if not exists gestionnaire
 (
   id_personne integer(5) not null  ,
   id_succursale integer(5) not null  ,
   login char(32) not null  ,
   mdp char(32) not null  ,
   nom char(100) not null  ,
   prenom char(50) not null  ,
   mail char(50) not null  ,
   adresse char(150) not null  
   , primary key (id_personne) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table gestionnaire
# -----------------------------------------------------------------------------


create  index i_fk_gestionnaire_succursale
     on gestionnaire (id_succursale asc);

# -----------------------------------------------------------------------------
#       table : salles_formation
# -----------------------------------------------------------------------------

create table if not exists salles_formation
 (
   id_succursale integer(5) not null  ,
   id_formation integer(5) not null  
   , primary key (id_succursale,id_formation) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       index de la table salles_formation
# -----------------------------------------------------------------------------


create  index i_fk_salles_formation_succursale
     on salles_formation (id_succursale asc);

create  index i_fk_salles_formation_formation
     on salles_formation (id_formation asc);


# -----------------------------------------------------------------------------
#       creation des references de table
# -----------------------------------------------------------------------------


alter table formation 
  add foreign key fk_formation_gestionnaire (id_personne)
      references gestionnaire (id_personne) ;


alter table gestionnaire 
  add foreign key fk_gestionnaire_succursale (id_succursale)
      references succursale (id_succursale) ;


alter table gestionnaire 
  add foreign key fk_gestionnaire_personne (id_personne)
      references personne (id_personne) ;


alter table salles_formation 
  add foreign key fk_salles_formation_succursale (id_succursale)
      references succursale (id_succursale) ;


alter table salles_formation 
  add foreign key fk_salles_formation_formation (id_formation)
      references formation (id_formation) ;


