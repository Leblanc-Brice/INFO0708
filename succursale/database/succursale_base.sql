drop database succursale;
drop role admin_succursale;
	
create database succursale;
create role admin_succursale password 'succursale' login;

grant all on database succursale to admin_succursale with grant option;