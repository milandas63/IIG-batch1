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

    sub_id              INT(6)              NOT NULL AUTO_INCREMENT,
   sub_name         VARCHAR(100)                NOT NULL UNIQUE,
   sub_full         VARCHAR(200)                DEFAULT NULL UNIQUE,
   sub_abbr         VARCHAR(20)         DEFAULT NULL UNIQUE,
    del             ENUM("*")           DEFAULT NULL,
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

    policy_id           INT(6)              NOT NULL AUTO_INCREMENT,
    policy_name         VARCHAR(100)        NOT NULL,
    policy_desc         VARCHAR(200)        DEFAULT NULL,
   policy_abbr          VARCHAR(20)         DEFAULT NULL,
     del                ENUM("*")       DEFAULT NULL,
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

    type_id             INT(6)              NOT NULL AUTO_INCREMENT,
    type_name           VARCHAR(100)                NOT NULL,
    type_desc           VARCHAR(200)                DEFAULT NULL,
    type_abbr           VARCHAR(20)         DEFAULT NULL,
    del             ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(type_id)
);

INSERT INTO question_type(type_name, type_desc, type_abbr) VALUES
    ("MCQ", "Multiple Choice Question", "MCQ"),
    ("Fill-in-the-blank", "Enter the value in the blank", null),
    ("True/False", "Enter either True or False", null);

###################################
###                             ###
###        TABLE Duration       ###
###                             ###
###################################

SELECT "TABLE duration";
DROP TABLE IF EXISTS duration;
CREATE TABLE duration(

    duration_id          INT(6)              NOT NULL AUTO_INCREMENT,
   duration_name        VARCHAR(100)         NOT NULL,
   duration_desc        VARCHAR(200)         DEFAULT NULL,
   duration_abbr        VARCHAR(20)          DEFAULT NULL,
    del                 ENUM("*")            DEFAULT NULL,
PRIMARY KEY(Duration_id)
);

INSERT INTO duration(duration_name,  duration_desc, duration_abbr) VALUES
  ("half hour", "30 minutes ", "half hour"),
    ("1 hour", "60 minutes", " 1 hour"),
    ("1.30 hour", "90 minutes", "1.30 hour"),
     ("2 hour","120 minutes", "2 hour");

##################################
###                            ###
###        TABLE Level         ###
###                            ###
##################################

SELECT "TABLE Level";
DROP TABLE IF EXISTS level;
CREATE TABLE level(

    level_id             INT(6)             NOT NULL AUTO_INCREMENT,
    level_name          VARCHAR(100)        NOT NULL,
    level_desc          VARCHAR(200)        DEFAULT NULL,
    level_abbr          VARCHAR(20)         DEFAULT NULL,
    del                 ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(level_id)
);

INSERT INTO level(level_name,  level_desc, level_abbr) VALUES
    ("Easy", "Easy Question", "Easy"),
    ("Medium", "Medium Question", "Medium"),
    ("Difficult", "Difficult Question", "Difficult"),
    ("Very Difficult","Very Difficult Question","Very Difficult");


##################################
###                            ###
###        TABLE Grade         ###
###                            ###
##################################

SELECT "TABLE Grade";
DROP TABLE IF EXISTS grade;
CREATE TABLE grade(

     grade_id                INT(6)             NOT NULL AUTO_INCREMENT,
     grade_name         VARCHAR(100)            NOT NULL,
     grade_desc         VARCHAR(200)            DEFAULT NULL,
     grade_abbr         VARCHAR(20)             DEFAULT NULL,
     del                    ENUM("*")           DEFAULT NULL,
    PRIMARY KEY( grade_id)
);

INSERT INTO  grade( grade_name,   grade_desc,  grade_abbr) VALUES

    ("Poor", "lower mark", "Poor"),
    ("Fair", "just pass mark ", "Fair"),
    ("Good", "good mark", "Good"),
    ("Excellent","higher mark","Excellent");

##################################
###                            ###
###        TABLE MCQ           ###
###                            ###
##################################

SELECT "TABLE MCQ ";
DROP TABLE IF EXISTS MCQ;
CREATE TABLE MCQ(

     MCQ_id              INT(6)             NOT NULL AUTO_INCREMENT,
     MCQ_name           VARCHAR(100)            NOT NULL,
     MCQ_desc           VARCHAR(200)            DEFAULT NULL,
     MCQ_abbr           VARCHAR(20)             DEFAULT NULL,
     del                    ENUM("*")           DEFAULT NULL,
    PRIMARY KEY( MCQ_id)
);

INSERT INTO  MCQ( MCQ_name,   MCQ_desc,  MCQ_abbr) VALUES

    ("Qno", "Question number", "Q-no"),
    ("Ans option", "chose your answer ", "Ans-des"),
    ("correct","chose the correct answer","y/n");

##################################
###                            ###
###        TABLE Answer        ###
###                            ###
##################################

SELECT "TABLE Answer  ";
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(

     Answer_id               INT(6)             NOT NULL AUTO_INCREMENT,
     Answer_name            VARCHAR(100)            NOT NULL,
     Answer_desc            VARCHAR(200)            DEFAULT NULL,
     Answer_abbr            VARCHAR(20)             DEFAULT NULL,
     del                    ENUM("*")           DEFAULT NULL,
    PRIMARY KEY( Answer_id)
);

INSERT INTO  Answer( Answer_name,   Answer_desc,  Answer_abbr) VALUES

    ("Qno", " number of Question  one page", "Qno"),
    ("Q-type-id","Question paper id","Q-id");

##################################
###                            ###
###        TABLE Question      ###
###                            ###
##################################

SELECT "TABLE Question";
DROP TABLE IF EXISTS question;
CREATE TABLE question(
    question_id                   INT(8)                 NOT NULL AUTO_INCREMENT,
    question_text                 VARCHAR(250)           NOT NULL,
    subject_id                    INT(6)                 NOT NULL REFERENCES subject(subject_id),
    qtype_id                      INT(6)                 NOT NULL REFERENCES question_type(type_id),
    policy_id                     INT(6)                 NOT NULL REFERENCES policy(policy_id),
    grade_id                      INT(6)                 NOT NULL REFERENCES grade(grade_id),
    level_id                      INT(6)                 NOT NULL REFERENCES level(level_id),
    PRIMARY KEY(question_id)
);
INSERT INTO question(question_text, subject_id, qtype_id, policy_id, grade_id, level_id) VALUES
("who creat JAVA?",     1,1,2,2,1),
("how JAVA creat?",     1,1,2,2,1),
("when JAVA creat?",    1,1,2,2,1),
("when JAVA created?",  1,1,2,2,1),
("why JAVA created?",   1,1,2,2,1);

