BEGIN TRANSACTION;
insert into succursale (id_succursale, adresse, telephone, mail) values (0, '4 rue du chêne Reims', '030405060708', 'succursale@succursale.fr');
insert into personne (id_personne, nom , prenom, mail, adresse) values (0, 'Paul', 'Pierre', 'paul.pierre@succursale.fr', '8 rue du chêne Reims');
insert into gestionnaire (id_personne, id_succursale, login, mdp, nom, prenom, mail, adresse) values (0, 0, 'pp', 'pp', 'Paul', 'Pierre', 'paul.pierre@succursale.fr', '8 rue du chêne Reims');
insert into formation (id_formation, id_personne, date_heure) values (0, 0, TIMESTAMP '2015-11-30 10:00:00');
insert into salles_formation (id_succursale, id_formation) values (0, 0);
COMMIT;  