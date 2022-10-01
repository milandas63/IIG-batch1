


###########################
###########################
###########################
####                   ####
#### SPORTSACCADEMY    ####
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

##################################
###                            ###
###     TABLE Attempt          ###
###                            ###
##################################

SELECT "TABLE Attempt";
DROP TABLE IF EXISTS Attempt;
CREATE TABLE attempt(
	         attempt_id                  INT(6)              NOT NULL AUTO_INCREMENT,
	         attempt_position            VARCHAR(100)        NOT NULL  UNIQUE,
	        PRIMARY KEY(attempt_id)
);
INSERT INTO attempt(attempt_position) VALUES
("First attempt"),
("Second attempt"),
("final attempt");


##################################
###                            ###
###     TABLE Event            ###
###                            ###
##################################

SELECT "TABLE Event";
DROP TABLE IF EXISTS event;
CREATE TABLE event(
	event_id                  INT(6)              NOT NULL AUTO_INCREMENT,
	event_name                VARCHAR(100)        NOT NULL,
	
	PRIMARY KEY(event_id)
);
INSERT INTO event(event_name) VALUES
("long jump"),
("high jump");



##################################
###                            ###
###     TABLE Participent      ###
###                            ###
##################################

SELECT "TABLE Participent";
DROP TABLE IF EXISTS Participent;
CREATE TABLE participent(
	participent_id                  INT(6)              NOT NULL AUTO_INCREMENT,
	participent_name                VARCHAR(100)        NOT NULL,
	
	
	PRIMARY KEY(participent_id)
);
INSERT INTO participent(participent_name) VALUES
("Mike powell"),
("Galina Chistyakova"),
("Tejaswini shankar"),
("Hari sankar Roy"),
("Nishad kumar");

##################################
###                            ###
###     TABLE Result           ###
###                            ###
##################################

SELECT "TABLE Result";
DROP TABLE IF EXISTS Result;
CREATE TABLE result(
	result_id                  INT(6)              NOT NULL            AUTO_INCREMENT,
	attempt_id                 INT(6)              NOT NULL References attempt(attempt_id),
	event_id                   INT(6)              NOT NULL References event(event_id),
	participent_id             INT(6)              NOT NULL References participent(participent_id),
	result                     DOUBLE(6,2)         NOT NULL,
	
	PRIMARY KEY(result_id)
);
INSERT INTO result(attempt_id,event_id,participent_id,result) VALUES
                   (1,     1,       1,           8.6),
                   (2,     1,       2,           5.4),
                   (3,     1,       3,           8.4),
                   (2,     2,       4,           2.9),
                   (3,     2,       5,           6.7),
                   (1,     2,       1,           5.4),
                   (3,     1,       2,           7.2),
                   (1,     2,       3,           3.5),
                   (2,     1,       4,           4.6),
                   (3,     1,       5,           6.3),
                   (2,     1,       1,           5.4),
                   (1,     2,       2,           4.8),
                   (2,     2,       3,           2.4),
                   (3,     1,       4,           1.8),
                   (1,     2,       5,           5.4),
                   (2,     1,       1,           4.8),
                   (3,     1,       2,           9.6),
                   (1,     1,       3,           6.4),
                   (2,     2,       4,           7.4),
                   (3,     1,       5,           2.4),
                   (2,     2,       1,           7.6),
                   (1,     1,       2,           5.8),
                   (2,     2,       3,           4.4),
                   (3,     2,       4,           9.7),
                   (2,     2,       5,           6.8),
                   (1,     1,       1,           5.9),
                   (2,     2,       2,           5.3),
                   (3,     1,       3,           6.9),
                   (2,     1,       4,           7.6),
                   (1,     2,       5,           8.8);