#########################################
#########################################
#########################################
#######                           #######
#######     ANUALL SPORTS         #######
#######       DATABASE            #######
#######                           #######
#######                           #######
#########################################
#########################################
#########################################


#############################
###                       ###
###   DATABASE SPORTS     ###
###                       ###
#############################
SELECT "DATABASE sports";
DROP DATABASE IF EXISTS sports;
CREATE DATABASE sports;
USE sports;


#############################
###                       ###
###     TABLE EVENT       ###
###                       ###
#############################
SELECT "TABLE event";
DROP TABLE IF EXISTS enevt;
CREATE TABLE event(
	event_id		        INT(6)				NOT NULL AUTO_INCREMENT,
	event_name			VARCHAR(100)		        NOT NULL ,
	event_timing                    VARCHAR(100)                    NOT NULL,
	PRIMARY KEY(event_id)
);
INSERT INTO event(event_name) VALUES
	("Lung jump"),
	("High jump");

################################
###                          ###
###     TABLE attempt        ###
###                          ###
################################
SELECT "TABLE attempt";
DROP TABLE IF EXISTS attempt;
CREATE TABLE attempt(
	attempt_id			        INT(3)				NOT NULL AUTO_INCREMENT,
	attempt_possition			VARCHAR(100)		        NOT NULL,
	PRIMARY KEY(attempt_id)
);
INSERT INTO attempt(attempt_possition) VALUES
	("First Attempt"),
	("Second Attemp"),
	("Third Attemp");


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
	("Sandip sandha"),
	("Sikun panigrahi"),
        ("Rakesh chhotray"),
        ("Ashutosh Khuntia"),
        ("Gopal Dada");

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
                   (1,     1,       1,           7.6),
                   (1,     1,       2,           4.4),
                   (1,     1,       3,           8.9),
                   (1,     1,       4,           1.9),
                   (1,     1,       5,           8.0),
                   (1,     2,       1,           5.4),
                   (1,     2,       2,           9.7),
                   (1,     2,       3,           5.9),
                   (1,     2,       4,           6.6),
                   (1,     2,       5,           8.7),
                   (1,     3,       1,           8.4),
                   (1,     3,       2,           4.8),
                   (1,     3,       3,           7.4),
                   (1,     3,       4,           8.8),
                   (1,     3,       5,           4.4),
                   (2,     1,       1,           8.8),
                   (2,     1,       2,           9.6),
                   (2,     1,       3,           6.4),
                   (2,     1,       4,           8.7),
                   (2,     1,       5,           5.4),
                   (2,     2,       1,           7.6),
                   (2,     2,       2,           7.8),
                   (2,     2,       3,           9.4),
                   (2,     2,       4,           9.7),
                   (2,     2,       5,           7.8),
                   (2,     3,       1,           8.4),
                   (2,     3,       2,           6.6),
                   (2,     3,       3,           8.5),
                   (2,     3,       4,           9.6),
                   (2,     3,       5,           9.9);