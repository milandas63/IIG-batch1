#########################################
#########################################
#########################################
#######                           #######
#######     TEST-ASSESSMENT       #######
#######         DATABASE          #######
#######                           #######
#######                           #######
#########################################
#########################################
#########################################


#############################
###                       ###
###  DATABASE assessment  ###
###                       ###
#############################
SELECT "DATABASE assessment";
DROP DATABASE IF EXISTS assessment;
CREATE DATABASE assessment;
USE assessment;


#############################
###                       ###
###     TABLE subjects    ###
###                       ###
#############################
SELECT "TABLE subjects";
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects(
	sub_id				INT(6)				NOT NULL AUTO_INCREMENT,
	sub_name			VARCHAR(100)		NOT NULL UNIQUE,
	sub_full			VARCHAR(200)		DEFAULT NULL UNIQUE,
	sub_abbr			VARCHAR(20)			DEFAULT NULL UNIQUE,
	del					ENUM("*")			DEFAULT NULL,
	PRIMARY KEY(sub_id)
);
INSERT INTO subjects(sub_name, sub_full, sub_abbr) VALUES
	("HTML5", "Hyper Text Markup Language", "HTML"),
	("CSS3", "Cascading Style Sheet", "CSS"),
	("Core Java", "Java 2 Standard Edition", "Java"),
	("Advanced Java", "Java 2 Enterprise Edition", "AdvJava");


################################
###                          ###
###     TABLE mark_policy    ###
###                          ###
################################
SELECT "TABLE mark_policy";
DROP TABLE IF EXISTS mark_policy;
CREATE TABLE mark_policy(
	policy_id			INT(6)				NOT NULL AUTO_INCREMENT,
	policy_name			VARCHAR(100)		NOT NULL,
	policy_desc			VARCHAR(200)		DEFAULT NULL,
	policy_abbr			VARCHAR(20)			DEFAULT NULL,
	del					ENUM("*")			DEFAULT NULL,
	PRIMARY KEY(policy_id)
);
INSERT INTO mark_policy(policy_name, policy_desc, policy_abbr) VALUES
	("Negative","Minus marking", null),
	("Full Mark","Mark alloted to the question", null),
	("Bonus Mark", "Extra mark if the answer is correct", null);


##################################
###                            ###
###     TABLE Question_type    ###
###                            ###
##################################
SELECT "TABLE question_type";
DROP TABLE IF EXISTS question_type;
CREATE TABLE question_type(
	type_id				INT(6)				NOT NULL AUTO_INCREMENT,
	type_name			VARCHAR(100)		NOT NULL,
	type_desc			VARCHAR(200)		DEFAULT NULL,
	type_abbr			VARCHAR(20)			DEFAULT NULL,
	del					ENUM("*")			DEFAULT NULL,
	PRIMARY KEY(type_id)
);
INSERT INTO question_type(type_name, type_desc, type_abbr) VALUES
	("MCQ", "Multiple Choice Question", "MCQ"),
	("Fill-in-the-blank", "Enter the value in the blank", null),
	("True/False", "Enter either True or False", null);
