BEGIN TRANSACTION;

create table personne
(
	id_personne int not null,
	nom varchar(100) not null,
	prenom varchar(50) not null,
	mail varchar(50) not null,
	adresse varchar(150) not null,
	constraint pk_personne primary key (id_personne)
);

-- -----------------------------------------------------------------------------
--	table : formation
-- -----------------------------------------------------------------------------

create table formation
(
	id_formation int not null,
	id_personne int not null,
	date_heure timestamp not null,
	constraint pk_formation primary key (id_formation)
);

-- -----------------------------------------------------------------------------
--	index de la table formation
-- -----------------------------------------------------------------------------

create  index i_fk_formation_gestionnaire
	 on formation (id_personne)
	;

-- -----------------------------------------------------------------------------
--	table : succursale
-- -----------------------------------------------------------------------------

create table succursale
(
	id_succursale int not null,
	adresse varchar(150) not null,
	telephone varchar(12) not null,
	mail varchar(50) not null,
	constraint pk_succursale primary key (id_succursale)
);

-- -----------------------------------------------------------------------------
--	table : gestionnaire
-- -----------------------------------------------------------------------------

create table gestionnaire
(
	id_personne int not null,
	id_succursale int not null,
	login varchar(32) not null,
	mdp varchar(32) not null,
	nom varchar(100) not null,
	prenom varchar(50) not null,
	mail varchar(50) not null,
	adresse varchar(150) not null,
	constraint pk_gestionnaire primary key (id_personne)
);

-- -----------------------------------------------------------------------------
--	index de la table gestionnaire
-- -----------------------------------------------------------------------------

create  index i_fk_gestionnaire_succursale
	 on gestionnaire (id_succursale)
	;

-- -----------------------------------------------------------------------------
--	table : salles_formation
-- -----------------------------------------------------------------------------

create table salles_formation
(
	id_succursale int not null,
	id_formation int not null,
	constraint pk_salles_formation primary key (id_succursale, id_formation)
);

-- -----------------------------------------------------------------------------
--	index de la table salles_formation
-- -----------------------------------------------------------------------------

create  index i_fk_salles_formation_succursa
	 on salles_formation (id_succursale)
	;

create  index i_fk_salles_formation_formatio
	 on salles_formation (id_formation)
	;


-- -----------------------------------------------------------------------------
--	creation des references de table
-- -----------------------------------------------------------------------------


alter table formation add 
	 constraint fk_formation_gestionnaire
		  foreign key (id_personne)
			references gestionnaire (id_personne);

alter table gestionnaire add 
	 constraint fk_gestionnaire_succursale
		  foreign key (id_succursale)
			references succursale (id_succursale);

alter table gestionnaire add 
	 constraint fk_gestionnaire_personne
		  foreign key (id_personne)
			references personne (id_personne);

alter table salles_formation add 
	 constraint fk_salles_formation_succursale
		  foreign key (id_succursale)
			references succursale (id_succursale);

alter table salles_formation add 
	 constraint fk_salles_formation_formation
		  foreign key (id_formation)
			references formation (id_formation);


-- -----------------------------------------------------------------------------
--				FIN DE GENERATION
-- -----------------------------------------------------------------------------
COMMIT;