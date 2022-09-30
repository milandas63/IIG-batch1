
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

##################################
###                            ###
###         Table  Level       ###
###                            ###
##################################
SELECT "Table Level";
DROP TABLE IF EXISTS Level;
CREATE TABLE Level(
	Level_id				INT(6)				NOT NULL AUTO_INCREMENT,
	Level_name			VARCHAR(100)		       NOT NULL,
	Level_desc			VARCHAR(200)	        	DEFAULT NULL,
	Level_abbr			VARCHAR(20)			DEFAULT NULL,
	del			       ENUM("*")			DEFAULT NULL,
	PRIMARY KEY(Level_id)
);
INSERT INTO Level(Level_name, Level_desc, Level_abbr) VALUES
	("Easy", "Here Easy Level question", "Easy"),
	("Meddium", "Here Meddium Level question", "Meddium"),
        ("Difficult", "Here Difficult Level Question", "Difficult"),
        ("Very_Difficult", "Here Very Difficult Level Question", "Very Difficult");

##################################
###                            ###
###         Table  Duration    ###
###                            ###
##################################
SELECT "Table Duration";
DROP TABLE IF EXISTS Duration;
CREATE TABLE Duration(
	Duration_id				INT(6)				NOT NULL AUTO_INCREMENT,
	Duration_name			VARCHAR(100)		        NOT NULL,
	Duration_desc			VARCHAR(200)		        DEFAULT NULL,
	Duration_abbr			VARCHAR(20)			DEFAULT NULL,
	del			       ENUM("*")	                DEFAULT NULL,
	PRIMARY KEY(Duration_id)
);
INSERT INTO Duration(Duration_name, Duration_desc, Duration_abbr) VALUES
	("30 Min", "half an Hour", "1/2"),
	("1 Hour", "One Hour", "1"),
        ("1:30 hour", "One and half an hour", " 1 & 1/2"),
        ("2 Hour", "Two Hour", "2");
  

##################################
###                            ###
###         Table  Answre      ###
###                            ###
##################################
SELECT "Table Answre";
DROP TABLE IF EXISTS Answre;
CREATE TABLE Answre(
	 Answre _id				INT(6)				NOT NULL AUTO_INCREMENT,
	 Answre _name			VARCHAR(100)		        NOT NULL,
	 Answre _desc			VARCHAR(200)		        DEFAULT NULL,
	 Answre _abbr			VARCHAR(20)			        DEFAULT NULL,
	   del			       ENUM("*")	                    DEFAULT NULL,
	PRIMARY KEY(Answre_id)
);
INSERT INTO Answre( Answre _name,  Answre _desc,  Answre _abbr) VALUES
	("Qno", "Question No", "null"),
	("Q_type_id", "Question type id", "null");
      


##################################
###                            ###
###         Table MCQ          ###
###                            ###
##################################
SELECT "Table MCQ";
DROP TABLE IF EXISTS MCQ;
CREATE TABLE MCQ(
	MCQ _id				INT(6)				NOT NULL AUTO_INCREMENT,
	MCQ _name			VARCHAR(100)		        NOT NULL,
	MCQ _desc			VARCHAR(200)		        DEFAULT NULL,
	MCQ _abbr			VARCHAR(20)			DEFAULT NULL,
	del			       ENUM("*")	                DEFAULT NULL,
	PRIMARY KEY(MCQ _id)
);
INSERT INTO MCQ(MCQ _name, MCQ _desc,MCQ_abbr) VALUES
	("QNO", "Chose your question NO", "null"),
	("Ans_option", "chose your ans option", null),
        ("Correct(y/n)", "Give your ans only Yes or No", null);


