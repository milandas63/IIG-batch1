#########################################
#########################################
#########################################
#######                           #######
#######          CONTACT          #######
#######          DATABASE         #######
#######                           #######
#########################################
#########################################
#########################################


############################
###                      ###
###    DATABASE teldir   ###
###                      ###
############################
SELECT "DATABASE teldir";
DROP DATABASE IF EXISTS teldir;
CREATE DATABASE teldir;
USE teldir;


###################################
###                             ###
###     TABLE contact_group     ###
###                             ###
###################################
SELECT "TABLE contact_group";
DROP TABLE IF EXISTS contact_group;
CREATE TABLE contact_group(
    group_id            INT(6)              NOT NULL AUTO_INCREMENT,
    group_name          VARCHAR(100)        NOT NULL UNIQUE,
    group_desc          VARCHAR(200)        DEFAULT NULL UNIQUE,
    del                 ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(group_id)
);
INSERT INTO contact_group VALUES
    (1, "Family",           null, null),
    (2, "School Friends",   null, null),
    (3, "College Friends",  null, null),
    (4, "Colleague",        null, null),
    (5, "Teacher",          null, null),
    (6, "Student",          null, null);


##############################
###                        ###
###     TABLE location     ###
###                        ###
##############################
SELECT "TABLE location";
DROP TABLE IF EXISTS location;
CREATE TABLE location(
    loc_id              INT(6)              NOT NULL AUTO_INCREMENT,
    loc_name            VARCHAR(100)        NOT NULL UNIQUE,
    loc_abbr            VARCHAR(20)         DEFAULT NULL,
    loc_state           VARCHAR(100)        DEFAULT NULL,
    loc_country         VARCHAR(100)        DEFAULT NULL,
    del                 ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(loc_id)
);
INSERT INTO location VALUES
    (1, "Bhubaneswar",      "BBS",      "Odisha",           "India", null),
    (2, "Cuttack",          "CTC",      "Odisha",           "India", null),
    (3, "Puri",             "PU",       "Odisha",           "India", null),
    (4, "Balasore",         "BLS",      "Odisha",           "India", null),
    (5, "Berhampur",        "BAM",      "Odisha",           "India", null),
    (6, "Arkansas",         "AR",       "Meryland",         "US",    null),
    (7, "New York City",    "NY",       "New York State",   "US",    null);


#############################
###                       ###
###     TABLE contact     ###
###                       ###
#############################
SELECT "TABLE contact";
DROP TABLE IF EXISTS contact;
CREATE TABLE contact(
    contact_id          INT(6)              NOT NULL AUTO_INCREMENT,
    contact_name        VARCHAR(100)        NOT NULL UNIQUE,
    group_id            INT(6)              REFERENCES contact_group(contact_id),
    location_id         INT(6)              REFERENCES location(location_id),
    land_phone_no       VARCHAR(20)         DEFAULT NULL,
    mobile_no1          VARCHAR(20)         DEFAULT NULL,
    mobile_no2          VARCHAR(20)         DEFAULT NULL,
    mobile_no3          VARCHAR(20)         DEFAULT NULL,
    email_id1           VARCHAR(100)        DEFAULT NULL,
    email_id2           VARCHAR(100)        DEFAULT NULL,
    contact_address     VARCHAR(250)        DEFAULT NULL,
    del                 ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(contact_id)
);
INSERT INTO contact VALUES
    ( 1, "Milan Das",               5,  1,  null,   "7978168568",   "9778911223",   null,   "milandas63@gmail.com",             null, null, null),
    ( 2, "P S Usha",                6,  1,  null,   "7008334116",   null,           null,   "ushanair2956@gmail.com",           null, null, null),
    ( 3, "Pratapaditya Mishra",     6,  1,  null,   "7586910935",   null,           null,   "mishrapratapaditya1234@gmail.com", null, null, null),
    ( 4, "Sandip Kumar Nayak",      6,  1,  null,   "9178335762",   null,           null,   "sandipkumarnayak10@gmail.com",     null, null, null),
    ( 5, "Sikun Soumyaranjan Ojha", 6,  1,  null,   "6370398943",   null,           null,   "sikunsoumyaranjan100@gmail.com",   null, null, null),
    ( 6, "Gopal Krishna Mistry",    6,  1,  null,   "7749917379",   null,           null,   "gopalpapu86@gmail.com",            null, null, null),
    ( 7, "Susmita Parida",          6,  1,  null,   "7978125106",   null,           null,   "susmita.paridacs2010@gmail.com",   null, null, null),
    ( 8, "Asutosh Parida",          6,  1,  null,   "9337407424",   null,           null,   "asutoshps554@gmail.com",           null, null, null),
    ( 9, "Priyabrata Sahoo",        6,  1,  null,   "9390507733",   null,           null,   "spriyabrata456@gmail.com",         null, null, null),
    (10, "Rakesh Das",              6,  1,  null,   "8112178110",   null,           null,   "rakeshdash431@gmail.com",          null, null, null),
    (11, "Asim Hemram",             6,  1,  null,   "7978121967",   null,           null,   "hemramprem@gmail.com",             null, null, null);


