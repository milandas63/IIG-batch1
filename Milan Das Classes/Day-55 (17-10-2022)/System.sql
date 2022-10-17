#########################################
#########################################
#########################################
#######                           #######
#######     TEST-ASSESSMENT       #######
#######         DATABASE          #######
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
    sub_id              INT(6)              NOT NULL AUTO_INCREMENT,
    sub_name            VARCHAR(100)        NOT NULL UNIQUE,
    sub_full            VARCHAR(200)        DEFAULT NULL UNIQUE,
    sub_abbr            VARCHAR(20)         DEFAULT NULL UNIQUE,
    del                 ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(sub_id)
);
INSERT INTO subjects(sub_name, sub_full, sub_abbr) VALUES
    ("HTML5",           "Hyper Text Markup Language",       "HTML"),
    ("CSS3",            "Cascading Style Sheet",            "CSS"),
    ("Core Java",       "Java 2 Standard Edition",          "Java"),
    ("Advanced Java",   "Java 2 Enterprise Edition",        "AdvJava");


##################################
###                            ###
###     TABLE question_type    ###
###                            ###
##################################
SELECT "TABLE question_type";
DROP TABLE IF EXISTS question_type;
CREATE TABLE question_type(
    type_id             INT(6)              NOT NULL AUTO_INCREMENT,
    type_name           VARCHAR(100)        NOT NULL,
    type_desc           VARCHAR(200)        DEFAULT NULL,
    type_abbr           VARCHAR(20)         DEFAULT NULL,
    del                 ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(type_id)
);
INSERT INTO question_type(type_name, type_desc, type_abbr) VALUES
    ("MCQ", "Multiple Choice Question", "MCQ"),
    ("Fill-in-the-blank", "Enter the value in the blank", null),
    ("True/False", "Enter either True or False", null);


################################
###                          ###
###     TABLE mark_policy    ###
###                          ###
################################
SELECT "TABLE mark_policy";
DROP TABLE IF EXISTS mark_policy;
CREATE TABLE mark_policy(
    policy_id                       INT(6)                  NOT NULL AUTO_INCREMENT,
    policy_name                     VARCHAR(100)            NOT NULL,
    policy_desc                     VARCHAR(200)            DEFAULT NULL,
    policy_abbr                     VARCHAR(20)             DEFAULT NULL,
    del                             ENUM("*")               DEFAULT NULL,
    PRIMARY KEY(policy_id)
);
INSERT INTO mark_policy(policy_name, policy_desc, policy_abbr) VALUES
    ("Negative mark",   "Negative marking in case of wrong answer",             "NM"),
    ("Full mark",       "Full mark when the answer is correct",                 "FM"),
    ("Bonus mark",      "Special Additional mark when the answer is correct",   "BM");



##########################
###                    ###
###     TABLE level    ###
###                    ###
##########################
SELECT "TABLE level";
DROP TABLE IF EXISTS level;
CREATE TABLE level(
    level_id                   INT(6)                 NOT NULL AUTO_INCREMENT,
    level_name                 VARCHAR(100)           NOT NULL UNIQUE,
    level_desc                 VARCHAR(200)           DEFAULT NULL UNIQUE,
    level_abbr                 VARCHAR(20)            DEFAULT NULL UNIQUE,
    del                        ENUM("*")              DEFAULT NULL,
    PRIMARY KEY(level_id)
);
INSERT INTO level(level_name, level_desc, level_abbr) VALUES
    ("Easy",            "Easy",                 null),
    ("Medium",          "Medium",               null),
    ("Difficult",       "Difficult",            null),
    ("Very Difficult",  "Very Difficult",       null);


##########################
###                    ###
###     TABLE grade    ###
###                    ###
##########################
SELECT "TABLE grade";
DROP TABLE IF EXISTS grade;
CREATE TABLE grade(
    grade_id                   INT(6)                 NOT NULL AUTO_INCREMENT,
    grade_name                 VARCHAR(100)           NOT NULL UNIQUE,
    grade_desc                 VARCHAR(200)           DEFAULT NULL UNIQUE,
    grade_abbr                 VARCHAR(20)            DEFAULT NULL UNIQUE,
    del                        ENUM("*")              DEFAULT NULL,
    PRIMARY KEY(grade_id)
);
INSERT INTO grade(grade_name, grade_desc, grade_abbr) VALUES
    ("Easy",            "Easy",                 null),
    ("Medium",          "Medium",               null),
    ("Difficult",       "Difficult",            null),
    ("Very Difficult",  "Very Difficult",       null);


#############################
###                       ###
###     TABLE question    ###
###                       ###
#############################
SELECT "TABLE question";
DROP TABLE IF EXISTS questions;
CREATE TABLE questions(
    question_id                   INT(8)                 NOT NULL AUTO_INCREMENT,
    question_text                 VARCHAR(250)           NOT NULL UNIQUE,
    subject_id                    INT(6)                 NOT NULL REFERENCES subject(subject_id),
    question_type_id              INT(6)                 NOT NULL REFERENCES question_type(type_id),
    policy_id                     INT(6)                 NOT NULL REFERENCES policy(policy_id),
    level_id                      INT(6)                 NOT NULL REFERENCES level(level_id),
    PRIMARY KEY(question_id)
);
INSERT INTO questions(question_text,subject_id,question_type_id,policy_id,level_id) VALUES
    ("Who Invented Java?",                                          3, 1, 2, 1),
    ("The first version of Java is called",                         3, 1, 1, 2),
    ("How many primitive data exists in Java",                      3, 1, 2, 2),
    ("What is Tuples in Python",                                    2, 1, 1, 2),
    ("HTML stands for",                                             2, 1, 2, 4),
    ("Which CSS property is used to define the font of text",       3, 1, 3, 1);


#############################
###                       ###
###       SQL Query       ###
###                       ###
#############################
SELECT  q.question_id AS ID,
        q.question_text AS TEXT,
        s.sub_name AS SUBJECT,
		t.type_name AS TYPE,
		m.policy_name AS POLICY,
		l.level_name AS LEVEL
FROM    questions AS q,
		subjects AS s,
		question_type AS t,
		mark_policy AS m,
		level AS l
WHERE   q.subject_id=s.sub_id AND
		q.question_type_id=t.type_id AND
		q.policy_id=m.policy_id AND
		q.level_id=l.level_id
ORDER BY q.policy_id DESC;
