###########################
###########################
###########################
####                   ####
#### ANNUAL SPORTS     ####
####   DATABASE        ####
####                   ####
###########################
###########################
###########################

#############################
###                       ###
###  DATABASE SPORTS      ###
###                       ###
#############################
SELECT "DATABASE SPORTS";
DROP DATABASE IF EXISTS SPORTS;
CREATE DATABASE SPORTS;
USE SPORTS;

#############################
###                       ###
###     TABLE EVENT       ###
###                       ###
#############################
SELECT "TABLE Event";
DROP TABLE IF EXISTS Event;
CREATE TABLE Event(
	Event_id				INT(6)				NOT NULL AUTO_INCREMENT,
	Event_name			     VARCHAR(100)		            NOT NULL,
	PRIMARY KEY(Event_id)
);
INSERT INTO Event(Event_name ) VALUES
	("High Jump"),
	("Long jump");

#############################
###                       ###
###     TABLE Attempt     ###
###                       ###
#############################
SELECT "TABLE Attempt ";
DROP TABLE IF EXISTS Attempt ;
CREATE TABLE Attempt (
	Attempt_id				INT(6)				NOT NULL AUTO_INCREMENT,
	Attempt_Possition			VARCHAR(100)		NOT NULL UNIQUE,
	del					ENUM("*")			DEFAULT NULL,
	PRIMARY KEY(Attempt_id)
);
INSERT INTO Attempt (Attempt_possition) VALUES
	("First Attempt"),
	("Second Attempt"),
	("Third Attempt");
	
##################################
###                            ###
###     TABLE Participent      ###
###                            ###
##################################
SELECT "TABLE Participent";
DROP TABLE IF EXISTS Participent;
CREATE TABLE Participent(
	Participent_id				INT(6)				NOT NULL AUTO_INCREMENT,
	Participent_name			VARCHAR(100)		       NOT NULL,
	PRIMARY KEY(Participent_id)
);
INSERT INTO Participent	(Participent_name) VALUES

	("M Barik"),
	("p Mishra"),
	("Priyabrata dash"),
	("Rakesh sahoo"),
      ("Gopal  Panigrahi");
##################################
###                            ###
###     TABLE Result           ###
###                            ###
##################################
SELECT "TABLE Result";
DROP TABLE IF EXISTS Result;
CREATE TABLE result(
result_id               INT(6)            NOT NULL AUTO_INCREMENT,
event_id                INT(6)            NOT NULL REFERENCES event(event_id),
attempt_id              INT(6)            NOT NULL REFERENCES attempt(attempt_id),
participant_id          INT(6)            NOT NULL REFERENCES participantt(participantt_id),
result                  DOUBLE(6,2)       NOT NULL,
PRIMARY KEY(result_id)
);
INSERT INTO result(event_id,attempt_id,participant_id,result)VALUE
                   (1,     1,       1,           6.9),
                   (1,     1,       2,           6.5),
                   (1,     1,       3,           6.2),
                   (1,     1,       4,           5.9),
                   (1,     1,       5,           5.5),
                   (1,     2,       1,           7.5),
                   (1,     2,       2,           6.9),
                   (1,     2,       3,           7.3),
                   (1,     2,       4,           7.1),
                   (1,     2,       5,           6.7),
                   (1,     3,       1,           7.3),
                   (1,     3,       2,           7.1),
                   (1,     3,       3,           6.5),
                   (1,     3,       4,           6.7),
                   (1,     3,       5,           6.5),
                   (2,     1,       1,           7.9),
                   (2,     1,       2,           6.5),
                   (2,     1,       3,           6.2),
                   (2,     1,       4,           5.9),
                   (2,     1,       5,           5.5),
                   (2,     2,       1,           8.1),
                   (2,     2,       2,           7.1),
                   (2,     2,       3,           7.2),
                   (2,     2,       4,           7.5),
                   (2,     2,       5,           6.9),
                   (2,     3,       1,           8.5),
                   (2,     3,       2,           7.9),
                   (2,     3,       3,           7.8),
                   (2,     3,       4,           6.9),
                   (2,     3,       5,           7.5);