#########################################################################################################
###                                      PROJECT DESCRIPTION                                          ###
#########################################################################################################
#
#   FULL MARK: 100
#   TIME: 4 Hours
#
#   Write a program to perform the following work?
#
#   +-----------------------+
#   |       MAIN MENU       |
#   +-----------------------+
#   |                       |
#   |  1. Contact Group     |-------------------------------------------------------+
#   |                       |                                                       |
#   |  2. Contact Location  |---------------------------------+            +-----------------+
#   |                       |                                 |            |      GROUP      |
#   |  3. Contact People    |-----------+            +-----------------+   +-----------------+
#   |                       |           |            |    LOCATION     |   |  1. List        |
#   |  4. Exit Program      |  +-----------------+   +-----------------+   |  2. Add         |
#   |                       |  |      PEOPLE     |   |  1. List        |   |  3. Edit        |
#   +-----------------------+  +-----------------+   |  2. Add         |   |  4. Delete      |
#                              |  1. List-1      |   |  3. Edit        |   |  5. Exit        |
#                              |  2. List-2      |   |  4. Delete      |   +-----------------+
#                              |  3. List-3      |   |  5. Exit        |
#                              |  4. List-4      |   +-----------------+
#                              |  5. Add         |
#                              |  6. Edit        |
#                              |  7. Delet       |
#                              |  8. Exit        |
#                              +-----------------+
#
#
#   CONTACT GROUP LIST
#   +----------+-----------------+------------+
#   | group_id | group_name      | group_desc |
#   +----------+-----------------+------------+
#   |        1 | Family          |            |
#   |        2 | School Friends  |            |
#   |        3 | College Friends |            |
#   |        4 | Colleague       |            |
#   |        5 | Teacher         |            |
#   |        6 | Student         |            |
#   +----------+-----------------+------------+
#
#   LOCATION LIST
#   +--------+---------------+----------+----------------+-------------+
#   | loc_id | loc_name      | loc_abbr | loc_state      | loc_country |
#   +--------+---------------+----------+----------------+-------------+
#   |      1 | Bhubaneswar   | BBS      | Odisha         | India       |
#   |      2 | Cuttack       | CTC      | Odisha         | India       |
#   |      3 | Puri          | PU       | Odisha         | India       |
#   |      4 | Balasore      | BLS      | Odisha         | India       |
#   |      5 | Berhampur     | BAM      | Odisha         | India       |
#   |      6 | Arkansas      | AR       | Meryland       | US          |
#   |      7 | New York City | NY       | New York State | US          |
#   +--------+---------------+----------+----------------+-------------+
#
#   PEOPLE  LIST-1
#   +----------+-----------------------+--------+-----------+----------+----------------------------------+
#   |contact_id|contact_name           |group_id|location_id|mobile_no1| email_id1                        |
#   +----------+-----------------------+--------+-----------+----------+----------------------------------+
#   |         1|Milan Das              |       5|          1|7978168568| milandas63@gmail.com             |
#   |         2|P S Usha               |       6|          1|7008334116| ushanair2956@gmail.com           |
#   |         3|Pratapaditya Mishra    |       6|          1|7586910935| mishrapratapaditya1234@gmail.com |
#   |         4|Sandip Kumar Nayak     |       6|          1|9178335762| sandipkumarnayak10@gmail.com     |
#   |         5|Sikun Soumyaranjan Ojha|       6|          1|6370398943| sikunsoumyaranjan100@gmail.com   |
#   |         6|Gopal Krishna Mistry   |       6|          1|7749917379| gopalpapu86@gmail.com            |
#   |         7|Susmita Parida         |       6|          1|7978125106| susmita.paridacs2010@gmail.com   |
#   |         8|Asutosh Parida         |       6|          1|9337407424| asutoshps554@gmail.com           |
#   |         9|Priyabrata Sahoo       |       6|          1|9390507733| spriyabrata456@gmail.com         |
#   |        10|Rakesh Das             |       6|          1|8112178110| rakeshdash431@gmail.com          |
#   |        11|Asim Hemram            |       6|          1|7978121967| hemramprem@gmail.com             |
#   +----------+-----------------------+--------+-----------+----------+----------------------------------+
#
#   PEOPLE  LIST-2
#   +------------+-------------------------+---------------+------------+------------+------------+
#   | contact_id | contact_name            | land_phone_no | mobile_no1 | mobile_no2 | mobile_no3 |
#   +------------+-------------------------+---------------+------------+------------+------------+
#   |          1 | Milan Das               |               | 7978168568 | 9778911223 |            |
#   |          2 | P S Usha                |               | 7008334116 |            |            |
#   |          3 | Pratapaditya Mishra     |               | 7586910935 |            |            |
#   |          4 | Sandip Kumar Nayak      |               | 9178335762 |            |            |
#   |          5 | Sikun Soumyaranjan Ojha |               | 6370398943 |            |            |
#   |          6 | Gopal Krishna Mistry    |               | 7749917379 |            |            |
#   |          7 | Susmita Parida          |               | 7978125106 |            |            |
#   |          8 | Asutosh Parida          |               | 9337407424 |            |            |
#   |          9 | Priyabrata Sahoo        |               | 9390507733 |            |            |
#   |         10 | Rakesh Das              |               | 8112178110 |            |            |
#   |         11 | Asim Hemram             |               | 7978121967 |            |            |
#   +------------+-------------------------+---------------+------------+------------+------------+
#
#   PEOPLE  LIST-3
#   +------------+-------------------------+----------------------------------+--------------------+
#   | contact_id | contact_name            | email_id1                        | email_id2          |
#   +------------+-------------------------+----------------------------------+--------------------+
#   |          1 | Milan Das               | milandas63@gmail.com             |                    |
#   |          2 | P S Usha                | ushanair2956@gmail.com           |                    |
#   |          3 | Pratapaditya Mishra     | mishrapratapaditya1234@gmail.com |                    |
#   |          4 | Sandip Kumar Nayak      | sandipkumarnayak10@gmail.com     |                    |
#   |          5 | Sikun Soumyaranjan Ojha | sikunsoumyaranjan100@gmail.com   |                    |
#   |          6 | Gopal Krishna Mistry    | gopalpapu86@gmail.com            |                    |
#   |          7 | Susmita Parida          | susmita.paridacs2010@gmail.com   |                    |
#   |          8 | Asutosh Parida          | asutoshps554@gmail.com           |                    |
#   |          9 | Priyabrata Sahoo        | spriyabrata456@gmail.com         |                    |
#   |         10 | Rakesh Das              | rakeshdash431@gmail.com          |                    |
#   |         11 | Asim Hemram             | hemramprem@gmail.com             |                    |
#   +------------+-------------------------+----------------------------------+--------------------+
#
#   PEOPLE  LIST-4
#   +------------+-------------------------+-------------------------------------------------------+
#   | contact_id | contact_name            | contact_address                                       |
#   +------------+-------------------------+-------------------------------------------------------+
#   |          1 | Milan Das               |                                                       |
#   |          2 | P S Usha                |                                                       |
#   |          3 | Pratapaditya Mishra     |                                                       |
#   |          4 | Sandip Kumar Nayak      |                                                       |
#   |          5 | Sikun Soumyaranjan Ojha |                                                       |
#   |          6 | Gopal Krishna Mistry    |                                                       |
#   |          7 | Susmita Parida          |                                                       |
#   |          8 | Asutosh Parida          |                                                       |
#   |          9 | Priyabrata Sahoo        |                                                       |
#   |         10 | Rakesh Das              |                                                       |
#   |         11 | Asim Hemram             |                                                       |
#   +------------+-------------------------+-------------------------------------------------------+
#
#
#
#