##################################
###                            ###
###         Table Generate     ###
###                            ###
##################################
SELECT "Table Generate";
DROP TABLE IF EXISTS Generate;
CREATE TABLE Generate(
	Generate _id				INT(6)			NOT NULL AUTO_INCREMENT,
	Generate _name			VARCHAR(100)		        NOT NULL,
	Generate _desc			VARCHAR(200)		        DEFAULT NULL,
	Generate _abbr			VARCHAR(20)			        DEFAULT NULL,
	del			            ENUM("*")	                          DEFAULT NULL,
	PRIMARY KEY(Generate _id)
);
INSERT INTO Generate(Generate _name, Generate _desc, Generate _abbr)
VALUES("No", "No of Question", "Q"),
        ("No_of_Question", "No of Question", null);


##################################
###                            ###
###         Table Test_mod     ###
###                            ###
##################################
SELECT "Table Test_mode";
DROP TABLE IF EXISTS Test_mode;
CREATE TABLE Test_mode(
	Test_id				INT(6)				NOT NULL AUTO_INCREMENT,
	Test_name			VARCHAR(100)		        NOT NULL,
	Test_desc			VARCHAR(200)		        DEFAULT NULL,
	Test_abbr			VARCHAR(20)			DEFAULT NULL,
	del			       ENUM("*")	                DEFAULT NULL,
	PRIMARY KEY(Test_id)
);
INSERT INTO Test_mode(Test_name, Test_desc, Test_abbr) VALUES
	("No", "No of Question", "Q"),
        ("No_of_Question", "No of Question", null);

##################################
###                            ###
###         Table Grade        ###
###                            ###
##################################
SELECT "Table Grade";
DROP TABLE IF EXISTS Gread;
CREATE TABLE  Gread(
	 Gread_id				INT(6)				NOT NULL AUTO_INCREMENT,
	 Gread_name			VARCHAR(100)		        NOT NULL,
	 Gread_desc			VARCHAR(200)		        DEFAULT NULL,
	 Gread_abbr			VARCHAR(20)			DEFAULT NULL,
	del			       ENUM("*")	                DEFAULT NULL,
	PRIMARY KEY( Gread_id)
);
INSERT INTO  Gread( Gread_name,  Gread_desc,  Gread_abbr)
VALUES("Poor", "very bad performances", "poor"),
        ("Fair", "Average performance", "Fair"),
         ("Good","Good performance","Good"),
         ("Excellent","Very good performance","Excellent");


##################################
###                            ###
###      Table Test_mod_As     ###
###                            ###
##################################
SELECT "Table Test_mod_As";
DROP TABLE IF EXISTS Test_mod_As;
CREATE TABLE Test_Mod_As(
	type_id				INT(6)				NOT NULL AUTO_INCREMENT,
	type_name			VARCHAR(100)		        NOT NULL,
	type_desc			VARCHAR(200)		        DEFAULT NULL,
	type_abbr			VARCHAR(20)			DEFAULT NULL,
	del			       ENUM("*")	                DEFAULT NULL,
	PRIMARY KEY(type_id)
);
INSERT INTO Test_Mod_As(type_name, type_desc, type_abbr) VALUES
	("No", "No of Question", "Q"),
        ("No_of_Question", "No of Question", null);


###################################
###                             ###
###      TABLE QUESTION         ###
###                             ###
###################################
SELECT "Table Question";
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	question_id                   INT(8)                 NOT NULL AUTO_INCREMENT,
	question_text                 VARCHAR(250)           NOT NULL,
	subject_id                    INT(6)                 NOT NULL REFERENCES subject(subject_id),
      question_type_id              INT(6)                 NOT NULL REFERENCES question_type(question_id),
	policy_id                     INT(6)                 NOT NULL REFERENCES policy(policy_id),
	grade_id                      INT(6)                 NOT NULL REFERENCES grade(grade_id),
	level_id                      INT(6)                 NOT NULL REFERENCES level(level_id),
	PRIMARY KEY(question_id)
);
INSERT INTO question(question_text,subject_id,question_type_id,policy_id,grade_id,level_id)
 VALUES("Who Invented Java", "1", "1","2","2","1"),
	("Who Invented Python", "2", "1","2","2","1"),
        ("Who Invented css", "3", "1","2","2","1");