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
	
#############################
###                       ###
###    TABLE Participants ###
###                       ###
#############################
SELECT "TABLE Participants";
DROP TABLE IF Participants;
CREATE TABLE Participants(
	Participant_id				INT(6)				NOT NULL AUTO_INCREMENT,
	Participant_name			VARCHAR(100)		NOT NULL UNIQUE,
	PRIMARY KEY(Participant_id)
);
INSERT INTO Participants(Participant_name) VALUES
	("M Barik"),
	("p Mishra"),
	("Priyabrata dash"),
	("Rakesh sahoo"),
      ("Gopal  Panigrahi");

#############################
###                       ###
###     TABLE Result      ###
###                       ###
#############################
SELECT "TABLE Result ";
DROP TABLE IF Result ;
CREATE TABLE Result (
	Result _id				INT(6)		NOT NULL AUTO_INCREMENT,
	Event_id			      INT(6)		DEFAULT NULL UNIQUE,
	Attempt_id		            INT(6)		DEFAULT NULL UNIQUE,
     	Paricipants_id		      INT(6)			DEFAULT NULL UNIQUE,
      Result		            DOUBLE(6,2)		DEFAULT NULL UNIQUE,
	PRIMARY KEY(Resuld_id)
);
INSERT INTO Result(Event_id,Attempt_id,	Paricipants_id,Winner_id) VALUES
	             (1,     1,       1,           7.4),
                   (1,     1,       2,           6.8),
                   (1,     1,       3,           5.2),
                   (1,     1,       4,           7.9),
                   (1,     1,       5,           4.5),
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
