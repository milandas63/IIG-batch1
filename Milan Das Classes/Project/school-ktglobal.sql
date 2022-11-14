DROP DATABASE IF EXISTS kt_global;
CREATE DATABASE IF NOT EXISTS kt_global;
USE kt_global;


##################
##    THEMES    ##
##################
SELECT 'theme';
DROP TABLE IF EXISTS theme;
CREATE TABLE IF NOT EXISTS theme(
    className   VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO theme VALUES('com.birosoft.liquid.LiquidLookAndFeel');


##################
##  USER-TYPE   ##
##################
SELECT 'userType';
DROP TABLE IF EXISTS userType;
CREATE TABLE IF NOT EXISTS userType(
    userType_id             INT(6)          NOT NULL AUTO_INCREMENT,
    userType_desc           VARCHAR(50)     NOT NULL UNIQUE,
    userType_abbr           VARCHAR(10),
    last_update             TIMESTAMP,
    del                     ENUM('*'),
    PRIMARY KEY(userType_id)
);
INSERT INTO userType VALUES
    (1, 'Super User',           'SU', NULL, NULL),
    (2, 'Principal',            'PR', NULL, NULL),
    (3, 'Registrar',            'RG', NULL, NULL),
    (4, 'Computer Incharge',    'CI', NULL, NULL),
    (5, 'Computer Operator',    'CO', NULL, NULL),
    (6, 'Accounts Officer',     'AO', NULL, NULL),
    (7, 'Collection Clerk',     'CC', NULL, NULL);


##################
##  USER-LIST   ##
##################
SELECT 'userList';
DROP TABLE IF EXISTS userList;
CREATE TABLE IF NOT EXISTS userList(
    user_id                     INT(6)          NOT NULL AUTO_INCREMENT,
    user_desc                   VARCHAR(50)     NOT NULL UNIQUE,
    user_password               VARCHAR(50)     NOT NULL,
    userType_id                 INT(6)          NOT NULL REFERENCES userType(userType_id),
    wef_date                    DATE,
    wet_date                    DATE,
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(user_id)
);
CREATE INDEX userlist_user_desc ON userlist(user_desc);
INSERT INTO userlist VALUES
    ( 1, 'Administrator',           'adminis',  1, '2014-01-01', '2016-03-31', NULL, NULL),
    ( 2, 'Principal',               'super',    2, '2014-01-01', '2016-03-31', NULL, NULL),
    ( 3, 'Front Office Assistant',  'front',    5, '2014-01-01', '2016-03-31', NULL, NULL),
    ( 4, 'Accounts Officer',        'accounts', 6, '2014-01-01', '2016-03-31', NULL, NULL),
    ( 5, 'Computer Operator',       'coper',    3, '2014-01-01', '2016-03-31', NULL, NULL);


######################
##  USER-ACTIVITY   ##
######################
SELECT 'userActivity';
DROP TABLE IF EXISTS userActivity;
CREATE TABLE IF NOT EXISTS userActivity(
    userActivity_id             INT(6)          NOT NULL AUTO_INCREMENT,
    userActivity_desc           VARCHAR(50)     NOT NULL UNIQUE,
    userActivity_abbr           VARCHAR(10),
    user_id                     INT(6)          NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(userActivity_id)
);
CREATE INDEX userActivity_userActivity_desc ON userActivity(userActivity_desc);
INSERT INTO userActivity VALUES
    ( 1, 'Super User',          'SU',   1,  NULL, NULL),
    ( 2, 'Admission',           'AD',   1,  NULL, NULL),
    ( 3, 'Academics',           'AC',   1,  NULL, NULL),
    ( 4, 'Establishment',       'ES',   1,  NULL, NULL),
    ( 5, 'Finance',             'FI',   1,  NULL, NULL),
    ( 6, 'Transport',           'TR',   1,  NULL, NULL),
    ( 7, 'Distribution',        'DI',   1,  NULL, NULL),
    ( 8, 'Report',              'RP',   1,  NULL, NULL),
    ( 9, 'Administration',      'AM',   1,  NULL, NULL),
    (10, 'Tools',               'TL',   1,  NULL, NULL),
    (11, 'New-user',            'NU',   1,  NULL, NULL);


##################
##  PRIVILEGE   ##
##################
SELECT 'privilege';
DROP TABLE IF EXISTS privilege;
CREATE TABLE IF NOT EXISTS privilege(
    privilege_id                INT(6)          NOT NULL AUTO_INCREMENT,
    user_id                     INT(6)          NOT NULL REFERENCES userList(user_id),
    userType_id                 INT(6)          NOT NULL REFERENCES userType(userType_id),
    userActivity_id             INT(6)          NOT NULL REFERENCES userActivity(userActivity_id),
    create_id                   INT(6)          NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(privilege_id)
);
INSERT INTO privilege VALUES
    ### Administrator
    (01, 1, 1, 1, 1, NULL, NULL),               #  Super User
    (02, 1, 1, 2, 1, NULL, NULL),               #  Admission
    (03, 1, 1, 3, 1, NULL, NULL),               #  Academics
    (04, 1, 1, 4, 1, NULL, NULL),               #  Establishment
    (05, 1, 1, 5, 1, NULL, NULL),               #  Finance
    (06, 1, 1, 6, 1, NULL, NULL),               #  Transport
    (07, 1, 1, 7, 1, NULL, NULL),               #  Distribution
    (08, 1, 1, 8, 1, NULL, NULL),               #  Report
    (09, 1, 1, 9, 1, NULL, NULL),               #  Administration
    (10, 1, 1,10, 1, NULL, NULL),               #  Tools
    (11, 1, 1,11, 1, NULL, NULL),               #  New-user

    ### Principal
   #(12, 2, 2, 1, 1, NULL, NULL),               #  Super User
    (13, 2, 2, 2, 1, NULL, NULL),               #  Admission
    (14, 2, 2, 3, 1, NULL, NULL),               #  Academics
    (15, 2, 2, 4, 1, NULL, NULL),               #  Establishment
    (16, 2, 2, 5, 1, NULL, NULL),               #  Finance
    (17, 2, 2, 6, 1, NULL, NULL),               #  Transport
    (18, 2, 2, 7, 1, NULL, NULL),               #  Distribution
    (19, 2, 2, 8, 1, NULL, NULL),               #  Report
    (20, 2, 2, 9, 1, NULL, NULL),               #  Administration
    (21, 2, 2,10, 1, NULL, NULL),               #  Tools
   #(22, 2, 2,11, 1, NULL, NULL),               #  New-user

    ### Front-Office Assistant
   #(23, 3, 5, 1, 1, NULL, NULL),               #  Super User
   #(24, 3, 5, 2, 1, NULL, NULL),               #  Admission
    (25, 3, 5, 3, 1, NULL, NULL),               #  Academics
   #(26, 3, 5, 4, 1, NULL, NULL),               #  Establishment
   #(27, 3, 5, 5, 1, NULL, NULL),               #  Finance
   #(28, 3, 5, 6, 1, NULL, NULL),               #  Transport
   #(29, 3, 5, 7, 1, NULL, NULL),               #  Distribution
    (30, 3, 5, 8, 1, NULL, NULL),               #  Report
   #(31, 3, 5, 9, 1, NULL, NULL),               #  Administration
   #(32, 3, 5,10, 1, NULL, NULL),               #  Tools
   #(33, 3, 5,11, 1, NULL, NULL),               #  New-user

    ### Accounts Officer
   #(34, 4, 6, 1, 1, NULL, NULL),               #  Super User
   #(35, 4, 6, 2, 1, NULL, NULL),               #  Admission
    (36, 4, 6, 3, 1, NULL, NULL),               #  Academics
    (37, 4, 6, 4, 1, NULL, NULL),               #  Establishment
    (38, 4, 6, 5, 1, NULL, NULL),               #  Finance
   #(39, 4, 6, 6, 1, NULL, NULL),               #  Transport
   #(40, 4, 6, 7, 1, NULL, NULL),               #  Distribution
    (41, 4, 6, 8, 1, NULL, NULL),               #  Report
   #(42, 4, 6, 9, 1, NULL, NULL),               #  Administration
   #(43, 4, 6,10, 1, NULL, NULL),               #  Tools
   #(44, 4, 6,11, 1, NULL, NULL),               #  New-user

    # Computer Operator
   #(45, 5, 3, 1, 1, NULL, NULL),               #  Super User
    (46, 5, 3, 2, 1, NULL, NULL),               #  Admission
    (47, 5, 3, 3, 1, NULL, NULL),               #  Academics
    (48, 5, 3, 4, 1, NULL, NULL),               #  Establishment
    (49, 5, 3, 5, 1, NULL, NULL),               #  Finance
    (50, 5, 3, 6, 1, NULL, NULL),               #  Transport
    (51, 5, 3, 7, 1, NULL, NULL),               #  Distribution
    (52, 5, 3, 8, 1, NULL, NULL),               #  Report
   #(53, 5, 3, 9, 1, NULL, NULL),               #  Administration
    (54, 5, 3,10, 1, NULL, NULL);               #  Tools
   #(55, 5, 3,11, 1, NULL, NULL);               #  New-user


##############
##  LOGIN   ##
##############
SELECT 'login';
DROP TABLE IF EXISTS login;
CREATE TABLE IF NOT EXISTS login (
    login_id        INT(8)          NOT NULL AUTO_INCREMENT,
    user_id         INT(6)          NOT NULL,
    logged_from     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    logged_to       TIMESTAMP       DEFAULT '0000-00-00 00:00:00',
    del             ENUM('*')       DEFAULT NULL,
    PRIMARY KEY(login_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
#


########################
##   AFFILIATION-TO   ##
########################
SELECT 'affiliation_to';
DROP TABLE IF EXISTS affiliation_to;
CREATE TABLE IF NOT EXISTS affiliation_to(
    affiliation_id              INT(6)              NOT NULL AUTO_INCREMENT,
    affiliation_desc            VARCHAR(50)         NOT NULL UNIQUE,
    affiliation_abbr            VARCHAR(10)         UNIQUE,
    board_address               VARCHAR(100),
    user_id                     INT(6)              NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(affiliation_id)
);
CREATE INDEX affiliation_to_affiliation_desc ON affiliation_to(affiliation_desc);
INSERT INTO affiliation_to VALUES
    ( 1, 'Board of Secondary Education',              'BSE',  'Cuttack',   1, NULL, NULL),
    ( 2, 'Central Board of Secondary Education',      'CBSE', 'New Delhi', 1, NULL, NULL),
    ( 3, 'Indian Certificate of Secondary Education', 'ICSE', 'New Delhi', 1, NULL, NULL);


################
##   CONFIG   ##
################
SELECT 'config';
DROP TABLE IF EXISTS config;
CREATE TABLE IF NOT EXISTS config(
    config_id                       INT(6)                      NOT NULL AUTO_INCREMENT,
    school_network_id               INT(2)                      NOT NULL DEFAULT 1,
    school_name                     VARCHAR(50)                 NOT NULL,
    school_address_1                VARCHAR(50),
    school_address_2                VARCHAR(50),
    school_address_3                VARCHAR(50),
    school_address_4                VARCHAR(50),
    pin_code                        VARCHAR(6),
    email_id                        VARCHAR(50),
    website                         VARCHAR(50),
    phone_no                        VARCHAR(50),
    fax_no                          VARCHAR(50),
    affiliation_id                  INT(6)                      NOT NULL REFERENCES affiliation_to(affiliation_id),
    affiliation_notice              VARCHAR(50),
    registration_no                 VARCHAR(50),
    building_permit_no              VARCHAR(50),
    fire_safety_cert_no             VARCHAR(50),
    academic_year                   VARCHAR(10)                 DEFAULT '2014-15',
    max_seat                        ENUM('Y','N')               NOT NULL DEFAULT 'N',
    rollno_gen_type                 ENUM('A','M')               NOT NULL DEFAULT 'A',
    rollno_gen_status               ENUM('Y','N')               NOT NULL DEFAULT 'N',
    fees_span                       ENUM('M','B','Q','H','Y')   NOT NULL DEFAULT 'M',
    discount_pc                     DOUBLE(6,2)                 NOT NULL DEFAULT 0.0,
    formtype_application_form       VARCHAR(30),
    user_id                         INT(6)                      NOT NULL REFERENCES userList(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*'),
    PRIMARY KEY(config_id)
);
INSERT INTO config(school_name,school_address_1,school_address_2,school_address_3,school_address_4,pin_code,email_id,website,phone_no,fax_no,affiliation_id,affiliation_notice,academic_year,max_seat,fees_span,discount_pc,formtype_application_form,user_id) VALUES
    ('LOYOLA SCHOOL', 'E. C. Rly. Colony', 'Bhubaneswar', 'Odisha', 'India', '751023', 'info@loyolabbsr.com', 'www.loyolabbsr.com', '91-674-2300791', '91-674-2300365', 3, 'Affiliated to ICSE, Delhi', '2015-16', 'N', 'Q', 5.00, 'Loyola', 1);


#################
##   SESSION   ##
#################
SELECT 'session';
DROP TABLE IF EXISTS session;
CREATE TABLE IF NOT EXISTS session(
    session_id                  INT(6)              NOT NULL AUTO_INCREMENT,
    session_desc                VARCHAR(30)         NOT NULL UNIQUE,
    session_abbr                VARCHAR(10)         UNIQUE,
    session_start_date          DATE,
    session_end_date            DATE,
    session_active              ENUM('N','Y')       NOT NULL DEFAULT 'N',
    section_allotment_processed ENUM('N','Y')       NOT NULL DEFAULT 'N',
    special_activity_processed  ENUM('N','Y')       NOT NULL DEFAULT 'N',
    user_id                     INT(6)              NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(session_id)
);
CREATE INDEX session_session_desc ON session(session_desc);
INSERT INTO session VALUES
    ( 1, '2001-02', '01-02', STR_TO_DATE('01-04-2001','%d-%m-%Y'), STR_TO_DATE('31-03-2002','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    ( 2, '2002-03', '02-03', STR_TO_DATE('01-04-2002','%d-%m-%Y'), STR_TO_DATE('31-03-2003','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    ( 3, '2003-04', '03-04', STR_TO_DATE('01-04-2003','%d-%m-%Y'), STR_TO_DATE('31-03-2004','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    ( 4, '2004-05', '04-05', STR_TO_DATE('01-04-2004','%d-%m-%Y'), STR_TO_DATE('31-03-2005','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    ( 5, '2005-06', '05-06', STR_TO_DATE('01-04-2005','%d-%m-%Y'), STR_TO_DATE('31-03-2006','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    ( 6, '2006-07', '06-07', STR_TO_DATE('01-04-2006','%d-%m-%Y'), STR_TO_DATE('31-03-2007','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    ( 7, '2007-08', '07-08', STR_TO_DATE('01-04-2007','%d-%m-%Y'), STR_TO_DATE('31-03-2008','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    ( 8, '2008-09', '08-09', STR_TO_DATE('01-04-2008','%d-%m-%Y'), STR_TO_DATE('31-03-2009','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    ( 9, '2009-10', '09-10', STR_TO_DATE('01-04-2009','%d-%m-%Y'), STR_TO_DATE('31-03-2010','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    (10, '2010-11', '10-11', STR_TO_DATE('01-04-2010','%d-%m-%Y'), STR_TO_DATE('31-03-2011','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    (11, '2011-12', '11-12', STR_TO_DATE('01-04-2011','%d-%m-%Y'), STR_TO_DATE('31-03-2012','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    (12, '2012-13', '12-13', STR_TO_DATE('01-04-2012','%d-%m-%Y'), STR_TO_DATE('31-03-2013','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    (13, '2013-14', '13-14', STR_TO_DATE('01-04-2013','%d-%m-%Y'), STR_TO_DATE('31-03-2014','%d-%m-%Y'), 'N', 'Y', 'Y', 1, NULL, NULL),
    (14, '2014-15', '14-15', STR_TO_DATE('01-04-2014','%d-%m-%Y'), STR_TO_DATE('31-03-2015','%d-%m-%Y'), 'N', 'N', 'Y', 1, NULL, NULL),
    (15, '2015-16', '15-16', STR_TO_DATE('01-04-2015','%d-%m-%Y'), STR_TO_DATE('31-03-2016','%d-%m-%Y'), 'Y', 'N', 'N', 1, NULL, NULL);


####################
##   INCUMBENCY   ##
####################
SELECT 'incumbency';
DROP TABLE IF EXISTS incumbency;
CREATE TABLE IF NOT EXISTS incumbency(
    incumbency_id               INT(6)          NOT NULL AUTO_INCREMENT,
    incumbency_name             VARCHAR(50)     NOT NULL,
    designation                 VARCHAR(50),
    period_from                 DATE,
    period_to                   DATE,
    signature                   BLOB,
    user_id                     INT(6)              NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(incumbency_id)
);
INSERT INTO incumbency VALUES
    (1, 'A',                    NULL, STR_TO_DATE('01-04-2001','%d-%m-%Y'), STR_TO_DATE('31-03-2002','%d-%m-%Y'), NULL, 1, NULL, NULL),
    (2, 'B',                    NULL, STR_TO_DATE('01-04-2001','%d-%m-%Y'), STR_TO_DATE('31-03-2002','%d-%m-%Y'), NULL, 1, NULL, NULL),
    (3, 'C',                    NULL, STR_TO_DATE('01-04-2001','%d-%m-%Y'), STR_TO_DATE('31-03-2002','%d-%m-%Y'), NULL, 1, NULL, NULL),
    (4, 'Fr. Amaladoss SJ.',    NULL, STR_TO_DATE('01-04-2001','%d-%m-%Y'), STR_TO_DATE('31-03-2002','%d-%m-%Y'), NULL, 1, NULL, NULL);


#######################
##   ACTIVE-STATUS   ##
#######################
SELECT 'active_status';
DROP TABLE IF EXISTS active_status;
CREATE TABLE IF NOT EXISTS active_status(
    status_id                   INT(6)              NOT NULL AUTO_INCREMENT,
    status_desc                 VARCHAR(50)         NOT NULL UNIQUE,
    status_abbr                 VARCHAR(10)         UNIQUE,
    user_id                     INT(6)              NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(status_id)
);
CREATE INDEX active_status_status_desc ON active_status(status_desc);
INSERT INTO active_status VALUES
    ( 1, 'Select',      NULL, 1, NULL, NULL),
    ( 2, 'Active',      NULL, 1, NULL, NULL),
    ( 3, 'Disabled',    'D',  1, NULL, NULL),
    ( 4, 'Left',        'L',  1, NULL, NULL),
    ( 5, 'Complete',    'C',  1, NULL, NULL);


###############
##   CLASS   ##
###############
SELECT 'class';
DROP TABLE IF EXISTS class;
CREATE TABLE IF NOT EXISTS class(
    class_id                        INT(2)                          NOT NULL AUTO_INCREMENT,
    class_desc                      VARCHAR(30)                     NOT NULL UNIQUE,
    class_roman                     VARCHAR(10)                     UNIQUE,
    class_digit                     INT(6)                          UNIQUE,
    class_words                     VARCHAR(30)                     UNIQUE,
    user_id                         INT(6)                          NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')                       DEFAULT NULL,
    PRIMARY KEY(class_id)
);
INSERT INTO class VALUES
    ( 1, 'Select',              NULL,   NULL, NULL,                 1, NULL, NULL),
    ( 2, 'Lower Kindergarten',  'LKG',  -2,   'Lower Kindergarten', 1, NULL, NULL),
    ( 3, 'Upper Kindergarten',  'UKG',  -1,   'Upper Kindergarten', 1, NULL, NULL),
    ( 4, 'Class I',             'I',     1,   'First',              1, NULL, NULL),
    ( 5, 'Class II',            'II',    2,   'Second',             1, NULL, NULL),
    ( 6, 'Class III',           'III',   3,   'Third',              1, NULL, NULL),
    ( 7, 'Class IV',            'IV',    4,   'Fourth',             1, NULL, NULL),
    ( 8, 'Class V',             'V',     5,   'Fifth',              1, NULL, NULL),
    ( 9, 'Class VI',            'VI',    6,   'Sixth',              1, NULL, NULL),
    (10, 'Class VII',           'VII',   7,   'Seventh',            1, NULL, NULL),
    (11, 'Class VIII',          'VIII',  8,   'Eighth',             1, NULL, NULL),
    (12, 'Class IX',            'IX',    9,   'Ninth',              1, NULL, NULL),
    (13, 'Class X',             'X',    10,   'Tenth',              1, NULL, NULL),
    (14, 'Class XI',            'XI',   11,   'Eleventh',           1, NULL, NULL),
    (15, 'Class XII',           'XII',  12,   'Twelfth',            1, NULL, NULL);


#################
##   SECTION   ##
#################
SELECT 'section';
DROP TABLE IF EXISTS section;
CREATE TABLE IF NOT EXISTS section(
    section_id                      INT(6)                  NOT NULL AUTO_INCREMENT,
    section_code                    CHAR(2)                 NOT NULL UNIQUE,
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(section_id)
);
INSERT INTO section VALUES
    (1, 'A', 1, NULL, NULL),
    (2, 'B', 1, NULL, NULL),
    (3, 'C', 1, NULL, NULL),
    (4, 'D', 1, NULL, NULL),
    (5, 'E', 1, NULL, NULL);


#############################
##   CLASS-ROOM-CAPACITY   ##
#############################
SELECT 'max_seat';
DROP TABLE IF EXISTS max_seat;
CREATE TABLE IF NOT EXISTS max_seat(
    max_seat_id                     INT(6)                  NOT NULL AUTO_INCREMENT,
    group_id                        INT(2)                  NOT NULL,
    class_id                        INT(2)                  NOT NULL REFERENCES class(class_id),
    class_roman                     VARCHAR(10)             NOT NULL,
    section_id                      INT(6)                  NOT NULL REFERENCES section(section_id),
    section_code                    CHAR(2)                 NOT NULL,
    second_language                 VARCHAR(30),
    section_capacity                INT(3),
    section_occupancy               INT(3),
    section_vacancy                 INT(3),
    class_capacity                  INT(3),
    class_occupancy                 INT(3),
    class_vacancy                   INT(3),
    group_total                     INT(8),
    start_rollno                    INT(8),
    end_rollno                      INT(8),
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(max_seat_id)
);
INSERT INTO max_seat VALUES
#   max_seat_id                                     section_capacity         group_total
#       group_id
#           class_id                                    section_occupancy         start_rollno
#               class_roman                                  section_vacancy         end_rollno
#                       section_id                               class_capacity           user_id
#                           section_code                             class_occupancy          last_update
#                                   second_language                      class_vacancy              del
    ( 1, 1,  2, 'LKG',  1,  'A',    '',             40, 42,  0,  0,  0,  0,  0,   1, 40,  1,  NULL, NULL),
    ( 2, 1,  2, 'LKG',  2,  'B',    '',             40, 40,  0,  0,  0,  0,  0,   1, 40,  1,  NULL, NULL),
    ( 3, 1,  2, 'LKG',  3,  'C',    '',             40, 41,  0,  0,  0,  0,  0,   1, 40,  1,  NULL, NULL),
    ( 4, 1,  2, 'LKG',  4,  'D',    '',             40, 40,  0,  0,  0,  0,  0,   1, 40,  1,  NULL, NULL),
    ( 5, 1,  2, 'LKG',  5,  'E',    NULL,           40,  0,  0,  0,  0,  0,  0,   1, 40,  1,  NULL, NULL),
    ( 6, 1,  3, 'UKG',  1,  'A',    'Hindi',        48, 47,  0,  0,  0,  0,  0,   1, 48,  1,  NULL, NULL),
    ( 7, 1,  3, 'UKG',  2,  'B',    'Hindi',        48, 45,  0,  0,  0,  0,  0,   1, 48,  1,  NULL, NULL),
    ( 8, 1,  3, 'UKG',  3,  'C',    'Odia',         48, 50,  0,  0,  0,  0,  0,   1, 48,  1,  NULL, NULL),
    ( 9, 1,  3, 'UKG',  4,  'D',    'Combo',        48, 46,  0,  0,  0,  0,  0,   1, 48,  1,  NULL, NULL),
    (10, 1,  3, 'UKG',  5,  'E',    NULL,           48,  0,  0,  0,  0,  0,  0,   1, 48,  1,  NULL, NULL),
    (11, 1,  4, 'I',    1,  'A',    'Hindi',        50, 48,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (12, 1,  4, 'I',    2,  'B',    'Hindi',        50, 48,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (13, 1,  4, 'I',    3,  'C',    'Odia',         50, 50,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (14, 1,  4, 'I',    4,  'D',    'Combo',        50, 47,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (15, 1,  4, 'I',    5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (16, 1,  5, 'II',   1,  'A',    'Hindi',        50, 50,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (17, 1,  5, 'II',   2,  'B',    'Hindi',        50, 47,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (18, 1,  5, 'II',   3,  'C',    'Odia',         50, 49,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (19, 1,  5, 'II',   4,  'D',    'Combo',        50, 48,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (20, 1,  5, 'II',   5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (21, 1,  6, 'III',  1,  'A',    'Hindi',        50, 48,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (22, 1,  6, 'III',  2,  'B',    'Hindi',        50, 47,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (23, 1,  6, 'III',  3,  'C',    'Odia',         50, 50,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (24, 1,  6, 'III',  4,  'D',    'Combo',        50, 47,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (25, 1,  6, 'III',  5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (26, 1,  7, 'IV',   1,  'A',    'Hindi',        50, 51,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (27, 1,  7, 'IV',   2,  'B',    'Hindi',        50, 50,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (28, 1,  7, 'IV',   3,  'C',    'Odia',         50, 50,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (29, 1,  7, 'IV',   4,  'D',    'Combo',        50, 52,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (30, 1,  7, 'IV',   5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (31, 1,  8, 'V',    1,  'A',    'Hindi',        50, 48,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (32, 1,  8, 'V',    2,  'B',    'Hindi',        50, 49,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (33, 1,  8, 'V',    3,  'C',    'Odia',         50, 49,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (34, 1,  8, 'V',    4,  'D',    'Combo',        50, 48,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (35, 1,  8, 'V',    5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (36, 1,  9, 'VI',   1,  'A',    'Hindi',        50, 49,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (37, 1,  9, 'VI',   2,  'B',    'Hindi',        50, 50,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (38, 1,  9, 'VI',   3,  'C',    'Odia',         50, 48,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (39, 1,  9, 'VI',   4,  'D',    'Combo',        50, 49,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (40, 1,  9, 'VI',   5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (41, 1, 10, 'VII',  1,  'A',    'Hindi',        50, 50,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (42, 1, 10, 'VII',  2,  'B',    'Hindi',        50, 47,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (43, 1, 10, 'VII',  3,  'C',    'Odia',         50, 50,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (44, 1, 10, 'VII',  4,  'D',    'Combo',        50, 49,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (45, 1, 10, 'VII',  5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (46, 1, 11, 'VIII', 1,  'A',    'Hindi',        50, 45,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (47, 1, 11, 'VIII', 2,  'B',    'Hindi',        50, 48,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (48, 1, 11, 'VIII', 3,  'C',    'Odia',         50, 49,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (49, 1, 11, 'VIII', 4,  'D',    'Combo',        50, 45,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (50, 1, 11, 'VIII', 5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (51, 1, 12, 'IX',   1,  'A',    'Hindi/Eco',    50, 47,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (52, 1, 12, 'IX',   2,  'B',    'Combo/Combo',  50, 52,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (53, 1, 12, 'IX',   3,  'C',    'Odia/Comp',    50, 50,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (54, 1, 12, 'IX',   4,  'D',    'Hindi/Comp',   50, 48,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (55, 1, 12, 'IX',   5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (56, 1, 13, 'X',    1,  'A',    'Combo/Eco',    50, 35,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (57, 1, 13, 'X',    2,  'B',    'Combo/Combo',  50, 36,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (58, 1, 13, 'X',    3,  'C',    'Combo/Comp',   50, 41,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (59, 1, 13, 'X',    4,  'D',    'Combo/Comp',   50, 42,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (60, 1, 13, 'X',    5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (61, 2, 14, 'XI',   1,  'A',    'Science',      50,  3,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (62, 2, 14, 'XI',   2,  'B',    'Arts/Comm',    50,  4,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (63, 2, 14, 'XI',   3,  'C',    NULL,           50,  3,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (64, 2, 14, 'XI',   4,  'D',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (65, 2, 14, 'XI',   5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (66, 2, 15, 'XII',  1,  'A',    'Science',      50, 15,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (67, 2, 15, 'XII',  2,  'B',    'Arts/Comm',    50, 20,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (68, 2, 15, 'XII',  3,  'C',    NULL,           50, 24,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (69, 2, 15, 'XII',  4,  'D',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL),
    (70, 2, 15, 'XII',  5,  'E',    NULL,           50,  0,  0,  0,  0,  0,  0,   1, 50,  1,  NULL, NULL);


#####################
##   NATIONALITY   ##
#####################
SELECT 'nationality';
DROP TABLE IF EXISTS nationality;
CREATE TABLE IF NOT EXISTS nationality(
    nation_id                       INT(6)                      NOT NULL AUTO_INCREMENT,
    nation_desc                     VARCHAR(30)                 NOT NULL UNIQUE,
    nation_iso                      VARCHAR(10)                 UNIQUE,
    user_id                         INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(nation_id)
);
CREATE INDEX nationality_nation_desc ON nationality(nation_desc);
INSERT INTO nationality VALUES
    ( 1, 'Select',      NULL,   1, NULL, NULL),
    ( 2, 'Indian',      'IN',   1, NULL, NULL),
    ( 3, 'Pakistani',   'PK',   1, NULL, NULL),
    ( 4, 'Bangladeshi', 'BD',   1, NULL, NULL),
    ( 5, 'Sri Lankan',  'LK',   1, NULL, NULL),
    ( 6, 'Bhutani',     'BT',   1, NULL, NULL),
    ( 7, 'Nepalese',    'NP',   1, NULL, NULL),
    ( 8, 'Thais',       'TH',   1, NULL, NULL),
    ( 9, 'American',    'US',   1, NULL, NULL),
    (10, 'Australian',  'AU',   1, NULL, NULL),
    (11, 'British',     'UK',   1, NULL, NULL),
    (12, 'Korean',      'KO',   1, NULL, NULL),
    (13, 'Portuguese',  'PT',   1, NULL, NULL);


##################
##   RELIGION   ##
##################
SELECT 'religion';
DROP TABLE IF EXISTS religion;
CREATE TABLE IF NOT EXISTS religion(
    religion_id                     INT(6)                      NOT NULL AUTO_INCREMENT,
    religion_desc                   VARCHAR(30)                 NOT NULL UNIQUE,
    religion_abbr                   VARCHAR(10)                 UNIQUE,
    user_id                         INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(religion_id)
);
CREATE INDEX religion_religion_desc ON religion(religion_desc);
INSERT INTO religion VALUES
    ( 1, 'Select',      NULL,   1,  NULL, NULL),
    ( 2, 'Hindu',       NULL,   1,  NULL, NULL),
    ( 3, 'Islam',       NULL,   1,  NULL, NULL),
    ( 4, 'Christian',   NULL,   1,  NULL, NULL),
    ( 5, 'Buddhism',    NULL,   1,  NULL, NULL),
    ( 6, 'Jainism',     NULL,   1,  NULL, NULL),
    ( 7, 'Bahai',       NULL,   1,  NULL, NULL),
    ( 8, 'Sikhism',     NULL,   1,  NULL, NULL),
    ( 9, 'Sarnaism',    NULL,   1,  NULL, NULL),
    (10, 'Atheist',     NULL,   1,  NULL, NULL);


#######################
##   MOTHER-TONGUE   ##
#######################
SELECT 'mother_tongue';
DROP TABLE IF EXISTS mother_tongue;
CREATE TABLE IF NOT EXISTS mother_tongue(
    tongue_id                       INT(6)              NOT NULL AUTO_INCREMENT,
    tongue_desc                     VARCHAR(30)         NOT NULL UNIQUE,
    tongue_abbr                     VARCHAR(10)         UNIQUE,
    user_id                         INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(tongue_id)
);
CREATE INDEX mother_tongue_tongue_desc ON mother_tongue(tongue_desc);
INSERT INTO mother_tongue VALUES
    ( 1, 'Select',      NULL,   1,  NULL,  NULL),
    ( 2, 'Assamee',     NULL,   1,  NULL,  NULL),
    ( 3, 'Bengali',     NULL,   1,  NULL,  NULL),
    ( 4, 'English',     NULL,   1,  NULL,  NULL),
    ( 5, 'Gujurati',    NULL,   1,  NULL,  NULL),
    ( 6, 'Gurmukhi',    NULL,   1,  NULL,  NULL),
    ( 7, 'Hindi',       NULL,   1,  NULL,  NULL),
    ( 8, 'Ho',          NULL,   1,  NULL,  NULL),
    ( 9, 'Kannada',     NULL,   1,  NULL,  NULL),
    (10, 'Kashmiri',    NULL,   1,  NULL,  NULL),
    (11, 'Kharia',      NULL,   1,  NULL,  NULL),
    (12, 'Koncani',     NULL,   1,  NULL,  NULL),
    (13, 'Korean',      NULL,   1,  NULL,  NULL),
    (14, 'Kui',         NULL,   1,  NULL,  NULL),
    (15, 'Maithili',    NULL,   1,  NULL,  NULL),
    (16, 'Malayalam',   NULL,   1,  NULL,  NULL),
    (17, 'Manipuri',    NULL,   1,  NULL,  NULL),
    (18, 'Marathi',     NULL,   1,  NULL,  NULL),
    (19, 'Marwari',     NULL,   1,  NULL,  NULL),
    (20, 'Mizo',        NULL,   1,  NULL,  NULL),
    (21, 'Munda',       NULL,   1,  NULL,  NULL),
    (22, 'Nepali',      NULL,   1,  NULL,  NULL),
    (23, 'Odia',        NULL,   1,  NULL,  NULL),
    (24, 'Portugese',   NULL,   1,  NULL,  NULL),
    (25, 'Punjabi',     NULL,   1,  NULL,  NULL),
    (26, 'Rajasthani',  NULL,   1,  NULL,  NULL),
    (27, 'Rongmei',     NULL,   1,  NULL,  NULL),
    (28, 'Santhali',    NULL,   1,  NULL,  NULL),
    (29, 'Sindhi',      NULL,   1,  NULL,  NULL),
    (30, 'Tamil',       NULL,   1,  NULL,  NULL),
    (31, 'Tekygy',      NULL,   1,  NULL,  NULL),
    (32, 'Telugu',      NULL,   1,  NULL,  NULL),
    (33, 'Tulu',        NULL,   1,  NULL,  NULL),
    (34, 'Vajjika',     NULL,   1,  NULL,  NULL),
    (35, 'Urdu',        NULL,   1,  NULL,  NULL);


###################
##   ETHNICITY   ##
###################
SELECT 'ethnicity';
DROP TABLE IF EXISTS ethnicity;
CREATE TABLE IF NOT EXISTS ethnicity(
    ethnicity_id                    INT(6)                      NOT NULL AUTO_INCREMENT,
    ethnicity_desc                  VARCHAR(30)                 NOT NULL UNIQUE,
    ethnicity_abbr                  VARCHAR(10)                 UNIQUE,
    user_id                         INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(ethnicity_id)
);
CREATE INDEX ethnicity_ethnicity_desc ON ethnicity(ethnicity_desc);
INSERT INTO ethnicity VALUES
    ( 1, 'Select',      NULL,   1, NULL, NULL),
    ( 2, 'Odia',        NULL,   1, NULL, NULL),
    ( 3, 'Bengali',     NULL,   1, NULL, NULL),
    ( 4, 'Hindi',       NULL,   1, NULL, NULL),
    ( 5, 'Assamee',     NULL,   1, NULL, NULL);


########################
##   MARITAL-STATUS   ##
########################
SELECT 'marital_status';
DROP TABLE IF EXISTS marital_status;
CREATE TABLE IF NOT EXISTS marital_status(
    marital_status_id               INT(6)                      NOT NULL AUTO_INCREMENT,
    marital_status_desc             VARCHAR(30)                 NOT NULL UNIQUE,
    marital_status_abbr             VARCHAR(10)                 UNIQUE,
    user_id                         INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(marital_status_id)
);
CREATE INDEX marital_status_marital_status_desc ON marital_status(marital_status_desc);
INSERT INTO marital_status VALUES
    ( 1, 'Select',      NULL,   1,  NULL,  NULL),
    ( 2, 'Married',     NULL,   1,  NULL,  NULL),
    ( 3, 'Unmarried',   NULL,   1,  NULL,  NULL),
    ( 4, 'Divorced',    NULL,   1,  NULL,  NULL),
    ( 5, 'Widow',       NULL,   1,  NULL,  NULL);


#############################
##   PHYSICAL-DISABILITY   ##
#############################
SELECT 'physical_disability';
DROP TABLE IF EXISTS physical_disability;
CREATE TABLE IF NOT EXISTS physical_disability(
    disability_id                   INT(6)                      NOT NULL AUTO_INCREMENT,
    disability_desc                 VARCHAR(30)                 NOT NULL UNIQUE,
    disability_abbr                 VARCHAR(10)                 UNIQUE,
    user_id                         INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(disability_id)
);
CREATE INDEX physical_disability_disability_desc ON physical_disability(disability_desc);
INSERT INTO physical_disability VALUES
    ( 1, 'Select',                  NULL,     1, NULL, NULL),
    ( 2, 'Physical Handicapped',    NULL,     1, NULL, NULL),
    ( 3, 'Hearing Handicapped',     NULL,     1, NULL, NULL),
    ( 4, 'Visual Handicapped',      NULL,     1, NULL, NULL);


#########################
##   PREVIOUS-RECORD   ##
#########################
SELECT 'previous_record';
DROP TABLE IF EXISTS previous_record;
CREATE TABLE IF NOT EXISTS previous_record(
    record_id                       INT(2)                      NOT NULL,
    record_desc                     VARCHAR(30)                 NOT NULL UNIQUE,
    record_abbr                     VARCHAR(10)                 UNIQUE,
    user_id                         INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(record_id)
);
CREATE INDEX previous_record_record_desc ON previous_record(record_desc);
INSERT INTO previous_record VALUES
    ( 1, 'Select',          NULL,     1, NULL, NULL),
    ( 2, 'Pass',            NULL,     1, NULL, NULL),
    ( 3, 'Fail',            NULL,     1, NULL, NULL),
    ( 4, 'Promoted',        NULL,     1, NULL, NULL),
    ( 5, 'Detained',        NULL,     1, NULL, NULL),
    ( 6, 'Rusticate',       NULL,     1, NULL, NULL);


#####################
##   INOCULATION   ##
#####################
SELECT 'inoculation';
DROP TABLE IF EXISTS inoculation;
CREATE TABLE IF NOT EXISTS inoculation(
    inoculation_id              INT(6)                  NOT NULL AUTO_INCREMENT,
    inoculation_desc            VARCHAR(30)             NOT NULL UNIQUE,
    inoculation_abbr            VARCHAR(10)             UNIQUE,
    user_id                     INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(inoculation_id)
);
CREATE INDEX inoculation_inoculation_desc ON inoculation(inoculation_desc);
INSERT INTO inoculation VALUES
    ( 1, 'Triple Antigen',  'TA',   1, NULL, NULL),
    ( 2, 'Polio',           'PO',   1, NULL, NULL),
    ( 3, 'BCG',             'BCG',  1, NULL, NULL),
    ( 4, 'Cholera',         'CL',   1, NULL, NULL),
    ( 5, 'Small Pox',       'SP',   1, NULL, NULL),
    ( 6, 'Typhoid',         'TY',   1, NULL, NULL),
    ( 7, 'Measles',         'ME',   1, NULL, NULL),
    ( 8, 'Yello Fever',     'YF',   1, NULL, NULL);


#####################
##   BLOOD-GROUP   ##
#####################
SELECT 'blood_group';
DROP TABLE IF EXISTS blood_group;
CREATE TABLE IF NOT EXISTS blood_group(
    bg_id                       INT(6)                  NOT NULL AUTO_INCREMENT,
    bg_desc                     VARCHAR(30)             NOT NULL UNIQUE,
    bg_abbr                     VARCHAR(10)             UNIQUE,
    user_id                     INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(bg_id)
);
CREATE INDEX blood_group_bg_desc ON blood_group(bg_desc);
INSERT INTO blood_group VALUES
    ( 1, 'Select',      NULL,   1, NULL, NULL),
    ( 2, 'O Positive',  'O+',   1, NULL, NULL),
    ( 3, 'O Negative',  'O-',   1, NULL, NULL),
    ( 4, 'A Positive',  'A+',   1, NULL, NULL),
    ( 5, 'A Negative',  'A-',   1, NULL, NULL),
    ( 6, 'B Positive',  'B+',   1, NULL, NULL),
    ( 7, 'B Negative',  'B-',   1, NULL, NULL),
    ( 8, 'AB Positive', 'AB+',  1, NULL, NULL),
    ( 9, 'AB Negative', 'AB-',  1, NULL, NULL);


###########################
##   EMPLOYMENT-STATUS   ##
###########################
SELECT 'employment_status';
DROP TABLE IF EXISTS employment_status;
CREATE TABLE IF NOT EXISTS employment_status(
    emp_status_id               INT(6)                  NOT NULL AUTO_INCREMENT,
    emp_status_desc             VARCHAR(30)             NOT NULL UNIQUE,
    emp_status_abbr             VARCHAR(10)             UNIQUE,
    user_id                     INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(emp_status_id)
);
CREATE INDEX employment_status_emp_status_desc ON employment_status(emp_status_desc);
INSERT INTO employment_status VALUES
    ( 1, 'Select',      NULL,   1, NULL, NULL),
    ( 2, 'Permanent',   NULL,   1, NULL, NULL),
    ( 3, 'Contractual', NULL,   1, NULL, NULL),
    ( 4, 'Provation',   NULL,   1, NULL, NULL),
    ( 5, 'Temporary',   NULL,   1, NULL, NULL),
    ( 6, 'Others',      NULL,   1, NULL, NULL);


#########################
##   SECOND-LANGUAGE   ##
#########################
SELECT 'second_language';
DROP TABLE IF EXISTS second_language;
CREATE TABLE IF NOT EXISTS second_language(
    second_lang_id              INT(6)                  NOT NULL AUTO_INCREMENT,
    second_lang_desc            VARCHAR(30)             NOT NULL UNIQUE,
    second_lang_abbr            VARCHAR(10)             UNIQUE,
    user_id                     INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(second_lang_id)
);
INSERT INTO second_language VALUES
    ( 1, 'Select',      NULL,   1, NULL, NULL),
    ( 2, 'Hindi',       NULL,   1, NULL, NULL),
    ( 3, 'Oriya',       NULL,   1, NULL, NULL);


##################
##   CATEGORY   ##
##################
SELECT 'category';
DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category(
    category_id                 INT(6)                  NOT NULL AUTO_INCREMENT,
    category_desc               VARCHAR(100)            NOT NULL UNIQUE,
    category_abbr               VARCHAR(10)             UNIQUE,
    user_id                     INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(category_id)
);
CREATE INDEX category_category_desc ON category(category_desc);
CREATE INDEX category_category_abbr ON category(category_abbr);
INSERT INTO category VALUES
    ( 1, 'Select',                                                          NULL,   1, NULL, NULL),
    ( 2, 'Schedule Caste',                                                  'SC',   1, NULL, NULL),
    ( 3, 'Schedule Tribe',                                                  'ST',   1, NULL, NULL),
    ( 4, 'Other Backward Class',                                            'OBC',  1, NULL, NULL),
    ( 5, 'Physically Handicap',                                             'PH',   1, NULL, NULL),
    ( 6, 'General',                                                         'GEN',  1, NULL, NULL),
    ( 7, 'Schedule Backward Class',                                         'SEBC', 1, NULL, NULL),
    ( 8, 'Homeless/Settled Place/Abode & Ostensible Means of Subsistence',  'HSAO', 1, NULL, NULL),
    ( 9, 'Beggar Child/Street Child/Working Child',                         'BSW',  1, NULL, NULL),
    (10, 'Ex-Service Person',                                               'EXSP', 1, NULL, NULL),
    (11, 'Olympian Sports',                                                 'OLP',  1, NULL, NULL);


########################################
##   APPLICATION-FORM-SALES-RECEIPT   ##
########################################
SELECT 'form_sale_receipt';
DROP TABLE IF EXISTS form_sale_receipt;
CREATE TABLE IF NOT EXISTS form_sale_receipt(
    money_receipt_no                INT(6)                      NOT NULL AUTO_INCREMENT,
    money_receipt_ref               VARCHAR(10),
    money_receipt_date              DATE                        NOT NULL,
    academic_year                   VARCHAR(10)                 NOT NULL,
    form_no                         VARCHAR(20)                 NOT NULL,
    admission_class                 VARCHAR(30)                 NOT NULL,
    student_name                    VARCHAR(50)                 NOT NULL,
    gender                          ENUM('M','F')               NOT NULL,
    amount                          DOUBLE(10,2)                NOT NULL,
    user_id                         INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(money_receipt_no)
);


##########################
##   APPLICATION-FORM   ##
##########################
SELECT 'application_form';
DROP TABLE IF EXISTS application_form;
CREATE TABLE IF NOT EXISTS application_form(
    application_slno                INT(6)                          NOT NULL AUTO_INCREMENT,
    admission_no                    VARCHAR(20),
    student_uid                     VARCHAR(12)                     UNIQUE,
    academic_year                   VARCHAR(10)                     NOT NULL,
    form_no                         VARCHAR(20),
    money_receipt_no                INT(10),
    money_receipt_date              DATE,
    application_date                DATE,
    admission_date                  DATE,
    admission_class                 VARCHAR(30)                     NOT NULL,
    section_code                    CHAR(1),
    student_rollno                  INT(8),
    student_name                    VARCHAR(50)                     NOT NULL,
    student_surname                 VARCHAR(50),
    gender                          ENUM('M','F')                   NOT NULL,
    dob_day                         INT(2)                          NOT NULL,
    dob_month                       INT(2)                          NOT NULL,
    dob_year                        INT(4)                          NOT NULL,
    dob_words                       VARCHAR(200),
    birth_place                     VARCHAR(50),
    age                             INT(2),
    age_year                        INT(2),
    age_month                       INT(2),
    age_days                        INT(2),
    second_language                 VARCHAR(30),
    nationality                     VARCHAR(30),
    religion                        VARCHAR(30),
    denomination                    VARCHAR(30),
    mother_tongue                   VARCHAR(30),
    hobbies                         VARCHAR(200),
    sports                          VARCHAR(200),
    category_abbr                   VARCHAR(50)                     REFERENCES category(category_abbr),
    prev_school                     VARCHAR(100),
    prev_class                      VARCHAR(30),
    prev_tcno                       VARCHAR(30),
    prev_result                     VARCHAR(30),
    prev_total                      INT(4),
    prev_rank                       INT(3),
    prev_mark_pc                    DOUBLE(6,2),
    hist_illness                    VARCHAR(200),
    allergies                       VARCHAR(200),
    blood_group                     VARCHAR(30),
    mother_name                     VARCHAR(50),
    mother_age                      INT(3),
    mother_school                   VARCHAR(50),
    mother_school_place             VARCHAR(50),
    mother_college                  VARCHAR(50),
    mother_college_place            VARCHAR(50),
    mother_category                 VARCHAR(50),
    mother_qualif                   VARCHAR(50),
    mother_prof                     VARCHAR(50),
    mother_designation              VARCHAR(50),
    mother_department               VARCHAR(50),
    mother_ins_org_comp             VARCHAR(50),
    mother_office_address           VARCHAR(200),
    mother_annual_income            INT(8),
    mother_mobile                   VARCHAR(50),
    father_name                     VARCHAR(50),
    father_age                      INT(3),
    father_school                   VARCHAR(50),
    father_school_place             VARCHAR(50),
    father_college                  VARCHAR(50),
    father_college_place            VARCHAR(50),
    father_category                 VARCHAR(50),
    father_qualif                   VARCHAR(50),
    father_prof                     VARCHAR(50),
    father_designation              VARCHAR(50),
    father_department               VARCHAR(50),
    father_ins_org_comp             VARCHAR(50),
    father_office_address           VARCHAR(200),
    father_annual_income            INT(8),
    father_mobile                   VARCHAR(50),
    guardian_name                   VARCHAR(50),
    guardian_qualif                 VARCHAR(50),
    guardian_prof                   VARCHAR(50),
    guardian_address                VARCHAR(200),
    guardian_mobile                 VARCHAR(50),
    permanent_address               VARCHAR(200),
    permanent_village               VARCHAR(50),
    permanent_post                  VARCHAR(50),
    permanent_ps                    VARCHAR(50),
    permanent_dist                  VARCHAR(50),
    permanent_state                 VARCHAR(50),
    permanent_country               VARCHAR(50),
    permanent_pin                   VARCHAR(10),
    permanent_landline_no           VARCHAR(50),
    permanent_mobile                VARCHAR(50),
    present_address                 VARCHAR(200),
    present_village                 VARCHAR(50),
    present_post                    VARCHAR(50),
    present_ps                      VARCHAR(50),
    present_dist                    VARCHAR(50),
    present_state                   VARCHAR(50),
    present_country                 VARCHAR(50),
    present_pin                     VARCHAR(10),
    present_landline_no_1           VARCHAR(50),
    present_landline_no_2           VARCHAR(50),
    present_mobile_1                VARCHAR(50),
    present_mobile_2                VARCHAR(50),
    present_mobile_3                VARCHAR(50),
    present_email_1                 VARCHAR(50),
    present_email_2                 VARCHAR(50),
    hobby                           VARCHAR(100),
    family_total_member             INT(2)              DEFAULT 0,
    family_brother                  INT(2)              DEFAULT 0,
    family_sister                   INT(2)              DEFAULT 0,
    sibling_in_school               ENUM('Y','N')       DEFAULT 'N',
    sibling_name                    VARCHAR(50),
    sibling_class                   VARCHAR(30),
    sibling_section                 CHAR(1),
    staff_child                     ENUM('Y','N')       DEFAULT 'N',
    staff_detail                    VARCHAR(50),
    visitor_name_1                  VARCHAR(50),
    visitor_relationship_1          VARCHAR(50),
    visitor_name_2                  VARCHAR(50),
    visitor_relationship_2          VARCHAR(50),
    alumni_father                   ENUM('Y','N')       DEFAULT 'N',
    alumni_father_year_passing      INT(4),
    alumni_mother                   ENUM('Y','N')       DEFAULT 'N',
    alumni_mother_year_passing      INT(4),
    attach_alumni_certificate       ENUM('Y','N')       DEFAULT 'N',
    single_girl_child               ENUM('Y','N')       DEFAULT 'N',
    have_sister_no_brother          ENUM('Y','N')       DEFAULT 'N',
    school_hostel                   ENUM('Y','N')       DEFAULT 'N',
    bus_facility                    ENUM('Y','N')       DEFAULT 'N',
    declaration                     ENUM('Y','N')       DEFAULT 'Y',
    attach_passport_photo           ENUM('Y','N')       DEFAULT 'Y',
    attach_birth_certificate        ENUM('Y','N')       DEFAULT 'Y',
    attach_tc                       ENUM('Y','N')       DEFAULT 'Y',
    attach_mark_sheet               ENUM('Y','N')       DEFAULT 'Y',
    attach_caste_certificate        ENUM('Y','N')       DEFAULT 'Y',
    attach_original_receipt         ENUM('Y','N')       DEFAULT 'Y',
    sign_mother                     ENUM('Y','N')       DEFAULT 'Y',
    sign_father                     ENUM('Y','N')       DEFAULT 'Y',
    sign_gardian                    ENUM('Y','N')       DEFAULT 'N',
    sign_candidate                  ENUM('Y','N')       DEFAULT 'Y',
    undertaking_sign_mother         ENUM('Y','N')       DEFAULT 'Y',
    undertaking_sign_father         ENUM('Y','N')       DEFAULT 'Y',
    sign_date                       DATE,
    sign_place                      VARCHAR(50),
    principal_name                  VARCHAR(50),
    admission_select                ENUM('Y','N')       DEFAULT 'N',
    admission_confirm               ENUM('Y','N')       DEFAULT 'N',
    status                          ENUM('L','D','C')   DEFAULT NULL,
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(application_slno)
);


######################################
##   APPLICATION-FORM-INOCULATION   ##
######################################
SELECT 'application_form_inoculation';
DROP TABLE IF EXISTS application_form_inoculation;
CREATE TABLE IF NOT EXISTS application_form_inoculation(
    slno                            INT(6)                  NOT NULL AUTO_INCREMENT,
    application_slno                INT(6)                  NOT NULL REFERENCES application_form(application_slno),
    serial_no                       INT(3)                  NOT NULL,
    inoculation_desc                VARCHAR(30)             NOT NULL,
    inoculation_done                ENUM('Y','N')           NOT NULL,
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(slno)
);


#############################################
##   APPLICATION-FORM-PREVIOUS-EDUCATION   ##
#############################################
SELECT 'application_form_previous_education';
DROP TABLE IF EXISTS application_form_previous_education;
CREATE TABLE IF NOT EXISTS application_form_previous_education(
    slno                            INT(6)                  NOT NULL AUTO_INCREMENT,
    application_slno                INT(6)                  NOT NULL REFERENCES application_form(application_slno),
    school_name                     VARCHAR(50)             NOT NULL,
    session                         VARCHAR(10),
    class_desc                      VARCHAR(30),
    rank                            INT(3),
    mark_percentage                 DOUBLE(6,2),
    user_id                         INT(6)                  REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(slno)
);


########################
##   ADMISSION-REGD   ##
########################
SELECT 'admission_regd';
DROP TABLE IF EXISTS admission_regd;
CREATE TABLE IF NOT EXISTS admission_regd(
    admission_slno                  INT(6)                          NOT NULL AUTO_INCREMENT,
    enroll_type                     ENUM('NEW','OLD')               NOT NULL,
    application_slno                INT(6)                          REFERENCES application_form(application_slno),
    admission_no                    VARCHAR(20)                     NOT NULL,
    student_uid                     VARCHAR(12)                     NOT NULL,
    academic_year                   VARCHAR(10)                     NOT NULL,
    form_no                         VARCHAR(20),
    money_receipt_no                INT(10),
    money_receipt_date              DATE,
    application_date                DATE,
    admission_date                  DATE,
    admission_class                 VARCHAR(30)                     NOT NULL,
    section_code                    CHAR(1),
    student_rollno                  INT(8),
    student_name                    VARCHAR(50)                     NOT NULL,
    student_surname                 VARCHAR(50),
    gender                          ENUM('M','F'),
    dob_day                         INT(2),
    dob_month                       INT(2),
    dob_year                        INT(4),
    dob_words                       VARCHAR(200),
    birth_place                     VARCHAR(50),
    age                             INT(2),
    age_year                        INT(2),
    age_month                       INT(2),
    age_days                        INT(2),
    second_language                 VARCHAR(30),
    nationality                     VARCHAR(30),
    religion                        VARCHAR(30),
    denomination                    VARCHAR(30),
    mother_tongue                   VARCHAR(30),
    hobbies                         VARCHAR(200),
    sports                          VARCHAR(200),
    category_abbr                   VARCHAR(50)                     REFERENCES category(category_abbr),
    prev_school                     VARCHAR(100),
    prev_class                      VARCHAR(30),
    prev_tcno                       VARCHAR(15),
    prev_result                     VARCHAR(30),
    prev_rank                       INT(3),
    prev_mark_pc                    DOUBLE(6,2),
    hist_illness                    VARCHAR(200),
    allergies                       VARCHAR(200),
    blood_group                     VARCHAR(30),
    mother_name                     VARCHAR(50),
    mother_school                   VARCHAR(50),
    mother_school_place             VARCHAR(50),
    mother_college                  VARCHAR(50),
    mother_college_place            VARCHAR(50),
    mother_category                 VARCHAR(50),
    mother_qualif                   VARCHAR(50),
    mother_prof                     VARCHAR(50),
    mother_designation              VARCHAR(50),
    mother_department               VARCHAR(50),
    mother_ins_org_comp             VARCHAR(50),
    mother_office_address           VARCHAR(200),
    mother_annual_income            INT(8),
    mother_mobile                   VARCHAR(50),
    father_name                     VARCHAR(50),
    father_school                   VARCHAR(50),
    father_school_place             VARCHAR(50),
    father_college                  VARCHAR(50),
    father_college_place            VARCHAR(50),
    father_category                 VARCHAR(50),
    father_qualif                   VARCHAR(50),
    father_prof                     VARCHAR(50),
    father_designation              VARCHAR(50),
    father_department               VARCHAR(50),
    father_ins_org_comp             VARCHAR(50),
    father_office_address           VARCHAR(200),
    father_annual_income            INT(8),
    father_mobile                   VARCHAR(50),
    guardian_name                   VARCHAR(50),
    guardian_qualif                 VARCHAR(50),
    guardian_prof                   VARCHAR(50),
    guardian_address                VARCHAR(200),
    guardian_mobile                 VARCHAR(50),
    permanent_address               VARCHAR(200),
    permanent_village               VARCHAR(50),
    permanent_post                  VARCHAR(50),
    permanent_ps                    VARCHAR(50),
    permanent_dist                  VARCHAR(50),
    permanent_state                 VARCHAR(50),
    permanent_country               VARCHAR(50),
    permanent_pin                   VARCHAR(10),
    permanent_landline_no           VARCHAR(50),
    permanent_mobile                VARCHAR(50),
    present_address                 VARCHAR(200),
    present_village                 VARCHAR(50),
    present_post                    VARCHAR(50),
    present_ps                      VARCHAR(50),
    present_dist                    VARCHAR(50),
    present_state                   VARCHAR(50),
    present_country                 VARCHAR(50),
    present_pin                     VARCHAR(10),
    present_landline_no_1           VARCHAR(50),
    present_landline_no_2           VARCHAR(50),
    present_mobile_1                VARCHAR(50),
    present_mobile_2                VARCHAR(50),
    present_mobile_3                VARCHAR(50),
    present_email_1                 VARCHAR(50),
    present_email_2                 VARCHAR(50),
    hobby                           VARCHAR(100),
    family_total_member             INT(2),
    family_brother                  INT(2)              DEFAULT 0,
    family_sister                   INT(2)              DEFAULT 0,
    sibling_in_school               ENUM('Y','N')       DEFAULT 'N',
    sibling_name                    VARCHAR(50),
    sibling_class                   VARCHAR(30),
    sibling_section                 CHAR(1),
    staff_child                     ENUM('Y','N')       DEFAULT 'N',
    staff_detail                    VARCHAR(50),
    visitor_name_1                  VARCHAR(50),
    visitor_relationship_1          VARCHAR(50),
    visitor_name_2                  VARCHAR(50),
    visitor_relationship_2          VARCHAR(50),
    alumni_father                   ENUM('Y','N')       DEFAULT 'N',
    alumni_father_year_passing      INT(4),
    alumni_mother                   ENUM('Y','N')       DEFAULT 'N',
    alumni_mother_year_passing      INT(4),
    attach_alumni_certificate       ENUM('Y','N')       DEFAULT 'N',
    single_girl_child               ENUM('Y','N')       DEFAULT 'N',
    have_sister_no_brother          ENUM('Y','N')       DEFAULT 'N',
    school_hostel                   ENUM('Y','N')       DEFAULT 'N',
    bus_facility                    ENUM('Y','N')       DEFAULT 'N',
    declaration                     ENUM('Y','N')       DEFAULT 'Y',
    attach_passport_photo           ENUM('Y','N')       DEFAULT 'Y',
    attach_birth_certificate        ENUM('Y','N')       DEFAULT 'Y',
    attach_tc                       ENUM('Y','N')       DEFAULT 'Y',
    attach_mark_sheet               ENUM('Y','N')       DEFAULT 'Y',
    attach_caste_certificate        ENUM('Y','N')       DEFAULT 'Y',
    attach_original_receipt         ENUM('Y','N')       DEFAULT 'Y',
    sign_mother                     ENUM('Y','N')       DEFAULT 'Y',
    sign_father                     ENUM('Y','N')       DEFAULT 'Y',
    sign_gardian                    ENUM('Y','N')       DEFAULT 'N',
    sign_candidate                  ENUM('Y','N')       DEFAULT 'Y',
    undertaking_sign_mother         ENUM('Y','N')       DEFAULT 'Y',
    undertaking_sign_father         ENUM('Y','N')       DEFAULT 'Y',
    sign_date                       DATE,
    sign_place                      VARCHAR(50),
    status                          ENUM('D','L','C')   DEFAULT NULL,
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(admission_slno)
);
ALTER TABLE admission_regd ADD mother_age INT(3);
ALTER TABLE admission_regd ADD father_age INT(3);
ALTER TABLE admission_regd ADD prev_total INT(4);
ALTER TABLE admission_regd ADD principal_name VARCHAR(50);
#
CREATE INDEX admission_regd_student_uid ON admission_regd(student_uid);
CREATE INDEX admission_regd_admission_no ON admission_regd(admission_no);
CREATE INDEX admission_regd_admission_class_section_rollno ON admission_regd(admission_class,section_code,student_rollno);
#


###############################
##   ADMISSION-REGD-FAMILY   ##
###############################
SELECT 'admission_regd_family';
DROP TABLE IF EXISTS admission_regd_family;
CREATE TABLE IF NOT EXISTS admission_regd_family(
    slno                            INT(6)                  NOT NULL AUTO_INCREMENT,
    bs_slno                         INT(6),
    admission_slno                  INT(6)                  NOT NULL REFERENCES admission_regd(admission_slno),
    admission_no                    VARCHAR(20)             NOT NULL REFERENCES admission_regd(admission_no),
    student_uid                     VARCHAR(12)             NOT NULL REFERENCES admission_regd(student_uid),
    relation                        ENUM('Brother','Sister'),
    name                            VARCHAR(50),
    age                             INT(3),
    school                          VARCHAR(50),
    class                           VARCHAR(30),
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(slno)
);
#


####################################
##   ADMISSION-REGD-INOCULATION   ##
####################################
SELECT 'admission_regd_inoculation';
DROP TABLE IF EXISTS admission_regd_inoculation;
CREATE TABLE IF NOT EXISTS admission_regd_inoculation(
    slno                            INT(6)                  NOT NULL AUTO_INCREMENT,
    student_uid                     VARCHAR(12)             NOT NULL REFERENCES admission_regd(student_uid),
    serial_no                       INT(3)                  NOT NULL,
    inoculation_desc                VARCHAR(30)             NOT NULL,
    inoculation_done                ENUM('Y','N')           NOT NULL,
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(slno)
);


###########################################
##   ADMISSION_REGD-PREVIOUS-EDUCATION   ##
###########################################
SELECT 'admission_regd_previous_education';
DROP TABLE IF EXISTS admission_regd_previous_education;
CREATE TABLE IF NOT EXISTS admission_regd_previous_education(
    slno                            INT(6)                  NOT NULL AUTO_INCREMENT,
    student_uid                     VARCHAR(12)             NOT NULL REFERENCES admission_regd(student_uid),
    school_name                     VARCHAR(50)             NOT NULL,
    session                         VARCHAR(10),
    class_desc                      VARCHAR(30),
    rank                            INT(3),
    mark_percentage                 DOUBLE(6,2),
    user_id                         INT(6)                  REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(slno)
);


#######################
##   STUDENT-PHOTO   ##
#######################
SELECT 'student_photo';
DROP TABLE IF EXISTS student_photo;
CREATE TABLE IF NOT EXISTS student_photo(
    photo_id                        INT(6)              NOT NULL AUTO_INCREMENT,
    admission_no                    VARCHAR(20),
    student_uid                     VARCHAR(12),
    file_location                   VARCHAR(150),
    photo                           LONGBLOB,
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(photo_id)
);
CREATE INDEX student_photo_admission_no ON student_photo(admission_no);
CREATE INDEX student_photo_student_uid ON student_photo(student_uid);


#################
##   STUDENT   ##
#################
SELECT 'student_regd';
DROP TABLE IF EXISTS student_regd;
CREATE TABLE IF NOT EXISTS student_regd(
    admission_slno                  INT(6)                          NOT NULL AUTO_INCREMENT,
    enroll_type                     ENUM('NEW','OLD')               NOT NULL,
    application_slno                INT(6)                          REFERENCES application_form(application_slno),
    admission_no                    VARCHAR(20),
    student_uid                     VARCHAR(12),
    academic_year                   VARCHAR(10)                     NOT NULL,
    form_no                         VARCHAR(20),
    money_receipt_no                INT(10),
    money_receipt_date              DATE,
    application_date                DATE,
    admission_date                  DATE,
    admission_class                 VARCHAR(30)                     NOT NULL,
    section_code                    CHAR(1),
    student_rollno                  INT(8),
    student_name                    VARCHAR(50)                     NOT NULL,
    student_surname                 VARCHAR(50),
    gender                          ENUM('M','F')                   NOT NULL,
    dob_day                         INT(2)                          NOT NULL,
    dob_month                       INT(2)                          NOT NULL,
    dob_year                        INT(4)                          NOT NULL,
    dob_words                       VARCHAR(200),
    birth_place                     VARCHAR(50),
    age                             INT(2),
    age_year                        INT(2),
    age_month                       INT(2),
    age_days                        INT(2),
    second_language                 VARCHAR(30),
    nationality                     VARCHAR(30),
    religion                        VARCHAR(30),
    denomination                    VARCHAR(30),
    mother_tongue                   VARCHAR(30),
    hobbies                         VARCHAR(200),
    sports                          VARCHAR(200),
    category_abbr                   VARCHAR(50)                     REFERENCES category(category_abbr),
    prev_school                     VARCHAR(100),
    prev_class                      VARCHAR(30),
    prev_tcno                       VARCHAR(15),
    prev_result                     VARCHAR(30),
    prev_total                      INT(4),
    prev_rank                       INT(3),
    prev_mark_pc                    DOUBLE(6,2),
    hist_illness                    VARCHAR(200),
    allergies                       VARCHAR(200),
    blood_group                     VARCHAR(30),
    mother_name                     VARCHAR(50),
    mother_age                      INT(3),
    mother_school                   VARCHAR(50),
    mother_school_place             VARCHAR(50),
    mother_college                  VARCHAR(50),
    mother_college_place            VARCHAR(50),
    mother_category                 VARCHAR(50),
    mother_qualif                   VARCHAR(50),
    mother_prof                     VARCHAR(50),
    mother_designation              VARCHAR(50),
    mother_department               VARCHAR(50),
    mother_ins_org_comp             VARCHAR(50),
    mother_office_address           VARCHAR(200),
    mother_annual_income            INT(8),
    mother_mobile                   VARCHAR(50),
    father_name                     VARCHAR(50),
    father_age                      INT(3),
    father_school                   VARCHAR(50),
    father_school_place             VARCHAR(50),
    father_college                  VARCHAR(50),
    father_college_place            VARCHAR(50),
    father_category                 VARCHAR(50),
    father_qualif                   VARCHAR(50),
    father_prof                     VARCHAR(50),
    father_designation              VARCHAR(50),
    father_department               VARCHAR(50),
    father_ins_org_comp             VARCHAR(50),
    father_office_address           VARCHAR(200),
    father_annual_income            INT(8),
    father_mobile                   VARCHAR(50),
    guardian_name                   VARCHAR(50),
    guardian_qualif                 VARCHAR(50),
    guardian_prof                   VARCHAR(50),
    guardian_address                VARCHAR(200),
    guardian_mobile                 VARCHAR(50),
    permanent_address               VARCHAR(200),
    permanent_village               VARCHAR(50),
    permanent_post                  VARCHAR(50),
    permanent_ps                    VARCHAR(50),
    permanent_dist                  VARCHAR(50),
    permanent_state                 VARCHAR(50),
    permanent_country               VARCHAR(50),
    permanent_pin                   VARCHAR(10),
    permanent_landline_no           VARCHAR(50),
    permanent_mobile                VARCHAR(50),
    present_address                 VARCHAR(200),
    present_village                 VARCHAR(50),
    present_post                    VARCHAR(50),
    present_ps                      VARCHAR(50),
    present_dist                    VARCHAR(50),
    present_state                   VARCHAR(50),
    present_country                 VARCHAR(50),
    present_pin                     VARCHAR(10),
    present_landline_no_1           VARCHAR(50),
    present_landline_no_2           VARCHAR(50),
    present_mobile_1                VARCHAR(50),
    present_mobile_2                VARCHAR(50),
    present_mobile_3                VARCHAR(50),
    present_email_1                 VARCHAR(50),
    present_email_2                 VARCHAR(50),
    hobby                           VARCHAR(100),
    family_total_member             INT(2),
    family_brother                  INT(2)              DEFAULT 0,
    family_sister                   INT(2)              DEFAULT 0,
    sibling_in_school               ENUM('Y','N')       DEFAULT 'N',
    sibling_name                    VARCHAR(50),
    sibling_class                   VARCHAR(30),
    sibling_section                 CHAR(1),
    staff_child                     ENUM('Y','N')       DEFAULT 'N',
    staff_detail                    VARCHAR(50),
    visitor_name_1                  VARCHAR(50),
    visitor_relationship_1          VARCHAR(50),
    visitor_name_2                  VARCHAR(50),
    visitor_relationship_2          VARCHAR(50),
    alumni_father                   ENUM('Y','N')       DEFAULT 'N',
    alumni_father_year_passing      INT(4),
    alumni_mother                   ENUM('Y','N')       DEFAULT 'N',
    alumni_mother_year_passing      INT(4),
    attach_alumni_certificate       ENUM('Y','N')       DEFAULT 'N',
    single_girl_child               ENUM('Y','N')       DEFAULT 'N',
    have_sister_no_brother          ENUM('Y','N')       DEFAULT 'N',
    school_hostel                   ENUM('Y','N')       DEFAULT 'N',
    bus_facility                    ENUM('Y','N')       DEFAULT 'N',
    declaration                     ENUM('Y','N')       DEFAULT 'Y',
    attach_passport_photo           ENUM('Y','N')       DEFAULT 'Y',
    attach_birth_certificate        ENUM('Y','N')       DEFAULT 'Y',
    attach_tc                       ENUM('Y','N')       DEFAULT 'Y',
    attach_mark_sheet               ENUM('Y','N')       DEFAULT 'Y',
    attach_caste_certificate        ENUM('Y','N')       DEFAULT 'Y',
    attach_original_receipt         ENUM('Y','N')       DEFAULT 'Y',
    sign_mother                     ENUM('Y','N')       DEFAULT 'Y',
    sign_father                     ENUM('Y','N')       DEFAULT 'Y',
    sign_gardian                    ENUM('Y','N')       DEFAULT 'N',
    sign_candidate                  ENUM('Y','N')       DEFAULT 'Y',
    undertaking_sign_mother         ENUM('Y','N')       DEFAULT 'Y',
    undertaking_sign_father         ENUM('Y','N')       DEFAULT 'Y',
    sign_date                       DATE,
    sign_place                      VARCHAR(50),
    principal_name                  VARCHAR(50),
    status                          ENUM('D','L','C')   DEFAULT NULL,
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(admission_slno)
);
CREATE INDEX student_regd_student_uid ON student_regd(student_uid);
CREATE INDEX student_regd_admission_no ON student_regd(admission_no);
CREATE INDEX student_regd_admission_class_section_rollno ON student_regd(admission_class,section_code,student_rollno);


##########################
##   ROLLNO-ALLOTMENT   ##
##########################
SELECT 'rollno_allotment';
DROP TABLE IF EXISTS rollno_allotment;
CREATE TABLE IF NOT EXISTS rollno_allotment(
    rollno_id                       INT(6)              NOT NULL AUTO_INCREMENT,
    academic_year                   VARCHAR(10)         NOT NULL,
    admission_no                    VARCHAR(20),
    student_uid                     VARCHAR(12),
    class_desc                      VARCHAR(30),
    section_code                    CHAR(1),
    student_rollno                  INT(8),
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(rollno_id)
);
#
CREATE INDEX rollno_allotment_student_uid ON rollno_allotment(student_uid);
CREATE INDEX rollno_allotment_admission_no ON rollno_allotment(admission_no);


#########################
##   CLASS-PROMOTION   ##
#########################
SELECT 'class_promotion';
DROP TABLE IF EXISTS class_promotion;
CREATE TABLE IF NOT EXISTS class_promotion(
    promotion_slno                  INT(6)              NOT NULL AUTO_INCREMENT,
    promotion_date                  DATE,
    academic_year                   VARCHAR(10)         NOT NULL,
    admission_no                    VARCHAR(20)         NOT NULL,
    student_uid                     VARCHAR(12)         NOT NULL,
    class_promoted                  VARCHAR(30)         NOT NULL,
    student_rollno                  INT(8),
    section_code                    CHAR(1),
    status                          ENUM('P','L','D')   DEFAULT NULL,   # L=Left,P=Pass,D=Demoted
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(promotion_slno)
);
#
CREATE INDEX class_promotion_student_uid ON class_promotion(student_uid);
CREATE INDEX class_promotion_admission_no ON class_promotion(admission_no);


####################################
##   TRANSFER-CERTIFICATE-ISSUE   ##
####################################
SELECT 'tc_issue';
DROP TABLE IF EXISTS tc_issue;
CREATE TABLE IF NOT EXISTS tc_issue(
    tc_issue_id                     INT(6)              NOT NULL AUTO_INCREMENT,
    tc_issue_no                     INT(6)              NOT NULL UNIQUE,
    tc_issue_date                   DATE,
    admission_academic_year         VARCHAR(10),
    admission_no                    VARCHAR(20),
    admission_class                 VARCHAR(30),
    student_uid                     VARCHAR(12),
    student_name                    VARCHAR(50),
    father_name                     VARCHAR(50),
    mother_name                     VARCHAR(50),
    date_of_birth                   DATE,
    gender                          ENUM('F','M'),
    current_academic_year           VARCHAR(10),
    current_class                   VARCHAR(30),
    admission_date                  DATE,
    school_leaving_date             DATE,
    conduct_remark                  VARCHAR(100),
    promotion_status                VARCHAR(100),
    prev_school                     VARCHAR(100),
    prev_tcno                       VARCHAR(30),
    issue_authority                 VARCHAR(50),
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(tc_issue_id)
);
#
CREATE INDEX tc_issue_student_uid ON tc_issue(student_uid);
CREATE INDEX tc_issue_admission_no ON tc_issue(admission_no);


###############################
##   SPECIAL-ACTIVITY-LIST   ##
###############################
SELECT 'special_activity_list';
DROP TABLE IF EXISTS special_activity_list;
CREATE TABLE IF NOT EXISTS special_activity_list(
    sp_activity_id                  INT(6)              NOT NULL AUTO_INCREMENT,
    sp_activity_desc                VARCHAR(100)        NOT NULL,
    sp_activity_abbr                VARCHAR(10),
    sp_activity_fees                DOUBLE(8,2)         DEFAULT 0.00,
    academic_year                   VARCHAR(10),
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(sp_activity_id)
);
CREATE INDEX special_activity_list_sp_activity_desc ON special_activity_list(sp_activity_desc);
INSERT INTO `special_activity_list` VALUES
    (1,'Art and Paint (1DS1) 1yr :10-11am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (2,'Art and Paint (2SM1) 1yr : 10-11am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (3,'Art and Paint (3DS2) 1yr : 11-12 noon',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (4,'Art and Paint (4SM2) 1yr : 11-12 noon',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (5,'Art and Paint (5DS3) 2yr : 08-09 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (6,'Art and Paint (6SM3) 2yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (7,'Art and Paint (7DS4) 3yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (8,'Band (1SJ1) 1yr : 08-09 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (9,'Band (2SJ2) 2yr : 10-11 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (10,'Band (3SJ3) 3yr : 11-12 noon',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (11,'Guitar (1EA1) 1yr : 10-11 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (12,'Guitar (2EA2) 2yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (13,'Guitar (3EA3) 3yr : 11-12 noon',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (14,'Hindustani Music (1KP1) 1yr : 08-09 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (15,'Hindustani Music (2KP2) 1yr : 10-11 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (16,'Hindustani Music (3KP3) 2yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (17,'Hindustani Music (4KP4)  3yr : 11-12 noon',NULL,225.00,'04-05',1,'2015-03-03 20:07:00',NULL),
    (18,'Karate (1BM1)  1yr : 08-09 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (19,'Karate (2BM2) 1yr : 08-09 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (20,'Karate (3BM3) 1yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (21,'Karate (4BM4) 2yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (22,'Karate (5BM5) 2yr : 10-11 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (23,'Karate (6BM6) 3yr : 08-09 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (24,'Karate (7BM7) 3yr : 10-11 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (25,'Key Board (1WR1) 1yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (26,'Key Board (2NT1) 1yr : 10-11 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (27,'Key Board (3WR2) 1yr : 11-12 noon',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (28,'Key Board (4WR3) 2yr : 10-11 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (29,'Key Board (5NT2) 2yr : 11-12 noon',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (30,'Key Board (6NT3) 3yr : 08-09 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (31,'Key Board (7NT4) 3yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (32,'Odissi (1SD1) 1yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (33,'Odissi (2SD2) 2yr : 10-11 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (34,'Odissi (3SD3) 3yr : 11-12 noon',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (35,'Soft Toy (1DP1) 1yr : 10-11 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (36,'Soft Toy (2DP2) 2yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (37,'Soft Toy (3DP3) 3yr : 11-12 noon',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (38,'Special Class (STD7) Gp: A',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (39,'Special Class (STD7) Gp: B',NULL,225.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (40,'Special Class (STD8) AE',NULL,600.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (41,'Special Class (STD8) AR',NULL,600.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (42,'Special Class (STD8) BE',NULL,600.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (43,'Special Class (STD8) BR',NULL,600.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (44,'Special Class (STD8) CE',NULL,600.00,'04-05',1,'2015-03-03 20:07:01',NULL),
    (45,'Special Class (STD8) CR',NULL,600.00,'04-05',1,'2015-03-03 20:07:02',NULL),
    (46,'Tabala (1US1) 1yr : 09-10 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:02',NULL),
    (47,'Tabala (2US2)  1yr : 11-12 noon',NULL,225.00,'04-05',1,'2015-03-03 20:07:02',NULL),(48,'Tabala (3US3) 3yr : 10-11 am',NULL,225.00,'04-05',1,'2015-03-03 20:07:02',NULL),(49,'NA',NULL,0.00,'05-06',1,'2015-03-03 20:07:02',NULL),(50,'NA1',NULL,0.00,'05-06',1,'2015-03-03 20:07:02',NULL),(51,'NA2',NULL,0.00,'05-06',1,'2015-03-03 20:07:02',NULL),(52,'NCC',NULL,0.00,'05-06',1,'2015-03-03 20:07:02',NULL),(53,'SA_1(1DS1) : Art and Paint (2yr 10-11am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(54,'SA_10(3SJ3) : Band (4yr 11-12 noon)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(55,'SA_10a(4SJ4) : Band (1yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(56,'SA_11(1EA1) : Guitar (2yr 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(57,'SA_12(2EA2) : Guitar (3yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(58,'SA_13(3EA3) : Guitar (4yr 11-12 noon)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(59,'SA_13a(4EA4) : Guitar (1yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(60,'SA_14(1KP1) : Hindustani Music (2yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(61,'SA_15(2KP2) : Hindustani Music (2yr 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(62,'SA_16(3KP3) : Hindustani Music (3yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(63,'SA_17(4KP4) : Hindustani Music (4yr 11-12 noon)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(64,'SA_17a(5KP5) : Hindustani Music (1yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(65,'SA_18(1BM1) : Karate (2yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(66,'SA_19(2BM2) : Karate (2yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(67,'SA_2(2SM1) : Art and Paint (2yr 10-11am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(68,'SA_20(3BM3) : Karate (2yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(69,'SA_21(4BM4) : Karate (3yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:02',NULL),(70,'SA_22(5BM5) : Karate (3yr 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(71,'SA_23(6BM6) : Karate (4yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(72,'SA_24(7BM7) : Karate (4yr 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(73,'SA_24a(8BM8) : Karate (1yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(74,'SA_25(1WR1) : Key Board (2yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(75,'SA_26(2NT1) : Key Board (2yr 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(76,'SA_27(3WR2) : Key Board (2yr 11-12 noon)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(77,'SA_28(4WR) : Key Board (1yr 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(78,'SA_28(4WR) : Key Board (3yr 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(79,'SA_29(5NT2) : Key Board (3yr 11-12 noon)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(80,'SA_3(3DS2) : Art and Paint (2yr 11-12 noon)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(81,'SA_30(6NT3) : Key Board (4yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(82,'SA_31(7NT4) : Key Board (4yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(83,'SA_31b(4WR) : Key Board (1yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(84,'SA_31c(8NT4) : Key Board (1yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(85,'SA_32(1SD1) : Odissi (2yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(86,'SA_33(2SD2) : Odissi (3yr 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(87,'SA_34(3SD3) : Odissi (4yr 11-12 noon)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(88,'SA_34a(4SD4) : Odissi (1yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(89,'SA_35(1DP1) : Soft Toy (2yr 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(90,'SA_36(2DP2) : Soft Toy (3yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(91,'SA_37(3DP3) : Soft Toy (4yr 11-12 noon)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(92,'SA_37a(4DP4) : Soft Toy (1yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(93,'SA_38(1US1) : Tabala (2yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:03',NULL),(94,'SA_39(2US2) : Tabala (3yr 11-12 noon)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(95,'SA_4(4SM2) : Art and Paint (2yr 11-12 noon)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(96,'SA_40(3US3) : Tabala (4yr : 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(97,'SA_40a(4US4) : Tabala (1yr : 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(98,'SA_41 Special Class (STD7) Gp: A',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(99,'SA_42 Special Class (STD7) Gp: B',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(100,'SA_43 Special Class (STD8) AE',NULL,600.00,'05-06',1,'2015-03-03 20:07:04',NULL),(101,'SA_44 Special Class (STD8) BE',NULL,600.00,'05-06',1,'2015-03-03 20:07:04',NULL),(102,'SA_45 Special Class (STD8) CE',NULL,600.00,'05-06',1,'2015-03-03 20:07:04',NULL),(103,'SA_46 Special Class (STD8) AR',NULL,600.00,'05-06',1,'2015-03-03 20:07:04',NULL),(104,'SA_47 Special Class (STD8) BR',NULL,600.00,'05-06',1,'2015-03-03 20:07:04',NULL),(105,'SA_48 Special Class (STD8) CR',NULL,600.00,'05-06',1,'2015-03-03 20:07:04',NULL),(106,'SA_5(5DS3) : Art and Paint (3yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(107,'SA_6(6DS3) : Art and Paint (3yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(108,'SA_7(7DS4) : Art and Paint (4yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(109,'SA_7a(6SM3) : Art and Paint (1yr 09-10 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(110,'SA_7b(8SM4) : Art and Paint (1yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(111,'SA_8(1SJ1) : Band (2yr 08-09 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(112,'SA_9(2SJ2) : Band (3yr 10-11 am)',NULL,225.00,'05-06',1,'2015-03-03 20:07:04',NULL),(113,'SUPW',NULL,0.00,'05-06',1,'2015-03-03 20:07:04',NULL),(114,'LA_10_Cricket (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:04',NULL),(115,'LA_11_Cricket (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:04',NULL),(116,'LA_12_Cricket (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:04',NULL),(117,'LA_13_Cricket (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(118,'LA_14_Cricket (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(119,'LA_15_Cricket (1st 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(120,'LA_16_Cricket (1st 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(121,'LA_17_TT (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(122,'LA_18_TT (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(123,'LA_19_TT (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(124,'LA_1_Basketball (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(125,'LA_20_TT (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(126,'LA_21_TT (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(127,'LA_22_TT (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(128,'LA_23_TT (1st 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(129,'LA_24_TT (1st 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(130,'LA_25_Chess (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(131,'LA_26_Chess (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(132,'LA_27_Chess (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(133,'LA_28_Chess (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(134,'LA_29_Chess (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(135,'LA_2_Basketball (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(136,'LA_30_Chess (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(137,'LA_31_Football (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(138,'LA_32_Football (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:05',NULL),(139,'LA_33_Football (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(140,'LA_34_Football (1st 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(141,'LA_3_Basketball (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(142,'LA_4_Basketball (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(143,'LA_5_Basketball (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(144,'LA_6_Basketball (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(145,'LA_7_Basketball (1st 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(146,'LA_8_Basketball (1st 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(147,'LA_9_Cricket (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(148,'NA',NULL,0.00,'06-07',1,'2015-03-03 20:07:06',NULL),(149,'NA1',NULL,0.00,'06-07',1,'2015-03-03 20:07:06',NULL),(150,'NA2',NULL,0.00,'06-07',1,'2015-03-03 20:07:06',NULL),(151,'SA_1(DS) : Art and Paint (5yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(152,'SA_10(SM) : Art and Paint (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(153,'SA_11(DS) : Art and Paint (1st 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(154,'SA_12(SM) : Art and Paint (1st 10-11am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(155,'SA_13(SJ) : Band (5yr 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(156,'SA_14(SJ) : Band (4yr 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:06',NULL),(157,'SA_15(SJ) : Band (3yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(158,'SA_16(SJ) : Band (2yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(159,'SA_17(SJ) : Band (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(160,'SA_18(EA) : Guitar (5yr 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(161,'SA_19(EA) : Guitar (4yr 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(162,'SA_2(DS) : Art and Paint (4yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(163,'SA_20(EA) : Guitar (3yr 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(164,'SA_21(EA) : Guitar (2yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(165,'SA_22(EA) : Guitar (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(166,'SA_23(NT) : Key Board (5yr 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(167,'SA_24(NT) : Key Board (4yr 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(168,'SA_25(WR) : Key Board (3yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(169,'SA_26(NT) : Key Board (3yr 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(170,'SA_27(P) : Key Board (3yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(171,'SA_28(NT) : Key Board (2yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(172,'SA_29(P) : Key Board (2yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(173,'SA_3(DS) : Art and Paint (4yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(174,'SA_30(NT) : Key Board (2yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(175,'SA_31(NT) : Key Board (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(176,'SA_32(P) : Key Board (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(177,'SA_33(P) : Key Board (1st 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(178,'SA_34(BM) : Karate (5yr 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:07',NULL),(179,'SA_35(BM) : Karate (5yr 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(180,'SA_36(BM) : Karate (4yr 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(181,'SA_37(BM) : Karate (4yr 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(182,'SA_38(BM) : Karate (3yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(183,'SA_39(BM) : Karate (3yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(184,'SA_4(SM) : Art and Paint (3yr 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(185,'SA_40(BM) : Karate (3yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(186,'SA_41(BM) : Karate (2yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(187,'SA_42(BM) : Karate (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(188,'SA_43(BM) : Karate (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(189,'SA_44(BM) : Karate (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(190,'SA_45(KP) : Hindustani Music (5yr 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(191,'SA_46(KP) : Hindustani Music (4yr 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(192,'SA_47(KP) : Hindustani Music (3yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(193,'SA_48(KP) : Hindustani Music (3yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(194,'SA_49(KP) : Hindustani Music (2yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:08',NULL),(195,'SA_5(SM) : Art and Paint (3yr 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(196,'SA_50(KP) : Hindustani Music (1st 10-11am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(197,'SA_51(SD) : Odissi (5yr 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(198,'SA_52(SD) : Odissi (4yr 11-12 noon)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(199,'SA_53(SD) : Odissi (3yr 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(200,'SA_54(SD) : Odissi (2yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(201,'SA_55(SD) : Odissi (1st 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(202,'SA_56(US) : Tabala (5yr : 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(203,'SA_57(US) : Tabala (4yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(204,'SA_58(US) : Tabala (3yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(205,'SA_59(US) : Tabala (2yr : 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(206,'SA_6(DS) : Art and Paint (3yr 10-11am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(207,'SA_60(US) : Tabala (1st 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(208,'SA_61(DP) : Soft Toy (4yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(209,'SA_62(DP) : Soft Toy (3yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(210,'SA_63(DP) : Soft Toy (2yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:09',NULL),(211,'SA_64(DP) : Soft Toy (1st 10-11 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:10',NULL),(212,'SA_7(DS) : Art and Paint (3yr 10-11am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:10',NULL),(213,'SA_8(DS) : Art and Paint (2yr 09-10 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:10',NULL),(214,'SA_9(SM) : Art and Paint (2yr 08-09 am)',NULL,225.00,'06-07',1,'2015-03-03 20:07:10',NULL),(215,'Special Class (STD7) Gp: A',NULL,0.00,'06-07',1,'2015-03-03 20:07:10',NULL),(216,'Special Class (STD7) Gp: B',NULL,0.00,'06-07',1,'2015-03-03 20:07:11',NULL),(217,'Special Class (STD8) AE',NULL,0.00,'06-07',1,'2015-03-03 20:07:11',NULL),(218,'Special Class (STD8) AR',NULL,0.00,'06-07',1,'2015-03-03 20:07:11',NULL),(219,'Special Class (STD8) BE',NULL,0.00,'06-07',1,'2015-03-03 20:07:11',NULL),(220,'Special Class (STD8) BR',NULL,0.00,'06-07',1,'2015-03-03 20:07:11',NULL),(221,'Special Class (STD8) CE',NULL,0.00,'06-07',1,'2015-03-03 20:07:11',NULL),(222,'Special Class (STD8) CR',NULL,0.00,'06-07',1,'2015-03-03 20:07:11',NULL),(223,'LA_10_Cricket (2yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(224,'LA_11_Cricket (2yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(225,'LA_12_Cricket (2yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(226,'LA_13_Cricket (2yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(227,'LA_14_Cricket (2yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(228,'LA_15_Cricket (2yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(229,'LA_16_Cricket (2yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(230,'LA_17_TT (2yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(231,'LA_18_TT (2yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(232,'LA_19_TT (1yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(233,'LA_1_Basketball (2yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(234,'LA_20_TT (2yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:11',NULL),(235,'LA_21_TT (1yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(236,'LA_22_TT (2yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(237,'LA_23_TT (2yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(238,'LA_24_TT (2yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(239,'LA_25_Chess (2yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(240,'LA_26_Chess (2yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(241,'LA_27_Chess (2yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(242,'LA_28_Chess (2yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(243,'LA_29_Chess (2yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(244,'LA_2_Basketball (2yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(245,'LA_30_Chess (2yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(246,'LA_31_Football (1yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(247,'LA_32_Football (2yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(248,'LA_33_Football (2yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(249,'LA_34_Chess (1yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(250,'LA_35_Chess (1yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(251,'LA_3_Basketball (1yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(252,'LA_4_Basketball (2yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(253,'LA_5_Basketball (2yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(254,'LA_6_Basketball (2yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(255,'LA_7_Basketball (2yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(256,'LA_8_Basketball (2yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(257,'LA_9_Cricket (1yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:12',NULL),(258,'Moden Dance 8-9',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(259,'Modern Dance 10-11 am',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(260,'Modern Dance 11-12 noon',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(261,'Modern Dance 9-10',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(262,'NA',NULL,0.00,'07-08',1,'2015-03-03 20:07:13',NULL),(263,'NA1',NULL,0.00,'07-08',1,'2015-03-03 20:07:13',NULL),(264,'NA2',NULL,0.00,'07-08',1,'2015-03-03 20:07:13',NULL),(265,'SA_1(DS) : Art and Paint (6yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(266,'SA_10(SM) : Art and Paint (2st 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(267,'SA_11(DS) : Art and Paint (2st 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(268,'SA_12(SM) : Art and Paint (2st 10-11am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(269,'SA_13(SJ) : Band (1yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(270,'SA_14(SJ) : Band (5yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(271,'SA_15(SJ) : Band (4yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(272,'SA_16(SJ) : Band (3yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(273,'SA_17(SJ) : Band (2st 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(274,'SA_18(EA) : Guitar (1yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(275,'SA_19(EA) : Guitar (5yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(276,'SA_2(DS) : Art and Paint (5yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(277,'SA_20(EA) : Guitar (4yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:13',NULL),(278,'SA_21(EA) : Guitar (3yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(279,'SA_22(EA) : Guitar (2st 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(280,'SA_23(NT) : Key Board (1yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(281,'SA_24(NT) : Key Board (5yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(282,'SA_25(WR) : Key Board (4yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(283,'SA_26(NT) : Key Board (4yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(284,'SA_27(P) : Key Board (4yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(285,'SA_28(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(286,'SA_29(P) : Key Board (3yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(287,'SA_3(DS) : Art and Paint (1yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(288,'SA_30(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(289,'SA_31(NT) : Key Board (2st 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(290,'SA_32(P) : Key Board (2st 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(291,'SA_33(P) : Key Board (1st 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(292,'SA_34(BM) : Karate (6yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(293,'SA_35(BM) : Karate (1yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:14',NULL),(294,'SA_36(BM) : Karate (5yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(295,'SA_37(BM) : Karate (5yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(296,'SA_38(BM) : Karate (4yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(297,'SA_39(BM) : Karate (4yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(298,'SA_4(SM) : Art and Paint (4yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(299,'SA_40(BM) : Karate (4yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(300,'SA_41(BM) : Karate (3yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(301,'SA_42(BM) : Karate (2st 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(302,'SA_43(BM) : Karate (2st 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(303,'SA_44(BM) : Karate (2st 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(304,'SA_45(KP) : Hindustani Music (1yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(305,'SA_46(KP) : Hindustani Music (5yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(306,'SA_47(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(307,'SA_48(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(308,'SA_49(KP) : Hindustani Music (3yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(309,'SA_5(SM) : Art and Paint (1yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(310,'SA_50(KP) : Hindustani Music (2st 10-11am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(311,'SA_51(SD) : Odissi (6yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(312,'SA_52(SD) : Odissi (5yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(313,'SA_53(SD) : Odissi (4yr 11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:15',NULL),(314,'SA_54(SD) : Odissi (3yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(315,'SA_55(SD) : Odissi (2st 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(316,'SA_56(US) : Tabala (6yr : 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(317,'SA_57(US) : Tabala (5yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(318,'SA_58(US) : Tabala (4yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(319,'SA_59(US) : Tabala (3yr : 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(320,'SA_6(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(321,'SA_60(US) : Tabala (2st 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(322,'SA_61(DP) : Soft Toy (5yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(323,'SA_62(DP) : Soft Toy (4yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(324,'SA_63(DP) : Soft Toy (3yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(325,'SA_64(DP) : Soft Toy (2st 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(326,'SA_65(DP) : Soft Toy (1yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(327,'SA_66(SD) : Odissi (1yr 10-11 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(328,'SA_67(SM) : Art and Paint (1yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(329,'SA_68(DS) : Art and Paint (1yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(330,'SA_69(BS) : Art and  Paint (1yr  11-12 noon)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(331,'SA_7(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(332,'SA_8(DS) : Art and Paint (3yr 09-10 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:16',NULL),(333,'SA_9(SM) : Art and Paint (3yr 08-09 am)',NULL,225.00,'07-08',1,'2015-03-03 20:07:17',NULL),(334,'Special Class (STD7) Gp: A',NULL,0.00,'07-08',1,'2015-03-03 20:07:17',NULL),(335,'Special Class (STD7) Gp: B',NULL,0.00,'07-08',1,'2015-03-03 20:07:17',NULL),(336,'Special Class (STD8) AE',NULL,0.00,'07-08',1,'2015-03-03 20:07:17',NULL),(337,'Special Class (STD8) AR',NULL,0.00,'07-08',1,'2015-03-03 20:07:17',NULL),(338,'Special Class (STD8) BE',NULL,0.00,'07-08',1,'2015-03-03 20:07:17',NULL),(339,'Special Class (STD8) BR',NULL,0.00,'07-08',1,'2015-03-03 20:07:17',NULL),(340,'Special Class (STD8) CE',NULL,0.00,'07-08',1,'2015-03-03 20:07:17',NULL),(341,'Special Class (STD8) CR',NULL,0.00,'07-08',1,'2015-03-03 20:07:17',NULL),(342,'Tabla 8-9 am',NULL,225.00,'07-08',1,'2015-03-03 20:07:17',NULL),(343,'LA_10_Cricket (2yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(344,'LA_11_Cricket (2yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(345,'LA_12_Cricket (2yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(346,'LA_13_Cricket (2yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(347,'LA_14_Cricket (2yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(348,'LA_15_Cricket (2yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(349,'LA_16_Cricket (2yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(350,'LA_17_TT (2yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(351,'LA_18_TT (2yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(352,'LA_19_TT (1yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(353,'LA_1_Basketball (2yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:17',NULL),(354,'LA_20_TT (2yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(355,'LA_21_TT (1yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(356,'LA_22_TT (2yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(357,'LA_23_TT (2yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(358,'LA_24_TT (2yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(359,'LA_25_Chess (2yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(360,'LA_26_Chess (2yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(361,'LA_27_Chess (2yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(362,'LA_28_Chess (2yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(363,'LA_29_Chess (2yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(364,'LA_2_Basketball (2yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(365,'LA_30_Chess (2yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(366,'LA_31_Football (1yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(367,'LA_32_Football (2yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(368,'LA_33_Football (2yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(369,'LA_34_Chess (1yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(370,'LA_35_Chess (1yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(371,'LA_3_Basketball (1yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(372,'LA_4_Basketball (2yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(373,'LA_5_Basketball (2yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:18',NULL),(374,'LA_6_Basketball (2yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(375,'LA_7_Basketball (2yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(376,'LA_8_Basketball (2yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(377,'LA_9_Cricket (1yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(378,'Moden Dance 8-9',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(379,'Modern Dance 10-11 am',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(380,'Modern Dance 11-12 noon',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(381,'Modern Dance 9-10',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(382,'NA',NULL,0.00,'08-09',1,'2015-03-03 20:07:19',NULL),(383,'NA1',NULL,0.00,'08-09',1,'2015-03-03 20:07:19',NULL),(384,'NA2',NULL,0.00,'08-09',1,'2015-03-03 20:07:19',NULL),(385,'SA_1(DS) : Art and Paint (6yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(386,'SA_10(SM) : Art and Paint (2st 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(387,'SA_11(DS) : Art and Paint (2st 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(388,'SA_12(SM) : Art and Paint (2st 10-11am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(389,'SA_13(SJ) : Band (1yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(390,'SA_14(SJ) : Band (5yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(391,'SA_15(SJ) : Band (4yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(392,'SA_16(SJ) : Band (3yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(393,'SA_17(SJ) : Band (2st 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(394,'SA_18(EA) : Guitar (1yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(395,'SA_19(EA) : Guitar (5yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:19',NULL),(396,'SA_2(DS) : Art and Paint (5yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(397,'SA_20(EA) : Guitar (4yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(398,'SA_21(EA) : Guitar (3yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(399,'SA_22(EA) : Guitar (2st 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(400,'SA_23(NT) : Key Board (1yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(401,'SA_24(NT) : Key Board (5yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(402,'SA_25(WR) : Key Board (4yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(403,'SA_26(NT) : Key Board (4yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(404,'SA_27(P) : Key Board (4yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(405,'SA_28(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(406,'SA_29(P) : Key Board (3yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(407,'SA_3(DS) : Art and Paint (1yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:20',NULL),(408,'SA_30(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:21',NULL),(409,'SA_31(NT) : Key Board (2st 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:21',NULL),(410,'SA_32(P) : Key Board (2st 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:21',NULL),(411,'SA_33(P) : Key Board (1st 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:21',NULL),(412,'SA_34(BM) : Karate (6yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:21',NULL),(413,'SA_35(BM) : Karate (1yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:21',NULL),(414,'SA_36(BM) : Karate (5yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(415,'SA_37(BM) : Karate (5yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(416,'SA_38(BM) : Karate (4yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(417,'SA_39(BM) : Karate (4yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(418,'SA_4(SM) : Art and Paint (4yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(419,'SA_40(BM) : Karate (4yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(420,'SA_41(BM) : Karate (3yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(421,'SA_42(BM) : Karate (2st 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(422,'SA_43(BM) : Karate (2st 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(423,'SA_44(BM) : Karate (2st 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(424,'SA_45(KP) : Hindustani Music (1yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(425,'SA_46(KP) : Hindustani Music (5yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(426,'SA_47(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(427,'SA_48(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(428,'SA_49(KP) : Hindustani Music (3yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(429,'SA_5(SM) : Art and Paint (1yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(430,'SA_50(KP) : Hindustani Music (2st 10-11am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:22',NULL),(431,'SA_51(SD) : Odissi (6yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(432,'SA_52(SD) : Odissi (5yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(433,'SA_53(SD) : Odissi (4yr 11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(434,'SA_54(SD) : Odissi (3yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(435,'SA_55(SD) : Odissi (2st 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(436,'SA_56(US) : Tabala (6yr : 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(437,'SA_57(US) : Tabala (5yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(438,'SA_58(US) : Tabala (4yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(439,'SA_59(US) : Tabala (3yr : 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(440,'SA_6(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(441,'SA_60(US) : Tabala (2st 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(442,'SA_61(DP) : Soft Toy (5yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(443,'SA_62(DP) : Soft Toy (4yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(444,'SA_63(DP) : Soft Toy (3yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(445,'SA_64(DP) : Soft Toy (2st 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(446,'SA_65(DP) : Soft Toy (1yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(447,'SA_66(SD) : Odissi (1yr 10-11 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(448,'SA_67(SM) : Art and Paint (1yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(449,'SA_68(DS) : Art and Paint (1yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(450,'SA_69(BS) : Art and  Paint (1yr  11-12 noon)',NULL,225.00,'08-09',1,'2015-03-03 20:07:23',NULL),(451,'SA_7(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:24',NULL),(452,'SA_8(DS) : Art and Paint (3yr 09-10 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:24',NULL),(453,'SA_9(SM) : Art and Paint (3yr 08-09 am)',NULL,225.00,'08-09',1,'2015-03-03 20:07:24',NULL),(454,'Special Class (STD7) Gp: A',NULL,0.00,'08-09',1,'2015-03-03 20:07:24',NULL),(455,'Special Class (STD7) Gp: B',NULL,0.00,'08-09',1,'2015-03-03 20:07:24',NULL),(456,'Special Class (STD8) AE',NULL,0.00,'08-09',1,'2015-03-03 20:07:24',NULL),(457,'Special Class (STD8) AR',NULL,0.00,'08-09',1,'2015-03-03 20:07:24',NULL),(458,'Special Class (STD8) BE',NULL,0.00,'08-09',1,'2015-03-03 20:07:24',NULL),(459,'Special Class (STD8) BR',NULL,0.00,'08-09',1,'2015-03-03 20:07:24',NULL),(460,'Special Class (STD8) CE',NULL,0.00,'08-09',1,'2015-03-03 20:07:24',NULL),(461,'Special Class (STD8) CR',NULL,0.00,'08-09',1,'2015-03-03 20:07:24',NULL),(462,'Tabla 8-9 am',NULL,225.00,'08-09',1,'2015-03-03 20:07:24',NULL),(463,'LA_10_Cricket (2yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:24',NULL),(464,'LA_11_Cricket (2yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:24',NULL),(465,'LA_12_Cricket (2yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:24',NULL),(466,'LA_13_Cricket (2yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(467,'LA_14_Cricket (2yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(468,'LA_15_Cricket (2yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(469,'LA_16_Cricket (2yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(470,'LA_17_TT (2yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(471,'LA_18_TT (2yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(472,'LA_19_TT (1yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(473,'LA_1_Basketball (2yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(474,'LA_20_TT (2yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(475,'LA_21_TT (1yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(476,'LA_22_TT (2yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(477,'LA_23_TT (2yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(478,'LA_24_TT (2yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(479,'LA_25_Chess (2yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(480,'LA_26_Chess (2yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(481,'LA_27_Chess (2yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(482,'LA_28_Chess (2yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(483,'LA_29_Chess (2yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(484,'LA_2_Basketball (2yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(485,'LA_30_Chess (2yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(486,'LA_31_Football (1yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(487,'LA_32_Football (2yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:25',NULL),(488,'LA_33_Football (2yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(489,'LA_34_Chess (1yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(490,'LA_35_Chess (1yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(491,'LA_3_Basketball (1yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(492,'LA_4_Basketball (2yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(493,'LA_5_Basketball (2yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(494,'LA_6_Basketball (2yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(495,'LA_7_Basketball (2yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(496,'LA_8_Basketball (2yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(497,'LA_9_Cricket (1yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(498,'Moden Dance 8-9',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(499,'Modern Dance 10-11 am',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(500,'Modern Dance 11-12 noon',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(501,'Modern Dance 9-10',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(502,'NA',NULL,0.00,'09-10',1,'2015-03-03 20:07:26',NULL),(503,'NA1',NULL,0.00,'09-10',1,'2015-03-03 20:07:26',NULL),(504,'NA2',NULL,0.00,'09-10',1,'2015-03-03 20:07:26',NULL),(505,'SA_1(DS) : Art and Paint (6yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(506,'SA_10(SM) : Art and Paint (2st 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(507,'SA_11(DS) : Art and Paint (2st 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(508,'SA_12(SM) : Art and Paint (2st 10-11am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(509,'SA_13(SJ) : Band (1yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(510,'SA_14(SJ) : Band (5yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:26',NULL),(511,'SA_15(SJ) : Band (4yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(512,'SA_16(SJ) : Band (3yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(513,'SA_17(SJ) : Band (2st 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(514,'SA_18(EA) : Guitar (1yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(515,'SA_19(EA) : Guitar (5yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(516,'SA_2(DS) : Art and Paint (5yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(517,'SA_20(EA) : Guitar (4yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(518,'SA_21(EA) : Guitar (3yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(519,'SA_22(EA) : Guitar (2st 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(520,'SA_23(NT) : Key Board (1yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(521,'SA_24(NT) : Key Board (5yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(522,'SA_25(WR) : Key Board (4yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(523,'SA_26(NT) : Key Board (4yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(524,'SA_27(P) : Key Board (4yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(525,'SA_28(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(526,'SA_29(P) : Key Board (3yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(527,'SA_3(DS) : Art and Paint (1yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(528,'SA_30(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(529,'SA_31(NT) : Key Board (2st 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(530,'SA_32(P) : Key Board (2st 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(531,'SA_33(P) : Key Board (1st 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(532,'SA_34(BM) : Karate (6yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:27',NULL),(533,'SA_35(BM) : Karate (1yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(534,'SA_36(BM) : Karate (5yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(535,'SA_37(BM) : Karate (5yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(536,'SA_38(BM) : Karate (4yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(537,'SA_39(BM) : Karate (4yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(538,'SA_4(SM) : Art and Paint (4yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(539,'SA_40(BM) : Karate (4yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(540,'SA_41(BM) : Karate (3yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(541,'SA_42(BM) : Karate (2st 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(542,'SA_43(BM) : Karate (2st 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(543,'SA_44(BM) : Karate (2st 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(544,'SA_45(KP) : Hindustani Music (1yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(545,'SA_46(KP) : Hindustani Music (5yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(546,'SA_47(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(547,'SA_48(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(548,'SA_49(KP) : Hindustani Music (3yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(549,'SA_5(SM) : Art and Paint (1yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(550,'SA_50(KP) : Hindustani Music (2st 10-11am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(551,'SA_51(SD) : Odissi (6yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(552,'SA_52(SD) : Odissi (5yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(553,'SA_53(SD) : Odissi (4yr 11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(554,'SA_54(SD) : Odissi (3yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(555,'SA_55(SD) : Odissi (2st 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:28',NULL),(556,'SA_56(US) : Tabala (6yr : 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(557,'SA_57(US) : Tabala (5yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(558,'SA_58(US) : Tabala (4yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(559,'SA_59(US) : Tabala (3yr : 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(560,'SA_6(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(561,'SA_60(US) : Tabala (2st 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(562,'SA_61(DP) : Soft Toy (5yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(563,'SA_62(DP) : Soft Toy (4yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(564,'SA_63(DP) : Soft Toy (3yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(565,'SA_64(DP) : Soft Toy (2st 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(566,'SA_65(DP) : Soft Toy (1yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(567,'SA_66(SD) : Odissi (1yr 10-11 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(568,'SA_67(SM) : Art and Paint (1yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(569,'SA_68(DS) : Art and Paint (1yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(570,'SA_69(BS) : Art and  Paint (1yr  11-12 noon)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(571,'SA_7(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(572,'SA_8(DS) : Art and Paint (3yr 09-10 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(573,'SA_9(SM) : Art and Paint (3yr 08-09 am)',NULL,225.00,'09-10',1,'2015-03-03 20:07:29',NULL),(574,'Special Class (STD7) Gp: A',NULL,0.00,'09-10',1,'2015-03-03 20:07:29',NULL),(575,'Special Class (STD7) Gp: B',NULL,0.00,'09-10',1,'2015-03-03 20:07:29',NULL),(576,'Special Class (STD8) AE',NULL,0.00,'09-10',1,'2015-03-03 20:07:29',NULL),(577,'Special Class (STD8) AR',NULL,0.00,'09-10',1,'2015-03-03 20:07:30',NULL),(578,'Special Class (STD8) BE',NULL,0.00,'09-10',1,'2015-03-03 20:07:30',NULL),(579,'Special Class (STD8) BR',NULL,0.00,'09-10',1,'2015-03-03 20:07:30',NULL),(580,'Special Class (STD8) CE',NULL,0.00,'09-10',1,'2015-03-03 20:07:30',NULL),(581,'Special Class (STD8) CR',NULL,0.00,'09-10',1,'2015-03-03 20:07:30',NULL),(582,'Tabla 8-9 am',NULL,225.00,'09-10',1,'2015-03-03 20:07:30',NULL),(583,'LA_10_Cricket (2yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(584,'LA_11_Cricket (2yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(585,'LA_12_Cricket (2yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(586,'LA_13_Cricket (2yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(587,'LA_14_Cricket (2yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(588,'LA_15_Cricket (2yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(589,'LA_16_Cricket (2yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(590,'LA_17_TT (2yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(591,'LA_18_TT (2yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(592,'LA_19_TT (1yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(593,'LA_1_Basketball (2yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:30',NULL),(594,'LA_20_TT (2yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(595,'LA_21_TT (1yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(596,'LA_22_TT (2yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(597,'LA_23_TT (2yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(598,'LA_24_TT (2yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(599,'LA_25_Chess (2yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(600,'LA_26_Chess (2yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(601,'LA_27_Chess (2yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(602,'LA_28_Chess (2yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(603,'LA_29_Chess (2yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(604,'LA_2_Basketball (2yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(605,'LA_30_Chess (2yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(606,'LA_31_Football (1yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(607,'LA_32_Football (2yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(608,'LA_33_Football (2yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(609,'LA_34_Chess (1yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:31',NULL),(610,'LA_35_Chess (1yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:32',NULL),(611,'LA_3_Basketball (1yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:32',NULL),(612,'LA_4_Basketball (2yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:32',NULL),(613,'LA_5_Basketball (2yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:32',NULL),(614,'LA_6_Basketball (2yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:32',NULL),(615,'LA_7_Basketball (2yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:32',NULL),(616,'LA_8_Basketball (2yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:32',NULL),(617,'LA_9_Cricket (1yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:32',NULL),(618,'Moden Dance 8-9',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(619,'Modern Dance 10-11 am',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(620,'Modern Dance 11-12 noon',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(621,'Modern Dance 9-10',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(622,'NA',NULL,0.00,'10-11',1,'2015-03-03 20:07:33',NULL),(623,'NA1',NULL,0.00,'10-11',1,'2015-03-03 20:07:33',NULL),(624,'NA2',NULL,0.00,'10-11',1,'2015-03-03 20:07:33',NULL),(625,'SA_1(DS) : Art and Paint (6yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(626,'SA_10(SM) : Art and Paint (2st 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(627,'SA_11(DS) : Art and Paint (2st 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(628,'SA_12(SM) : Art and Paint (2st 10-11am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(629,'SA_13(SJ) : Band (1yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(630,'SA_14(SJ) : Band (5yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(631,'SA_15(SJ) : Band (4yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(632,'SA_16(SJ) : Band (3yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(633,'SA_17(SJ) : Band (2st 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(634,'SA_18(EA) : Guitar (1yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(635,'SA_19(EA) : Guitar (5yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(636,'SA_2(DS) : Art and Paint (5yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(637,'SA_20(EA) : Guitar (4yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(638,'SA_21(EA) : Guitar (3yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(639,'SA_22(EA) : Guitar (2st 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(640,'SA_23(NT) : Key Board (1yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:33',NULL),(641,'SA_24(NT) : Key Board (5yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(642,'SA_25(WR) : Key Board (4yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(643,'SA_26(NT) : Key Board (4yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(644,'SA_27(P) : Key Board (4yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(645,'SA_28(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(646,'SA_29(P) : Key Board (3yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(647,'SA_3(DS) : Art and Paint (1yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(648,'SA_30(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(649,'SA_31(NT) : Key Board (2st 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(650,'SA_32(P) : Key Board (2st 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(651,'SA_33(P) : Key Board (1st 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(652,'SA_34(BM) : Karate (6yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(653,'SA_35(BM) : Karate (1yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(654,'SA_36(BM) : Karate (5yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(655,'SA_37(BM) : Karate (5yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(656,'SA_38(BM) : Karate (4yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(657,'SA_39(BM) : Karate (4yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(658,'SA_4(SM) : Art and Paint (4yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(659,'SA_40(BM) : Karate (4yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:34',NULL),(660,'SA_41(BM) : Karate (3yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(661,'SA_42(BM) : Karate (2st 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(662,'SA_43(BM) : Karate (2st 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(663,'SA_44(BM) : Karate (2st 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(664,'SA_45(KP) : Hindustani Music (1yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(665,'SA_46(KP) : Hindustani Music (5yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(666,'SA_47(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(667,'SA_48(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(668,'SA_49(KP) : Hindustani Music (3yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(669,'SA_5(SM) : Art and Paint (1yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(670,'SA_50(KP) : Hindustani Music (2st 10-11am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(671,'SA_51(SD) : Odissi (6yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(672,'SA_52(SD) : Odissi (5yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(673,'SA_53(SD) : Odissi (4yr 11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(674,'SA_54(SD) : Odissi (3yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(675,'SA_55(SD) : Odissi (2st 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(676,'SA_56(US) : Tabala (6yr : 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:35',NULL),(677,'SA_57(US) : Tabala (5yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(678,'SA_58(US) : Tabala (4yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(679,'SA_59(US) : Tabala (3yr : 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(680,'SA_6(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(681,'SA_60(US) : Tabala (2st 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(682,'SA_61(DP) : Soft Toy (5yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(683,'SA_62(DP) : Soft Toy (4yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(684,'SA_63(DP) : Soft Toy (3yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(685,'SA_64(DP) : Soft Toy (2st 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(686,'SA_65(DP) : Soft Toy (1yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(687,'SA_66(SD) : Odissi (1yr 10-11 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(688,'SA_67(SM) : Art and Paint (1yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(689,'SA_68(DS) : Art and Paint (1yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(690,'SA_69(BS) : Art and  Paint (1yr  11-12 noon)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(691,'SA_7(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(692,'SA_8(DS) : Art and Paint (3yr 09-10 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(693,'SA_9(SM) : Art and Paint (3yr 08-09 am)',NULL,225.00,'10-11',1,'2015-03-03 20:07:36',NULL),(694,'Special Class (STD7) Gp: A',NULL,0.00,'10-11',1,'2015-03-03 20:07:36',NULL),(695,'Special Class (STD7) Gp: B',NULL,0.00,'10-11',1,'2015-03-03 20:07:36',NULL),(696,'Special Class (STD8) AE',NULL,0.00,'10-11',1,'2015-03-03 20:07:36',NULL),(697,'Special Class (STD8) AR',NULL,0.00,'10-11',1,'2015-03-03 20:07:36',NULL),(698,'Special Class (STD8) BE',NULL,0.00,'10-11',1,'2015-03-03 20:07:37',NULL),(699,'Special Class (STD8) BR',NULL,0.00,'10-11',1,'2015-03-03 20:07:37',NULL),(700,'Special Class (STD8) CE',NULL,0.00,'10-11',1,'2015-03-03 20:07:37',NULL),(701,'Special Class (STD8) CR',NULL,0.00,'10-11',1,'2015-03-03 20:07:37',NULL),(702,'Tabla 8-9 am',NULL,225.00,'10-11',1,'2015-03-03 20:07:37',NULL),(703,'LA_10_Cricket (2yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(704,'LA_11_Cricket (2yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(705,'LA_12_Cricket (2yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(706,'LA_13_Cricket (2yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(707,'LA_14_Cricket (2yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(708,'LA_15_Cricket (2yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(709,'LA_16_Cricket (2yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(710,'LA_17_TT (2yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(711,'LA_18_TT (2yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(712,'LA_19_TT (1yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(713,'LA_1_Basketball (2yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(714,'LA_20_TT (2yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(715,'LA_21_TT (1yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(716,'LA_22_TT (2yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(717,'LA_23_TT (2yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(718,'LA_24_TT (2yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(719,'LA_25_Chess (2yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:37',NULL),(720,'LA_26_Chess (2yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(721,'LA_27_Chess (2yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(722,'LA_28_Chess (2yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(723,'LA_29_Chess (2yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(724,'LA_2_Basketball (2yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(725,'LA_30_Chess (2yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(726,'LA_31_Football (1yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(727,'LA_32_Football (2yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(728,'LA_33_Football (2yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(729,'LA_34_Chess (1yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(730,'LA_35_Chess (1yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(731,'LA_3_Basketball (1yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(732,'LA_4_Basketball (2yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(733,'LA_5_Basketball (2yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(734,'LA_6_Basketball (2yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(735,'LA_7_Basketball (2yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(736,'LA_8_Basketball (2yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(737,'LA_9_Cricket (1yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(738,'Moden Dance 8-9',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(739,'Modern Dance 10-11 am',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(740,'Modern Dance 11-12 noon',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(741,'Modern Dance 9-10',NULL,225.00,'11-12',1,'2015-03-03 20:07:38',NULL),(742,'NA',NULL,0.00,'11-12',1,'2015-03-03 20:07:39',NULL),(743,'NA1',NULL,0.00,'11-12',1,'2015-03-03 20:07:39',NULL),(744,'NA2',NULL,0.00,'11-12',1,'2015-03-03 20:07:39',NULL),(745,'SA_1(DS) : Art and Paint (6yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(746,'SA_10(SM) : Art and Paint (2st 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(747,'SA_11(DS) : Art and Paint (2st 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(748,'SA_12(SM) : Art and Paint (2st 10-11am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(749,'SA_13(SJ) : Band (1yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(750,'SA_14(SJ) : Band (5yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(751,'SA_15(SJ) : Band (4yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(752,'SA_16(SJ) : Band (3yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(753,'SA_17(SJ) : Band (2st 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(754,'SA_18(EA) : Guitar (1yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(755,'SA_19(EA) : Guitar (5yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(756,'SA_2(DS) : Art and Paint (5yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(757,'SA_20(EA) : Guitar (4yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:39',NULL),(758,'SA_21(EA) : Guitar (3yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(759,'SA_22(EA) : Guitar (2st 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(760,'SA_23(NT) : Key Board (1yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(761,'SA_24(NT) : Key Board (5yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(762,'SA_25(WR) : Key Board (4yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(763,'SA_26(NT) : Key Board (4yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(764,'SA_27(P) : Key Board (4yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(765,'SA_28(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(766,'SA_29(P) : Key Board (3yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(767,'SA_3(DS) : Art and Paint (1yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(768,'SA_30(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(769,'SA_31(NT) : Key Board (2st 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(770,'SA_32(P) : Key Board (2st 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(771,'SA_33(P) : Key Board (1st 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(772,'SA_34(BM) : Karate (6yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(773,'SA_35(BM) : Karate (1yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:40',NULL),(774,'SA_36(BM) : Karate (5yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(775,'SA_37(BM) : Karate (5yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(776,'SA_38(BM) : Karate (4yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(777,'SA_39(BM) : Karate (4yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(778,'SA_4(SM) : Art and Paint (4yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(779,'SA_40(BM) : Karate (4yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(780,'SA_41(BM) : Karate (3yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(781,'SA_42(BM) : Karate (2st 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(782,'SA_43(BM) : Karate (2st 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(783,'SA_44(BM) : Karate (2st 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(784,'SA_45(KP) : Hindustani Music (1yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(785,'SA_46(KP) : Hindustani Music (5yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(786,'SA_47(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(787,'SA_48(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(788,'SA_49(KP) : Hindustani Music (3yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(789,'SA_5(SM) : Art and Paint (1yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(790,'SA_50(KP) : Hindustani Music (2st 10-11am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(791,'SA_51(SD) : Odissi (6yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(792,'SA_52(SD) : Odissi (5yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(793,'SA_53(SD) : Odissi (4yr 11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(794,'SA_54(SD) : Odissi (3yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(795,'SA_55(SD) : Odissi (2st 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(796,'SA_56(US) : Tabala (6yr : 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(797,'SA_57(US) : Tabala (5yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:41',NULL),(798,'SA_58(US) : Tabala (4yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(799,'SA_59(US) : Tabala (3yr : 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(800,'SA_6(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(801,'SA_60(US) : Tabala (2st 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(802,'SA_61(DP) : Soft Toy (5yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(803,'SA_62(DP) : Soft Toy (4yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(804,'SA_63(DP) : Soft Toy (3yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(805,'SA_64(DP) : Soft Toy (2st 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(806,'SA_65(DP) : Soft Toy (1yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(807,'SA_66(SD) : Odissi (1yr 10-11 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(808,'SA_67(SM) : Art and Paint (1yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(809,'SA_68(DS) : Art and Paint (1yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(810,'SA_69(BS) : Art and  Paint (1yr  11-12 noon)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(811,'SA_7(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(812,'SA_8(DS) : Art and Paint (3yr 09-10 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(813,'SA_9(SM) : Art and Paint (3yr 08-09 am)',NULL,225.00,'11-12',1,'2015-03-03 20:07:42',NULL),(814,'Special Class (STD7) Gp: A',NULL,0.00,'11-12',1,'2015-03-03 20:07:43',NULL),(815,'Special Class (STD7) Gp: B',NULL,0.00,'11-12',1,'2015-03-03 20:07:43',NULL),(816,'Special Class (STD8) AE',NULL,0.00,'11-12',1,'2015-03-03 20:07:43',NULL),(817,'Special Class (STD8) AR',NULL,0.00,'11-12',1,'2015-03-03 20:07:43',NULL),(818,'Special Class (STD8) BE',NULL,0.00,'11-12',1,'2015-03-03 20:07:43',NULL),(819,'Special Class (STD8) BR',NULL,0.00,'11-12',1,'2015-03-03 20:07:43',NULL),(820,'Special Class (STD8) CE',NULL,0.00,'11-12',1,'2015-03-03 20:07:43',NULL),(821,'Special Class (STD8) CR',NULL,0.00,'11-12',1,'2015-03-03 20:07:43',NULL),(822,'Tabla 8-9 am',NULL,225.00,'11-12',1,'2015-03-03 20:07:43',NULL),(823,'LA_10_Cricket (2yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:43',NULL),(824,'LA_11_Cricket (2yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:43',NULL),(825,'LA_12_Cricket (2yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(826,'LA_13_Cricket (2yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(827,'LA_14_Cricket (2yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(828,'LA_15_Cricket (2yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(829,'LA_16_Cricket (2yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(830,'LA_17_TT (2yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(831,'LA_18_TT (2yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(832,'LA_19_TT (1yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(833,'LA_1_Basketball (2yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(834,'LA_20_TT (2yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(835,'LA_21_TT (1yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(836,'LA_22_TT (2yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(837,'LA_23_TT (2yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(838,'LA_24_TT (2yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(839,'LA_25_Chess (2yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(840,'LA_26_Chess (2yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(841,'LA_27_Chess (2yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(842,'LA_28_Chess (2yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(843,'LA_29_Chess (2yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(844,'LA_2_Basketball (2yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(845,'LA_30_Chess (2yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(846,'LA_31_Football (1yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:44',NULL),(847,'LA_32_Football (2yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(848,'LA_33_Football (2yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(849,'LA_34_Chess (1yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(850,'LA_35_Chess (1yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(851,'LA_3_Basketball (1yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(852,'LA_4_Basketball (2yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(853,'LA_5_Basketball (2yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(854,'LA_6_Basketball (2yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(855,'LA_7_Basketball (2yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(856,'LA_8_Basketball (2yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(857,'LA_9_Cricket (1yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(858,'Moden Dance 8-9',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(859,'Modern Dance 10-11 am',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(860,'Modern Dance 11-12 noon',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(861,'Modern Dance 9-10',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(862,'NA',NULL,0.00,'12-13',1,'2015-03-03 20:07:45',NULL),(863,'NA1',NULL,0.00,'12-13',1,'2015-03-03 20:07:45',NULL),(864,'NA2',NULL,0.00,'12-13',1,'2015-03-03 20:07:45',NULL),(865,'SA_1(DS) : Art and Paint (6yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(866,'SA_10(SM) : Art and Paint (2st 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(867,'SA_11(DS) : Art and Paint (2st 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(868,'SA_12(SM) : Art and Paint (2st 10-11am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(869,'SA_13(SJ) : Band (1yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:45',NULL),(870,'SA_14(SJ) : Band (5yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(871,'SA_15(SJ) : Band (4yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(872,'SA_16(SJ) : Band (3yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(873,'SA_17(SJ) : Band (2st 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(874,'SA_18(EA) : Guitar (1yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(875,'SA_19(EA) : Guitar (5yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(876,'SA_2(DS) : Art and Paint (5yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(877,'SA_20(EA) : Guitar (4yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(878,'SA_21(EA) : Guitar (3yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(879,'SA_22(EA) : Guitar (2st 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(880,'SA_23(NT) : Key Board (1yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(881,'SA_24(NT) : Key Board (5yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(882,'SA_25(WR) : Key Board (4yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(883,'SA_26(NT) : Key Board (4yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(884,'SA_27(P) : Key Board (4yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(885,'SA_28(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(886,'SA_29(P) : Key Board (3yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(887,'SA_3(DS) : Art and Paint (1yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(888,'SA_30(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(889,'SA_31(NT) : Key Board (2st 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(890,'SA_32(P) : Key Board (2st 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(891,'SA_33(P) : Key Board (1st 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:46',NULL),(892,'SA_34(BM) : Karate (6yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(893,'SA_35(BM) : Karate (1yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(894,'SA_36(BM) : Karate (5yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(895,'SA_37(BM) : Karate (5yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(896,'SA_38(BM) : Karate (4yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(897,'SA_39(BM) : Karate (4yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(898,'SA_4(SM) : Art and Paint (4yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(899,'SA_40(BM) : Karate (4yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(900,'SA_41(BM) : Karate (3yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(901,'SA_42(BM) : Karate (2st 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(902,'SA_43(BM) : Karate (2st 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(903,'SA_44(BM) : Karate (2st 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(904,'SA_45(KP) : Hindustani Music (1yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(905,'SA_46(KP) : Hindustani Music (5yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(906,'SA_47(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(907,'SA_48(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(908,'SA_49(KP) : Hindustani Music (3yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(909,'SA_5(SM) : Art and Paint (1yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(910,'SA_50(KP) : Hindustani Music (2st 10-11am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(911,'SA_51(SD) : Odissi (6yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(912,'SA_52(SD) : Odissi (5yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(913,'SA_53(SD) : Odissi (4yr 11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(914,'SA_54(SD) : Odissi (3yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:47',NULL),(915,'SA_55(SD) : Odissi (2st 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(916,'SA_56(US) : Tabala (6yr : 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(917,'SA_57(US) : Tabala (5yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(918,'SA_58(US) : Tabala (4yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(919,'SA_59(US) : Tabala (3yr : 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(920,'SA_6(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(921,'SA_60(US) : Tabala (2st 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(922,'SA_61(DP) : Soft Toy (5yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(923,'SA_62(DP) : Soft Toy (4yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(924,'SA_63(DP) : Soft Toy (3yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(925,'SA_64(DP) : Soft Toy (2st 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(926,'SA_65(DP) : Soft Toy (1yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(927,'SA_66(SD) : Odissi (1yr 10-11 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(928,'SA_67(SM) : Art and Paint (1yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(929,'SA_68(DS) : Art and Paint (1yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(930,'SA_69(BS) : Art and  Paint (1yr  11-12 noon)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(931,'SA_7(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(932,'SA_8(DS) : Art and Paint (3yr 09-10 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:48',NULL),(933,'SA_9(SM) : Art and Paint (3yr 08-09 am)',NULL,225.00,'12-13',1,'2015-03-03 20:07:49',NULL),(934,'Special Class (STD7) Gp: A',NULL,0.00,'12-13',1,'2015-03-03 20:07:49',NULL),(935,'Special Class (STD7) Gp: B',NULL,0.00,'12-13',1,'2015-03-03 20:07:49',NULL),(936,'Special Class (STD8) AE',NULL,0.00,'12-13',1,'2015-03-03 20:07:49',NULL),(937,'Special Class (STD8) AR',NULL,0.00,'12-13',1,'2015-03-03 20:07:49',NULL),(938,'Special Class (STD8) BE',NULL,0.00,'12-13',1,'2015-03-03 20:07:49',NULL),(939,'Special Class (STD8) BR',NULL,0.00,'12-13',1,'2015-03-03 20:07:49',NULL),(940,'Special Class (STD8) CE',NULL,0.00,'12-13',1,'2015-03-03 20:07:49',NULL),(941,'Special Class (STD8) CR',NULL,0.00,'12-13',1,'2015-03-03 20:07:49',NULL),(942,'Tabla 8-9 am',NULL,225.00,'12-13',1,'2015-03-03 20:07:49',NULL),(943,'LA_10_Cricket (2yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:49',NULL),(944,'LA_11_Cricket (2yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:49',NULL),(945,'LA_12_Cricket (2yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:49',NULL),(946,'LA_13_Cricket (2yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:49',NULL),(947,'LA_14_Cricket (2yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:49',NULL),(948,'LA_15_Cricket (2yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:49',NULL),(949,'LA_16_Cricket (2yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:49',NULL),(950,'LA_17_TT (2yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:49',NULL),(951,'LA_18_TT (2yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(952,'LA_19_TT (1yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(953,'LA_1_Basketball (2yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(954,'LA_20_TT (2yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(955,'LA_21_TT (1yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(956,'LA_22_TT (2yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(957,'LA_23_TT (2yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(958,'LA_24_TT (2yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(959,'LA_25_Chess (2yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(960,'LA_26_Chess (2yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(961,'LA_27_Chess (2yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(962,'LA_28_Chess (2yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(963,'LA_29_Chess (2yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(964,'LA_2_Basketball (2yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(965,'LA_30_Chess (2yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(966,'LA_31_Football (1yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:50',NULL),(967,'LA_32_Football (2yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(968,'LA_33_Football (2yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(969,'LA_34_Chess (1yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(970,'LA_35_Chess (1yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(971,'LA_3_Basketball (1yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(972,'LA_4_Basketball (2yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(973,'LA_5_Basketball (2yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(974,'LA_6_Basketball (2yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(975,'LA_7_Basketball (2yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(976,'LA_8_Basketball (2yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(977,'LA_9_Cricket (1yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(978,'Moden Dance 8-9',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(979,'Modern Dance 10-11 am',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(980,'Modern Dance 11-12 noon',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(981,'Modern Dance 9-10',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(982,'NA',NULL,0.00,'13-14',1,'2015-03-03 20:07:51',NULL),(983,'NA1',NULL,0.00,'13-14',1,'2015-03-03 20:07:51',NULL),(984,'NA2',NULL,0.00,'13-14',1,'2015-03-03 20:07:51',NULL),(985,'SA_1(DS) : Art and Paint (6yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(986,'SA_10(SM) : Art and Paint (2st 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:51',NULL),(987,'SA_11(DS) : Art and Paint (2st 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(988,'SA_12(SM) : Art and Paint (2st 10-11am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(989,'SA_13(SJ) : Band (1yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(990,'SA_14(SJ) : Band (5yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(991,'SA_15(SJ) : Band (4yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(992,'SA_16(SJ) : Band (3yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(993,'SA_17(SJ) : Band (2st 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(994,'SA_18(EA) : Guitar (1yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(995,'SA_19(EA) : Guitar (5yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(996,'SA_2(DS) : Art and Paint (5yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(997,'SA_20(EA) : Guitar (4yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(998,'SA_21(EA) : Guitar (3yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(999,'SA_22(EA) : Guitar (2st 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1000,'SA_23(NT) : Key Board (1yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1001,'SA_24(NT) : Key Board (5yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1002,'SA_25(WR) : Key Board (4yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1003,'SA_26(NT) : Key Board (4yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1004,'SA_27(P) : Key Board (4yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1005,'SA_28(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1006,'SA_29(P) : Key Board (3yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1007,'SA_3(DS) : Art and Paint (1yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1008,'SA_30(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1009,'SA_31(NT) : Key Board (2st 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:52',NULL),(1010,'SA_32(P) : Key Board (2st 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1011,'SA_33(P) : Key Board (1st 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1012,'SA_34(BM) : Karate (6yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1013,'SA_35(BM) : Karate (1yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1014,'SA_36(BM) : Karate (5yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1015,'SA_37(BM) : Karate (5yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1016,'SA_38(BM) : Karate (4yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1017,'SA_39(BM) : Karate (4yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1018,'SA_4(SM) : Art and Paint (4yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1019,'SA_40(BM) : Karate (4yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1020,'SA_41(BM) : Karate (3yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1021,'SA_42(BM) : Karate (2st 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1022,'SA_43(BM) : Karate (2st 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:53',NULL),(1023,'SA_44(BM) : Karate (2st 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1024,'SA_45(KP) : Hindustani Music (1yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1025,'SA_46(KP) : Hindustani Music (5yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1026,'SA_47(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1027,'SA_48(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1028,'SA_49(KP) : Hindustani Music (3yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1029,'SA_5(SM) : Art and Paint (1yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1030,'SA_50(KP) : Hindustani Music (2st 10-11am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1031,'SA_51(SD) : Odissi (6yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1032,'SA_52(SD) : Odissi (5yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1033,'SA_53(SD) : Odissi (4yr 11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1034,'SA_54(SD) : Odissi (3yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1035,'SA_55(SD) : Odissi (2st 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1036,'SA_56(US) : Tabala (6yr : 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1037,'SA_57(US) : Tabala (5yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:54',NULL),(1038,'SA_58(US) : Tabala (4yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1039,'SA_59(US) : Tabala (3yr : 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1040,'SA_6(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1041,'SA_60(US) : Tabala (2st 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1042,'SA_61(DP) : Soft Toy (5yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1043,'SA_62(DP) : Soft Toy (4yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1044,'SA_63(DP) : Soft Toy (3yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1045,'SA_64(DP) : Soft Toy (2st 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1046,'SA_65(DP) : Soft Toy (1yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1047,'SA_66(SD) : Odissi (1yr 10-11 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1048,'SA_67(SM) : Art and Paint (1yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1049,'SA_68(DS) : Art and Paint (1yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1050,'SA_69(BS) : Art and  Paint (1yr  11-12 noon)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1051,'SA_7(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1052,'SA_8(DS) : Art and Paint (3yr 09-10 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1053,'SA_9(SM) : Art and Paint (3yr 08-09 am)',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1054,'Special Class (STD7) Gp: A',NULL,0.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1055,'Special Class (STD7) Gp: B',NULL,0.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1056,'Special Class (STD8) AE',NULL,0.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1057,'Special Class (STD8) AR',NULL,0.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1058,'Special Class (STD8) BE',NULL,0.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1059,'Special Class (STD8) BR',NULL,0.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1060,'Special Class (STD8) CE',NULL,0.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1061,'Special Class (STD8) CR',NULL,0.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1062,'Tabla 8-9 am',NULL,225.00,'13-14',1,'2015-03-03 20:07:55',NULL),(1063,'Jr - Aerobics',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1064,'Jr - Art and Painting',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1065,'Jr - Badminton',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1066,'Jr - Chess',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1067,'Jr - Clay Modelling',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1068,'Jr - Cricket',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1069,'Jr - Foot Ball',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1070,'Jr - Guitar',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1071,'Jr - Karate',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1072,'Jr - Keyboard',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1073,'Jr - Lawn Tennis',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1074,'Jr - Modern Dance',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1075,'Jr - Table Tennis',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1076,'Jr - Traditional Dance',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1077,'Jr - Yoga',NULL,300.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1078,'LA_10_Cricket (2yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1079,'LA_11_Cricket (2yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1080,'LA_12_Cricket (2yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1081,'LA_13_Cricket (2yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1082,'LA_14_Cricket (2yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1083,'LA_15_Cricket (2yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1084,'LA_16_Cricket (2yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1085,'LA_17_TT (2yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1086,'LA_18_TT (2yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1087,'LA_19_TT (1yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1088,'LA_1_Basketball (2yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1089,'LA_20_TT (2yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:56',NULL),(1090,'LA_21_TT (1yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1091,'LA_22_TT (2yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1092,'LA_23_TT (2yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1093,'LA_24_TT (2yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1094,'LA_25_Chess (2yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1095,'LA_26_Chess (2yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1096,'LA_27_Chess (2yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1097,'LA_28_Chess (2yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1098,'LA_29_Chess (2yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1099,'LA_2_Basketball (2yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1100,'LA_30_Chess (2yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1101,'LA_31_Football (1yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1102,'LA_32_Football (2yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1103,'LA_33_Football (2yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1104,'LA_34_Chess (1yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1105,'LA_35_Chess (1yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1106,'LA_3_Basketball (1yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1107,'LA_4_Basketball (2yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1108,'LA_5_Basketball (2yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:57',NULL),(1109,'LA_6_Basketball (2yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1110,'LA_7_Basketball (2yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1111,'LA_8_Basketball (2yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1112,'LA_9_Cricket (1yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1113,'Moden Dance 8-9',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1114,'Modern Dance 10-11 am',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1115,'Modern Dance 11-12 noon',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1116,'Modern Dance 9-10',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1117,'NA',NULL,0.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1118,'NA1',NULL,0.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1119,'NA2',NULL,0.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1120,'SA_1(DS) : Art and Paint (6yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1121,'SA_10(SM) : Art and Paint (2st 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1122,'SA_11(DS) : Art and Paint (2st 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1123,'SA_12(SM) : Art and Paint (2st 10-11am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1124,'SA_13(SJ) : Band (1yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1125,'SA_14(SJ) : Band (5yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1126,'SA_15(SJ) : Band (4yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1127,'SA_16(SJ) : Band (3yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1128,'SA_17(SJ) : Band (2st 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1129,'SA_18(EA) : Guitar (1yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1130,'SA_19(EA) : Guitar (5yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1131,'SA_2(DS) : Art and Paint (5yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:58',NULL),(1132,'SA_20(EA) : Guitar (4yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1133,'SA_21(EA) : Guitar (3yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1134,'SA_22(EA) : Guitar (2st 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1135,'SA_23(NT) : Key Board (1yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1136,'SA_24(NT) : Key Board (5yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1137,'SA_25(WR) : Key Board (4yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1138,'SA_26(NT) : Key Board (4yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1139,'SA_27(P) : Key Board (4yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1140,'SA_28(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1141,'SA_29(P) : Key Board (3yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1142,'SA_3(DS) : Art and Paint (1yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1143,'SA_30(NT) : Key Board (3yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1144,'SA_31(NT) : Key Board (2st 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1145,'SA_32(P) : Key Board (2st 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1146,'SA_33(P) : Key Board (1st 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1147,'SA_34(BM) : Karate (6yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1148,'SA_35(BM) : Karate (1yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1149,'SA_36(BM) : Karate (5yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1150,'SA_37(BM) : Karate (5yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1151,'SA_38(BM) : Karate (4yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1152,'SA_39(BM) : Karate (4yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1153,'SA_4(SM) : Art and Paint (4yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1154,'SA_40(BM) : Karate (4yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1155,'SA_41(BM) : Karate (3yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1156,'SA_42(BM) : Karate (2st 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:07:59',NULL),(1157,'SA_43(BM) : Karate (2st 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1158,'SA_44(BM) : Karate (2st 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1159,'SA_45(KP) : Hindustani Music (1yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1160,'SA_46(KP) : Hindustani Music (5yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1161,'SA_47(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1162,'SA_48(KP) : Hindustani Music (4yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1163,'SA_49(KP) : Hindustani Music (3yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1164,'SA_5(SM) : Art and Paint (1yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1165,'SA_50(KP) : Hindustani Music (2st 10-11am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1166,'SA_51(SD) : Odissi (6yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1167,'SA_52(SD) : Odissi (5yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1168,'SA_53(SD) : Odissi (4yr 11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1169,'SA_54(SD) : Odissi (3yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1170,'SA_55(SD) : Odissi (2st 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1171,'SA_56(US) : Tabala (6yr : 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1172,'SA_57(US) : Tabala (5yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1173,'SA_58(US) : Tabala (4yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1174,'SA_59(US) : Tabala (3yr : 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:00',NULL),(1175,'SA_6(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1176,'SA_60(US) : Tabala (2st 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1177,'SA_61(DP) : Soft Toy (5yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1178,'SA_62(DP) : Soft Toy (4yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1179,'SA_63(DP) : Soft Toy (3yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1180,'SA_64(DP) : Soft Toy (2st 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1181,'SA_65(DP) : Soft Toy (1yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1182,'SA_66(SD) : Odissi (1yr 10-11 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1183,'SA_67(SM) : Art and Paint (1yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1184,'SA_68(DS) : Art and Paint (1yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1185,'SA_69(BS) : Art and  Paint (1yr  11-12 noon)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1186,'SA_7(DS) : Art and Paint (4yr 10-11am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1187,'SA_8(DS) : Art and Paint (3yr 09-10 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1188,'SA_9(SM) : Art and Paint (3yr 08-09 am)',NULL,225.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1189,'Special Class (STD7) Gp: A',NULL,0.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1190,'Special Class (STD7) Gp: B',NULL,0.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1191,'Special Class (STD8) AE',NULL,0.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1192,'Special Class (STD8) AR',NULL,0.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1193,'Special Class (STD8) BE',NULL,0.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1194,'Special Class (STD8) BR',NULL,0.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1195,'Special Class (STD8) CE',NULL,0.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1196,'Special Class (STD8) CR',NULL,0.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1197,'Sr - Aerobics',NULL,300.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1198,'Sr - Art and Painting',NULL,300.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1199,'Sr - Badminton',NULL,300.00,'14-15',1,'2015-03-03 20:08:01',NULL),(1200,'Sr - Basket Ball',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),(1201,'Sr - Chess',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),(1202,'Sr - Cricket',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),(1203,'Sr - Foot Ball',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),(1204,'Sr - French',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),(1205,'Sr - Karate',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),(1206,'Sr - Keyboard',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),(1207,'Sr - Lawn Tennis',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),(1208,'Sr - Modern Dance',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),(1209,'Sr - Singing',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),
    (1210,'Sr - Table Tennis',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),
    (1211,'Sr - Yoga',NULL,300.00,'14-15',1,'2015-03-03 20:08:02',NULL),
    (1212,'Tabla 8-9 am',NULL,225.00,'14-15',1,'2015-03-03 20:08:02',NULL);
INSERT INTO `special_activity_list` VALUES
    (1213,'Jr - Cricket',           NULL,225.00,'15-16',1,NULL,NULL),
    (1214,'Jr - Traditional Dance', NULL,225.00,'15-16',1,NULL,NULL),
    (1215,'Jr - Guitar',            NULL,225.00,'15-16',1,NULL,NULL),
    (1216,'Jr - Modern Dance',      NULL,225.00,'15-16',1,NULL,NULL),
    (1217,'Jr - Aerobics',          NULL,225.00,'15-16',1,NULL,NULL),
    (1218,'Jr - Keyboard',          NULL,225.00,'15-16',1,NULL,NULL),
    (1219,'Jr - Chess',             NULL,225.00,'15-16',1,NULL,NULL),
    (1220,'Jr - Art and Painting',  NULL,225.00,'15-16',1,NULL,NULL),
    (1221,'Jr - Karate',            NULL,225.00,'15-16',1,NULL,NULL),
    (1222,'Jr - Lawn Tennis',       NULL,225.00,'15-16',1,NULL,NULL),
    (1223,'Jr - Foot Ball',         NULL,225.00,'15-16',1,NULL,NULL),
    (1224,'Jr - Yoga',              NULL,225.00,'15-16',1,NULL,NULL),
    (1225,'Jr - Badminton',         NULL,225.00,'15-16',1,NULL,NULL),
    (1226,'Jr - Table Tennis',      NULL,225.00,'15-16',1,NULL,NULL),
    (1227,'Jr - Clay Modelling',    NULL,225.00,'15-16',1,NULL,NULL),
    (1228,'Sr - Cricket',           NULL,225.00,'15-16',1,NULL,NULL),
    (1229,'Sr - Traditional Dance', NULL,225.00,'15-16',1,NULL,NULL),
    (1230,'Sr - Guitar',            NULL,225.00,'15-16',1,NULL,NULL),
    (1231,'Sr - Modern Dance',      NULL,225.00,'15-16',1,NULL,NULL),
    (1232,'Sr - Aerobics',          NULL,225.00,'15-16',1,NULL,NULL),
    (1233,'Sr - Keyboard',          NULL,225.00,'15-16',1,NULL,NULL),
    (1234,'Sr - Chess',             NULL,225.00,'15-16',1,NULL,NULL),
    (1235,'Sr - Art and Painting',  NULL,225.00,'15-16',1,NULL,NULL),
    (1236,'Sr - Karate',            NULL,225.00,'15-16',1,NULL,NULL),
    (1237,'Sr - Lawn Tennis',       NULL,225.00,'15-16',1,NULL,NULL),
    (1238,'Sr - Foot Ball',         NULL,225.00,'15-16',1,NULL,NULL),
    (1239,'Sr - Yoga',              NULL,225.00,'15-16',1,NULL,NULL),
    (1240,'Sr - Badminton',         NULL,225.00,'15-16',1,NULL,NULL),
    (1241,'Sr - Table Tennis',      NULL,225.00,'15-16',1,NULL,NULL),
    (1242,'Sr - Clay Modelling',    NULL,225.00,'15-16',1,NULL,NULL);


##########################
##   SPECIAL-ACTIVITY   ##
##########################
SELECT 'special_activity';
DROP TABLE IF EXISTS special_activity;
CREATE TABLE IF NOT EXISTS special_activity(
    sp_activity_id                  INT(6)              NOT NULL AUTO_INCREMENT,
    academic_year                   VARCHAR(10)         NOT NULL,
    admission_no                    VARCHAR(20),
    student_uid                     VARCHAR(12),
    student_name                    VARCHAR(50),
    gender                          ENUM('F','M'),
    current_class                   VARCHAR(30),
    section_code                    CHAR(1),
    student_rollno                  INT(8),
    sp_activity_yn_1                ENUM('N','Y'),
    sp_activity_fee_1               DOUBLE(8,2),
    sp_activity_desc_1              VARCHAR(50),
    sp_activity_yn_2                ENUM('N','Y'),
    sp_activity_fee_2               DOUBLE(8,2),
    sp_activity_desc_2              VARCHAR(50),
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(sp_activity_id)
);


###########################
##   SECTION-ALLOTMENT   ##
###########################
SELECT 'section_allotment';
DROP TABLE IF EXISTS section_allotment;
CREATE TABLE IF NOT EXISTS section_allotment(
    section_allotment_id            INT(6)              NOT NULL AUTO_INCREMENT,
    academic_year                   VARCHAR(10)         NOT NULL,
    admission_no                    VARCHAR(20),
    student_uid                     VARCHAR(12),
    student_name                    VARCHAR(50),
    student_surname                 VARCHAR(50),
    gender                          ENUM('F','M'),
    current_class                   VARCHAR(30),
    current_section_code            CHAR(1),
    current_student_rollno          INT(8),
    new_section_code                CHAR(1),
    new_student_rollno              INT(8),
    class_id                        INT(2)              NOT NULL REFERENCES class(class_id),
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(section_allotment_id)
);
CREATE INDEX section_allotment_student_uid ON section_allotment(student_uid);


####################################
##   SECTION-ROLLNO-REALLOTMENT   ##
####################################
SELECT 'section_rollno_reallotment';
DROP TABLE IF EXISTS section_rollno_reallotment;
CREATE TABLE IF NOT EXISTS section_rollno_reallotment(
    section_rollno_reallotment_id   INT(6)              NOT NULL AUTO_INCREMENT,
    academic_year                   VARCHAR(10)         NOT NULL,
    admission_no                    VARCHAR(20),
    student_uid                     VARCHAR(12),
    student_name                    VARCHAR(50),
    student_surname                 VARCHAR(50),
    gender                          ENUM('F','M'),
    current_class                   VARCHAR(30),
    current_section_code            CHAR(1),
    current_student_rollno          INT(8),
    new_section_code                CHAR(1),
    new_student_rollno              INT(8),
    class_id                        INT(2)              NOT NULL REFERENCES class(class_id),
    user_id                         INT(6)              REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(section_rollno_reallotment_id)
);
CREATE INDEX section_rollno_reallotment_student_uid ON section_rollno_reallotment(student_uid);


#######################
##   HEADS OF FEES   ##
#######################
SELECT 'heads_of_fees';
DROP TABLE IF EXISTS heads_of_fees;
CREATE TABLE IF NOT EXISTS heads_of_fees(
    fees_head_id            INT(6)                          NOT NULL AUTO_INCREMENT,
    fees_head_desc          VARCHAR(100)                    NOT NULL UNIQUE,
    fees_head_abbr          VARCHAR(10)                     UNIQUE,
    academic_year           VARCHAR(10)                     NOT NULL,
    fees_frequency          ENUM('O','Y','H','Q','M','X')   NOT NULL,   # O=OneTime, Y=Yearly, H=Half-Yearly, Q=Quarterly, M=Monthly, X=Extra
    class_LKG               DOUBLE(8,2)                     DEFAULT 0.00,
    class_UKG               DOUBLE(8,2)                     DEFAULT 0.00,
    class_I                 DOUBLE(8,2)                     DEFAULT 0.00,
    class_II                DOUBLE(8,2)                     DEFAULT 0.00,
    class_III               DOUBLE(8,2)                     DEFAULT 0.00,
    class_IV                DOUBLE(8,2)                     DEFAULT 0.00,
    class_V                 DOUBLE(8,2)                     DEFAULT 0.00,
    class_VI                DOUBLE(8,2)                     DEFAULT 0.00,
    class_VII               DOUBLE(8,2)                     DEFAULT 0.00,
    class_VIII              DOUBLE(8,2)                     DEFAULT 0.00,
    class_IX                DOUBLE(8,2)                     DEFAULT 0.00,
    class_X                 DOUBLE(8,2)                     DEFAULT 0.00,
    class_XI                DOUBLE(8,2)                     DEFAULT 0.00,
    class_XII               DOUBLE(8,2)                     DEFAULT 0.00,
    fees_span_required      ENUM('N','Y')                   DEFAULT 'N',
    user_id                 INT(6)                          NOT NULL REFERENCES userlist(user_id),
    last_update             TIMESTAMP,
    del                     ENUM('*')                       DEFAULT NULL,
    PRIMARY KEY(fees_head_id)
);
CREATE INDEX heads_of_fees_fees_head_desc ON heads_of_fees(fees_head_desc);
INSERT INTO heads_of_fees VALUES
    ( 1, 'Admission',                                         'ADM',  '15-16', 'O', 30000.00, 30000.00, 30000.00, 30000.00, 30000.00, 30000.00, 30000.00, 30000.00, 30000.00, 30000.00, 30000.00, 30000.00, 30000.00, 30000.00, 'N', 1, NULL, NULL),
    ( 2, 'Caution',                                           'CAU',  '15-16', 'O',  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1500.00,  1500.00, 'N', 1, NULL, NULL),
    ( 3, 'Farewell & Graduation',                             'F&G',  '15-16', 'Y',     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,   150.00,   150.00,   200.00,   200.00, 'N', 1, NULL, NULL),
    ( 4, 'Annual,Sports,Magazine,Photograph,IDCard,Diary,etc','OTH',  '15-16', 'Y',  1600.00,  1600.00,  1600.00,  1600.00,  1600.00,  1600.00,  1600.00,  1600.00,  1600.00,  1600.00,  1600.00,  1600.00,  1600.00,  1600.00, 'N', 1, NULL, NULL),
    ( 5, 'Library',                                           'LIB',  '15-16', 'Y',     0.00,     0.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   250.00,   250.00, 'N', 1, NULL, NULL),
    ( 6, 'Library Caution Deposit',                           'LCAU', '15-16', 'Y',     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,   500.00,   500.00, 'N', 1, NULL, NULL),
    ( 7, 'Pre I.C.S.E./I.S.C. Stationaries',                  'STA',  '15-16', 'Y',     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,   150.00,   150.00,   150.00,   150.00, 'N', 1, NULL, NULL),
    ( 8, 'Loyola Alumnae Life Membership Fee',                'ALU',  '15-16', 'Y',     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,   500.00,     0.00,     0.00, 'N', 1, NULL, NULL),
    ( 9, 'Science Laboratory',                                'LAB',  '15-16', 'Y',     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,   500.00,   600.00,   600.00,  1200.00,  1200.00, 'N', 1, NULL, NULL),
    (10, 'S. S. S.',                                          'SSS',  '15-16', 'Y',   250.00,   250.00,   250.00,   250.00,   250.00,   250.00,   250.00,   250.00,   250.00,   250.00,   250.00,   250.00,   250.00,   250.00, 'N', 1, NULL, NULL),
    (11, 'Teaching Aid',                                      'TAID', '15-16', 'Y',   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00,   200.00, 'N', 1, NULL, NULL),
    (12, 'Repair & Maintenance',                              'R&M',  '15-16', 'Y',   500.00,   500.00,   500.00,   500.00,   500.00,   500.00,   500.00,   500.00,   500.00,   500.00,   500.00,   500.00,   500.00,   500.00, 'N', 1, NULL, NULL),
    (13, 'Examinations',                                      'EXM',  '15-16', 'Y',   550.00,   550.00,   550.00,   550.00,   550.00,   550.00,   550.00,   550.00,   550.00,   550.00,   550.00,   550.00,   550.00,   550.00, 'N', 1, NULL, NULL),
    (14, 'School Development Fund',                           'DEV',  '15-16', 'Y',  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1000.00,  1200.00,  1200.00, 'N', 1, NULL, NULL),
    (15, 'Tuition',                                           'TUI',  '15-16', 'Q',  3850.00,  3850.00,  3850.00,  3850.00,  3850.00,  3850.00,  3850.00,  4250.00,  4250.00,  4250.00,  4250.00,  4250.00,  4650.00,  4650.00, 'N', 1, NULL, NULL),
    (16, 'Co-Curricular Activity',                            'CCA',  '15-16', 'Q',   150.00,   150.00,   150.00,   150.00,   150.00,   150.00,   150.00,   150.00,   150.00,   150.00,   150.00,   150.00,   150.00,   150.00, 'N', 1, NULL, NULL),
    (17, 'Smart Class',                                       'SMT',  '15-16', 'Q',   600.00,   600.00,   600.00,   600.00,   600.00,   600.00,   600.00,   600.00,   600.00,     0.00,     0.00,     0.00,     0.00,     0.00, 'N', 1, NULL, NULL),
    (18, 'Special Activity',                                  'SPL',  '15-16', 'Q',     0.00,     0.00,     0.00,   300.00,   300.00,   300.00,   300.00,   300.00,   300.00,   300.00,   300.00,     0.00,     0.00,     0.00, 'N', 1, NULL, NULL),
    (19, 'English Language Lab',                              'ELAB', '15-16', 'Q',     0.00,     0.00,   300.00,   300.00,   300.00,   300.00,   300.00,   300.00,   300.00,   300.00,   300.00,   300.00,   300.00,     0.00, 'N', 1, NULL, NULL),
    (20, 'Computer',                                          'COM',  '15-16', 'Q',     0.00,     0.00,   450.00,   450.00,   450.00,   450.00,   450.00,   450.00,   450.00,   450.00,   450.00,   450.00,   600.00,   600.00, 'N', 1, NULL, NULL),
    (21, 'Late Fee',                                          'LATE', '15-16', 'X',     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00, 'N', 1, NULL, NULL),
    (22, 'Difference',                                        'DIFF', '15-16', 'X',     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00, 'N', 1, NULL, NULL),
    (23, 'Examination Fees',                                  'EXAM', '15-16', 'X',     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,   250.00,     0.00,   250.00,     0.00, 'N', 1, NULL, NULL),
    (24, 'Registration Fees',                                 'REGD', '15-16', 'X',     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,     0.00,  3650.00,     0.00,  3650.00, 'N', 1, NULL, NULL);


###################
##   FEES-TYPE   ##
###################
SELECT 'fees_due_dates';
DROP TABLE IF EXISTS fees_due_dates;
CREATE TABLE IF NOT EXISTS fees_due_dates(
    due_id                  INT(6)                      NOT NULL AUTO_INCREMENT,
    academic_year           VARCHAR(10)                 NOT NULL,
    fees_frequency          ENUM('Y','H','Q','M')       NOT NULL,   # Y=Yearly, H=Half-Yearly, Q=Quarterly, M=Monthly
    fees_span_no            INT(2)                      NOT NULL,
    due_date                DATE                        NOT NULL,
    user_id                 INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update             TIMESTAMP,
    del                     ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(due_id)
);
INSERT INTO fees_due_dates VALUES
    ( 1, '15-16', 'Q', 1, STR_TO_DATE('10-04-2015','%d-%m-%Y'), 1, NULL, NULL),
    ( 2, '15-16', 'Q', 2, STR_TO_DATE('10-07-2015','%d-%m-%Y'), 1, NULL, NULL),
    ( 3, '15-16', 'Q', 3, STR_TO_DATE('10-10-2015','%d-%m-%Y'), 1, NULL, NULL),
    ( 4, '15-16', 'Q', 4, STR_TO_DATE('10-01-2016','%d-%m-%Y'), 1, NULL, NULL),
    ( 5, '16-17', 'Q', 1, STR_TO_DATE('10-04-2016','%d-%m-%Y'), 1, NULL, NULL),
    ( 6, '16-17', 'Q', 2, STR_TO_DATE('10-07-2016','%d-%m-%Y'), 1, NULL, NULL),
    ( 7, '16-17', 'Q', 3, STR_TO_DATE('10-10-2016','%d-%m-%Y'), 1, NULL, NULL),
    ( 8, '16-17', 'Q', 4, STR_TO_DATE('10-01-2017','%d-%m-%Y'), 1, NULL, NULL),
    ( 9, '17-18', 'Q', 1, STR_TO_DATE('10-04-2017','%d-%m-%Y'), 1, NULL, NULL),
    (10, '17-18', 'Q', 2, STR_TO_DATE('10-07-2017','%d-%m-%Y'), 1, NULL, NULL),
    (11, '17-18', 'Q', 3, STR_TO_DATE('10-10-2017','%d-%m-%Y'), 1, NULL, NULL),
    (12, '17-18', 'Q', 4, STR_TO_DATE('10-01-2018','%d-%m-%Y'), 1, NULL, NULL);


###################
##   FEES-TYPE   ##
###################
SELECT 'fees_type';
DROP TABLE IF EXISTS fees_type;
CREATE TABLE IF NOT EXISTS fees_type(
    fees_type_id                    INT(6)              NOT NULL AUTO_INCREMENT,
    fees_type_desc                  VARCHAR(30)         NOT NULL UNIQUE,
    fees_type_abbr                  VARCHAR(10)         UNIQUE,
    user_id                         INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(fees_type_id)
);
INSERT INTO fees_type VALUES
    ( 1, 'Admission Fees',  'AF', 1, NULL, NULL),
    ( 2, 'General Fees',    'GF', 1, NULL, NULL);


################################
##   FEES-COLLECTION-HEADER   ##
################################
SELECT 'fees_collection_header';
DROP TABLE IF EXISTS fees_collection_header;
CREATE TABLE fees_collection_header(
    fees_receipt_no                 INT(6)                  NOT NULL AUTO_INCREMENT,
    fees_type_id                    INT(6)                  NOT NULL REFERENCES fees_type(fees_type_id),
    academic_year                   VARCHAR(10),
    fees_reference_no               VARCHAR(20),
    fees_date                       DATE                    NOT NULL,
    admission_no                    VARCHAR(20),
    student_uid                     VARCHAR(12)             NOT NULL,
    admission_class                 VARCHAR(30)             NOT NULL,
    section_code                    CHAR(1)                 NOT NULL,
    student_rollno                  INT(8),
    student_name                    VARCHAR(50)             NOT NULL,
    fees_span_no                    INT(2)                  NOT NULL DEFAULT 0,
    discount_pc                     DOUBLE(6,2)             NOT NULL DEFAULT 0.00,
    discount_amt                    DOUBLE(10,2)            NOT NULL DEFAULT 0.00,
    net_amount                      DOUBLE(12,2)            NOT NULL DEFAULT 0.00,
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(fees_receipt_no)
);


################################
##   FEES-COLLECTION-DETAIL   ##
################################
SELECT 'fees_collection_detail';
DROP TABLE IF EXISTS fees_collection_detail;
CREATE TABLE IF NOT EXISTS fees_collection_detail(
    fees_detail_slno                INT(6)                  NOT NULL AUTO_INCREMENT,
    fees_receipt_no                 INT(6)                  NOT NULL REFERENCES fees_collection_header(fees_receipt_no),
    academic_year                   VARCHAR(10),
    head_slno                       INT(6)                  NOT NULL,
    fees_head_id                    INT(6)                  NOT NULL REFERENCES heads_of_fees(fees_head_id),
    fees_head_amount                DOUBLE(10,2)            NOT NULL,
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(fees_detail_slno)
);


##############################
##   FEES-COLLECTION-SPAN   ##
##############################
SELECT 'fees_collection_span';
DROP TABLE IF EXISTS fees_collection_span;
CREATE TABLE IF NOT EXISTS fees_collection_span(
    fees_span_slno              INT(6)                      NOT NULL AUTO_INCREMENT,
    fees_receipt_no             INT(6)                      NOT NULL REFERENCES fees_collection_header(fees_receipt_no),
    academic_year               VARCHAR(10),
    student_uid                 VARCHAR(12)                 NOT NULL,
    fees_head_id                INT(6)                      NOT NULL,
    fees_span                   ENUM('M','B','Q','H','Y')   NOT NULL DEFAULT 'M',
    fees_span_no                INT(2)                      NOT NULL DEFAULT 0,
    user_id                     INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(fees_span_slno)
);


######################
##   FEES-HISTORY   ##
######################
SELECT 'fees_history';
DROP TABLE IF EXISTS fees_history;
CREATE TABLE IF NOT EXISTS fees_history(
    fees_history_id             INT(6)                      NOT NULL AUTO_INCREMENT,
    academic_year               VARCHAR(10),
    admission_no                VARCHAR(20),
    student_uid                 VARCHAR(12)                 NOT NULL,
    class_desc                  VARCHAR(30)                 NOT NULL,
    class_roman                 VARCHAR(10)                 NOT NULL,
    section_code                CHAR(1),
    student_rollno              INT(8),
    student_name                VARCHAR(50)                 NOT NULL,
    admission_fees_recipt_no    INT(8),
    admission_fees_date         DATE,
    admission_fees_due          DOUBLE(12,2)                DEFAULT 0.00,
    admission_fees_paid         DOUBLE(12,2)                DEFAULT 0.00,
    quarter1_recipt_no          INT(8),
    quarter1_date               DATE,
    quarter1_due                DOUBLE(12,2)                DEFAULT 0.00,
    quarter1_paid               DOUBLE(12,2)                DEFAULT 0.00,
    quarter2_recipt_no          INT(8),
    quarter2_date               DATE,
    quarter2_due                DOUBLE(12,2)                DEFAULT 0.00,
    quarter2_paid               DOUBLE(12,2)                DEFAULT 0.00,
    quarter3_recipt_no          INT(8),
    quarter3_date               DATE,
    quarter3_due                DOUBLE(12,2)                DEFAULT 0.00,
    quarter3_paid               DOUBLE(12,2)                DEFAULT 0.00,
    quarter4_recipt_no          INT(8),
    quarter4_date               DATE,
    quarter4_due                DOUBLE(12,2)                DEFAULT 0.00,
    quarter4_paid               DOUBLE(12,2)                DEFAULT 0.00,
    diff_amount                 DOUBLE(12,2)                DEFAULT 0.00,
    total_due                   DOUBLE(12,2)                DEFAULT 0.00,
    total_paid                  DOUBLE(12,2)                DEFAULT 0.00,
    exam_fees_recipt_no         INT(8),
    exam_fees_date              DATE,
    exam_fees_due               DOUBLE(12,2)                DEFAULT 0.00,
    exam_fees_paid              DOUBLE(12,2)                DEFAULT 0.00,
    regd_fees_recipt_no         INT(8),
    regd_fees_date              DATE,
    regd_fees_due               DOUBLE(12,2)                DEFAULT 0.00,
    regd_fees_paid              DOUBLE(12,2)                DEFAULT 0.00,
    user_id                     INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(fees_history_id)
);


#################
##   SUBJECT   ##
#################
SELECT 'subject';
DROP TABLE IF EXISTS subject;
CREATE TABLE IF NOT EXISTS subject(
    subject_id                      INT(6)              NOT NULL AUTO_INCREMENT,
    subject_desc                    VARCHAR(30)         NOT NULL UNIQUE,
    subject_abbr                    VARCHAR(10)         UNIQUE,
    user_id                         INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(subject_id)
);
CREATE INDEX subject_subject_desc ON subject(subject_desc);
CREATE INDEX subject_subject_abbr ON subject(subject_abbr);
INSERT INTO subject VALUES
    ( 1,    'English I',            'ENG1', 1, NULL, NULL),
    ( 2,    'English II',           'ENG2', 1, NULL, NULL),
    ( 3,    'Mathematics',          'MATH', 1, NULL, NULL),
    ( 4,    'General Science',      'GSC',  1, NULL, NULL),
    ( 5,    'Physics',              'PHY',  1, NULL, NULL),
    ( 6,    'Chemistry',            'CHE',  1, NULL, NULL),
    ( 7,    'Biology',              'BIO',  1, NULL, NULL),
    ( 8,    'M.I.L.',               'MIL',  1, NULL, NULL),
    ( 9,    'History',              'HIS',  1, NULL, NULL),
    (10,    'Geography',            'GEO',  1, NULL, NULL),
    (11,    'Civics',               'CIV',  1, NULL, NULL),
    (12,    'Oriya',                'ORI',  1, NULL, NULL),
    (13,    'Hindi',                'HIN',  1, NULL, NULL),
    (14,    'Sanskrit',             'SAN',  1, NULL, NULL),
    (15,    'S.U.P.W.',             'SUPW', 1, NULL, NULL),
    (16,    'Drawing',              'DRW',  1, NULL, NULL),
    (17,    'Games',                'GAM',  1, NULL, NULL),
    (18,    'Physiology Hygiene',   'PSH',  1, NULL, NULL),
    (19,    'Urdu',                 'URD',  1, NULL, NULL),
    (20,    'Optional Mathematics', 'OMT',  1, NULL, NULL);


#################
##   HOLIDAY   ##
#################
SELECT 'holiday';
DROP TABLE IF EXISTS holiday_list;
CREATE TABLE IF NOT EXISTS holiday_list(
    holiday_id                  INT(6)              NOT NULL AUTO_INCREMENT,
    holiday_desc                VARCHAR(30)         NOT NULL UNIQUE,
    holiday_abbr                VARCHAR(10)         UNIQUE,
    date                        DATE                NOT NULL,
    user_id                     INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(holiday_id)
);
CREATE INDEX holiday_list_holiday_desc ON holiday_list(holiday_desc);
INSERT INTO holiday_list VALUES
    ( 1, 'New Year Day',            NULL,  STR_TO_DATE('01-01-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    ( 2, 'Makarasankranti',         NULL,  STR_TO_DATE('14-01-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    ( 3, 'Saraswati Puja',          NULL,  STR_TO_DATE('24-01-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    ( 4, 'Republic Day',            NULL,  STR_TO_DATE('26-01-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    ( 5, 'Mahashivratri',           NULL,  STR_TO_DATE('17-02-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    ( 6, 'Holi',                    NULL,  STR_TO_DATE('06-03-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    ( 7, 'Ramnavmi',                NULL,  STR_TO_DATE('28-03-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    ( 8, 'Good Friday',             NULL,  STR_TO_DATE('03-04-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    ( 9, 'May Day',                 NULL,  STR_TO_DATE('01-05-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (10, 'Id-ul-Fitr',              NULL,  STR_TO_DATE('18-07-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (11, 'Independence',            NULL,  STR_TO_DATE('15-08-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (12, 'Raksha Bandhan',          NULL,  STR_TO_DATE('29-08-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (13, 'Srikrishna Janmastami',   NULL,  STR_TO_DATE('05-09-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (14, 'Ganesh Chaturathi',       NULL,  STR_TO_DATE('17-09-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (15, 'Gandhi Jayanti',          NULL,  STR_TO_DATE('02-10-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (16, 'Navaratri',               NULL,  STR_TO_DATE('13-10-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (17, 'Vijay Dashami',           NULL,  STR_TO_DATE('04-10-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (18, 'Diwali',                  NULL,  STR_TO_DATE('22-10-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (19, 'Bakri Id',                NULL,  STR_TO_DATE('24-10-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (20, 'Children\'s Day',         NULL,  STR_TO_DATE('14-11-2015','%d-%m-%Y'),  1,  NULL,  NULL),
    (21, 'Christmas Day',           NULL,  STR_TO_DATE('25-12-2015','%d-%m-%Y'),  1,  NULL,  NULL);


################
##   PERIOD   ##
################
SELECT 'period';
DROP TABLE IF EXISTS period;
CREATE TABLE IF NOT EXISTS period(
    period_id                       INT(6)              NOT NULL AUTO_INCREMENT,
    period_desc                     VARCHAR(30)         NOT NULL UNIQUE,
    period_short                    VARCHAR(10)         UNIQUE,
    period_time_start               TIME                NOT NULL,
    period_time_end                 TIME                NOT NULL,
    user_id                         INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(period_id)
);


#####################
##   DESIGNATION   ##
#####################
SELECT 'designation';
DROP TABLE IF EXISTS designation;
CREATE TABLE IF NOT EXISTS designation(
    desig_id                INT(6)                      NOT NULL AUTO_INCREMENT,
    desig_desc              VARCHAR(30)                 NOT NULL UNIQUE,
    desig_abbr              VARCHAR(10)                 UNIQUE,
    staff_type              ENUM('B','M','N','R','T')   NOT NULL,    # B=Both (Teaching+Non-Teaching), M=Management, N=Non-Teaching, R=Trustee, T=Teaching
    user_id                 INT(6)                      NOT NULL REFERENCES userlist(user_id),
    last_update             TIMESTAMP,
    del                     ENUM('*')                   DEFAULT NULL,
    PRIMARY KEY(desig_id)
);
CREATE INDEX designation_desig_desc ON designation(desig_desc);
INSERT INTO designation VALUES
    ( 1, 'Select',                  NULL,   'B',    1, NULL, NULL),
    ( 2, 'Principal',               'HM',   'T',    1, NULL, NULL),
    ( 3, 'Vice Principal',          'AHM',  'T',    1, NULL, NULL),
    ( 4, 'Management Staff',        'MGT',  'M',    1, NULL, NULL),
    ( 5, 'Head Teacher',            'HT',   'T',    1, NULL, NULL),
    ( 6, 'Teacher',                 'TH',   'T',    1, NULL, NULL),
    ( 7, 'Laboratory Assistant',    'LA',   'T',    1, NULL, NULL),
    ( 8, 'Physical Trainer',        'PT',   'T',    1, NULL, NULL),
    ( 9, 'Accountant',              'AC',   'N',    1, NULL, NULL),
    (10, 'Clerk',                   'CL',   'N',    1, NULL, NULL),
    (11, 'Attendant',               'AT',   'N',    1, NULL, NULL),
    (12, 'Ayah',                    'AY',   'N',    1, NULL, NULL),
    (13, 'Peon',                    'PN',   'N',    1, NULL, NULL),
    (14, 'Gardner',                 'GN',   'N',    1, NULL, NULL),
    (15, 'Security',                'SC',   'N',    1, NULL, NULL),
    (16, 'Trustee',                 'TT',   'R',    1, NULL, NULL);


##################
##   EMPLOYEE   ##
##################
SELECT 'employ';
DROP TABLE IF EXISTS employ;
CREATE TABLE IF NOT EXISTS employ(
    emp_id                          INT(6)                  NOT NULL AUTO_INCREMENT,
    desig_desc                      VARCHAR(30)             NOT NULL REFERENCES designation(desig_desc),
    file_no                         VARCHAR(20)             NOT NULL UNIQUE,
    date                            DATE                    NOT NULL,
    emp_first_name                  VARCHAR(30)             NOT NULL,
    emp_middle_name                 VARCHAR(30),
    emp_last_name                   VARCHAR(30),
    emp_short                       VARCHAR(10),
    gender                          ENUM('F','M'),
    nationality                     VARCHAR(30),
    religion                        VARCHAR(30),
    mother_tongue                   VARCHAR(30),
    ethnicity                       VARCHAR(30),
    permanent_address               VARCHAR(200),
    permanent_landline_no           VARCHAR(20),
    permanent_mobile_no             VARCHAR(20),
    present_address                 VARCHAR(200),
    present_landline_no             VARCHAR(20),
    present_mobile_no               VARCHAR(20)				NOT NULL,
    date_of_birth                   DATE,
    place_of_birth                  VARCHAR(30),
    marital_status                  VARCHAR(30),
    no_of_children                  INT(2),
    no_of_son                       INT(2),
    no_of_daughter                  INT(2),
    physical_ability                VARCHAR(30),
    voter_id_card_no                VARCHAR(20),
    pan_card_no                     VARCHAR(20),
    passport_no                     VARCHAR(20),
    hist_illness                    VARCHAR(200),
    blood_group                     VARCHAR(15),
    contact_person_name             VARCHAR(40),
    contact_relationship            VARCHAR(30),
    contact_address                 VARCHAR(200),
    contact_landline_no             VARCHAR(20),
    contact_mobile_no               VARCHAR(20),
    date_of_joining                 DATE,
    employment_status               VARCHAR(30),
    employment_end_date             DATE,
    first_teachership_date          DATE,
    last_promotion_date             DATE,
    present_position                VARCHAR(30),
    present_pay_scale               VARCHAR(30),
    special_skills                  VARCHAR(50),
    teaching_hours_week             INT(2),
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(emp_id)
);
CREATE UNIQUE INDEX employ_name ON employ(emp_first_name,emp_middle_name,emp_last_name);


############################
##   EMPLOYMENT-HISTORY   ##
############################
SELECT 'emp_history';
DROP TABLE IF EXISTS emp_history;
CREATE TABLE IF NOT EXISTS emp_history(
    emp_hist_id                     INT(6)                  NOT NULL AUTO_INCREMENT,
    emp_id                          INT(6)                  NOT NULL REFERENCES employ(emp_id),
    emp_designation                 VARCHAR(30),
    employer_name                   VARCHAR(40)             NOT NULL,
    employer_address                VARCHAR(150),
    date_from                       DATE,
    date_to                         DATE,
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(emp_hist_id)
);


#######################################
##   EMPLOYMENT-QUALIFICATION-TYPE   ##
#######################################
SELECT 'qualif_type';
DROP TABLE IF EXISTS qualif_type;
CREATE TABLE IF NOT EXISTS qualif_type(
    qualif_type_id                  INT(6)                  NOT NULL AUTO_INCREMENT,
    qualif_type_desc                VARCHAR(30)             NOT NULL UNIQUE,
    qualif_type_abbr                VARCHAR(10),
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(qualif_type_id)
);
CREATE INDEX qualif_type_qualif_type_desc ON qualif_type(qualif_type_desc);
INSERT INTO qualif_type VALUES
    ( 1, 'Academic Qualification',  'AQ', 1, NULL, NULL),
    ( 2, 'Teachers Training',       'TT', 1, NULL, NULL),
    ( 3, 'Physical Training',       'PT', 1, NULL, NULL),
    ( 4, 'Management Training',     'MT', 1, NULL, NULL),
    ( 5, 'Other Training',          'OT', 1, NULL, NULL);


################################
##   EMPLOYEE-QUALIFICATION   ##
################################
SELECT 'emp_qualification';
DROP TABLE IF EXISTS emp_qualification;
CREATE TABLE IF NOT EXISTS emp_qualification(
    emp_qualif_id                   INT(6)                  NOT NULL AUTO_INCREMENT,
    emp_id                          INT(6)                  NOT NULL REFERENCES employ(emp_id),
    qualif_type_id                  INT(6)                  NOT NULL REFERENCES qualif_type(qualif_type_id),
    qualif_desc                     VARCHAR(50)             NOT NULL,
    qualif_institute                VARCHAR(50),
    qualif_year                     INT(4),
    performance_percent             DOUBLE(6,2),
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(emp_qualif_id)
);


#######################################
##   EMPLOY-SUBJECT-SPECIALIZATION   ##
#######################################
SELECT 'emp_specialization';
DROP TABLE IF EXISTS emp_specialization;
CREATE TABLE IF NOT EXISTS emp_specialization(
    emp_special_id                  INT(6)                  NOT NULL AUTO_INCREMENT,
    emp_id                          INT(6)                  NOT NULL REFERENCES employ(emp_id),
    subject_desc                    VARCHAR(30)             NOT NULL,
    major_minor                     ENUM('Major','Minor')   NOT NULL,
    teaching                        ENUM('Y','N')           NOT NULL,
    user_id                         INT(6)                  NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')               DEFAULT NULL,
    PRIMARY KEY(emp_special_id)
);


#################################
##   CLASS-ATTENDANCE-HEADER   ##
#################################
SELECT 'class_attendance_header';
DROP TABLE IF EXISTS class_attendance_header;
CREATE TABLE IF NOT EXISTS class_attendance_header(
    attendance_id                   INT(6)              NOT NULL AUTO_INCREMENT,
    date                            DATE                NOT NULL,
    class_desc                      VARCHAR(30)         NOT NULL,
    section_code                    CHAR(1)             NOT NULL,
    teacher_id                      INT(6)              NOT NULL REFERENCES employ(emp_id),
    user_id                         INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(attendance_id)
);


#################################
##   CLASS-ATTENDANCE-DETAIL   ##
#################################
SELECT 'class_attendance_detail';
DROP TABLE IF EXISTS class_attendance_detail;
CREATE TABLE IF NOT EXISTS class_attendance_detail(
    attendance_slno                 INT(6)              NOT NULL AUTO_INCREMENT,
    attendance_id                   INT(6)              NOT NULL REFERENCES class_attendance_header(attendance_id),
    student_rollno                  INT(8),
    student_name                    VARCHAR(50)         NOT NULL,
    gender                          ENUM('F','M')       NOT NULL,
    present                         ENUM('Y','N')       NOT NULL DEFAULT 'N',
    user_id                         INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(attendance_slno)
);


##########################
##   EXAMINATION-TYPE   ##
##########################
SELECT 'examination_type';
DROP TABLE IF EXISTS examination_type;
CREATE TABLE IF NOT EXISTS examination_type(
    examtype_id                     INT(6)              NOT NULL AUTO_INCREMENT,
    examtype_desc                   VARCHAR(30)         NOT NULL UNIQUE,
    examtype_abbr                   VARCHAR(10)         UNIQUE,
    user_id                         INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                     TIMESTAMP,
    del                             ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(examtype_id)
);
CREATE INDEX examination_type_examtype_desc ON examination_type(examtype_desc);
INSERT INTO examination_type VALUES
    (1, 'Annual Test',      'AT', 1, NULL, NULL),
    (2, 'Half Yearly Test', 'HT', 1, NULL, NULL),
    (3, 'Quarterly Test',   'QT', 1, NULL, NULL),
    (4, 'Monthly Test',     'MT', 1, NULL, NULL),
    (5, 'Class Test',       'CT', 1, NULL, NULL),
    (6, 'Mock Test',        'KT', 1, NULL, NULL),
    (7, 'Surprise Test',    'ST', 1, NULL, NULL);


#####################################
##   SCHEDULE-EXAMINATION-HEADER   ##
#####################################
SELECT 'schedule_examination_header';
DROP TABLE IF EXISTS schedule_examination_header;
CREATE TABLE IF NOT EXISTS schedule_examination_header(
    exam_schedule_id            INT(6)              NOT NULL AUTO_INCREMENT,
    exam_schedule_desc          VARCHAR(50),
    examtype_desc               VARCHAR(30)         REFERENCES examination_type(examtype_desc),
    class_desc                  VARCHAR(30)         REFERENCES class(class_desc),
    section_code                CHAR(1),
    user_id                     INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(exam_schedule_id)
);


#####################################
##   SCHEDULE-EXAMINATION-DETAIL   ##
#####################################
SELECT 'schedule_examination_detail';
DROP TABLE IF EXISTS schedule_examination_detail;
CREATE TABLE IF NOT EXISTS schedule_examination_detail(
    exam_id                     INT(6)              NOT NULL AUTO_INCREMENT,
    exam_schedule_id            INT(6)              NOT NULL REFERENCES schedule_examination_header(exam_schedule_id),
    subject_desc                VARCHAR(30)         REFERENCES subject(subject_desc),
    exam_date                   DATE,
    exam_time                   TIME,
    exam_duration               TIME,
    full_mark                   INT(3)              DEFAULT 0,
    hall_specification          VARCHAR(30),
    user_id                     INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(exam_id)
);


###########################
##   MARK-SHEET-HEADER   ##
###########################
SELECT 'mark_sheet_header';
DROP TABLE IF EXISTS mark_sheet_header;
CREATE TABLE IF NOT EXISTS mark_sheet_header(
    mark_sheet_id               INT(6)              NOT NULL AUTO_INCREMENT,
    exam_id                     INT(6)              NOT NULL REFERENCES schedule_examination_detail(exam_id),
    evaluator_id                INT(6)              NOT NULL REFERENCES employ(emp_id),
    user_id                     INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(mark_sheet_id)
);


###########################
##   MARK-SHEET-DETAIL   ##
###########################
DROP TABLE IF EXISTS mark_sheet_detail;
CREATE TABLE IF NOT EXISTS mark_sheet_detail(
    sheet_slno                  INT(6)              NOT NULL AUTO_INCREMENT,
    mark_sheet_id               INT(6)              NOT NULL REFERENCES mark_sheet_header,
    student_rollno              INT(8),
    student_name                VARCHAR(50)         NOT NULL,
    student_uid                 VARCHAR(12)         NOT NULL,
    full_mark                   INT(3)              NOT NULL DEFAULT 0,
    mark_obtained               INT(3)              DEFAULT 0,
    user_id                     INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(sheet_slno)
);


########################################
##   ITEM-CATEGORY-FOR-DISTRIBUTION   ##
########################################
SELECT 'item_category';
DROP TABLE IF EXISTS item_category;
CREATE TABLE IF NOT EXISTS item_category(
    item_category_id            INT(6)              NOT NULL AUTO_INCREMENT,
    item_category_desc          VARCHAR(50)         NOT NULL UNIQUE,
    item_category_abbr          VARCHAR(10)         UNIQUE,
    user_id                     INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(item_category_id)
);
CREATE INDEX item_category_item_category_desc ON item_category(item_category_desc);
INSERT INTO item_category VALUES
    (1, 'Books',        NULL, 1, NULL, NULL),
    (2, 'Food',         NULL, 1, NULL, NULL),
    (3, 'Perishable',   NULL, 1, NULL, NULL),
    (4, 'Sports',       NULL, 1, NULL, NULL),
    (5, 'Uniform',      NULL, 1, NULL, NULL);


###############################
##   ITEM-FOR-DISTRIBUTION   ##
###############################
SELECT 'item_for_distribution';
DROP TABLE IF EXISTS item_for_distribution;
CREATE TABLE IF NOT EXISTS item_for_distribution(
    item_id                     INT(6)              NOT NULL AUTO_INCREMENT,
    item_category_id            INT(6)              NOT NULL REFERENCES item_category(item_category_id),
    item_desc                   VARCHAR(50)         NOT NULL UNIQUE,
    item_abbr                   VARCHAR(10)         UNIQUE,
    user_id                     INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(item_id)
);
CREATE INDEX item_for_distribution_item_desc ON item_for_distribution(item_desc);


###############################
##   ITEM-FOR-DISTRIBUTION   ##
###############################
SELECT 'item_balance';
DROP TABLE IF EXISTS item_balance;
CREATE TABLE IF NOT EXISTS item_balance(
    slno                        INT(6)              NOT NULL AUTO_INCREMENT,
    item_id                     INT(6)              NOT NULL REFERENCES item_for_distribution(item_id),
    balance_qty                 INT(6)              DEFAULT 0,
    user_id                     INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(slno)
);


###################################
##   ITEM-SET-FOR-DISTRIBUTION   ##
###################################
SELECT 'set_for_distribution';
DROP TABLE IF EXISTS set_for_distribution;
CREATE TABLE IF NOT EXISTS set_for_distribution(
    set_id                      INT(6)              NOT NULL AUTO_INCREMENT,
    item_id                     INT(6)              NOT NULL REFERENCES item_for_distribution(item_id),
    set_desc                    VARCHAR(50)         NOT NULL UNIQUE,
    set_abbr                    VARCHAR(10)         UNIQUE,
    user_id                     INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(set_id)
);


###########################
##   ITEM-DISTRIBUTION   ##
###########################
SELECT 'distribution';
DROP TABLE IF EXISTS distribution;
CREATE TABLE IF NOT EXISTS distribution(
    distribution_id             INT(6)              NOT NULL AUTO_INCREMENT,
    date                        DATE                NOT NULL,
    item_id                     INT(6)              NOT NULL REFERENCES item_for_distribution(item_id),
    admission_no                VARCHAR(20),
    student_rollno              INT(8),
    student_name                VARCHAR(50)         NOT NULL,
    student_uid                 VARCHAR(12)         NOT NULL,
    class_desc                  VARCHAR(30)         REFERENCES class(class_desc),
    section_code                CHAR(1),
    quantity                    INT(6)              NOT NULL,
    user_id                     INT(6)              NOT NULL REFERENCES userlist(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*')           DEFAULT NULL,
    PRIMARY KEY(distribution_id)
);


################
##   SPORTS   ##
################


#################
##   LIBRARY   ##
#################






#########################
###    LEAVE-RULES    ###
#########################
SELECT 'leave_quota';
DROP TABLE IF EXISTS leave_quota;
CREATE TABLE IF NOT EXISTS leave_quota(
    leave_id                INT(6)              NOT NULL AUTO_INCREMENT,
    leave_desc              VARCHAR(30)         NOT NULL UNIQUE,
    leave_short             CHAR(2)             NOT NULL UNIQUE,
    no_of_leave             INT(3)              DEFAULT 0,
    PRIMARY KEY(leave_id)
);
INSERT INTO leave_quota VALUES
    (1, "Casual Leave",     "CL", 15),
    (2, "Optional Leave",   "OL",  1),
    (3, "Earned Leave",     "EL",  6),
    (4, "Medical Leave",    "ML",  4);


###################
###    LEAVE    ###
###################
SELECT 'leavetrn';
DROP TABLE IF EXISTS leavetrn;
CREATE TABLE leavetrn(
    slno                    INT(6)              NOT NULL AUTO_INCREMENT,
    doctor_id               INT(6)              NOT NULL REFERENCES doctors(doctor_id),
    date_from               DATE                NOT NULL,
    date_to                 DATE                NOT NULL,
    no_of_days              INT(3)              NOT NULL DEFAULT 1,
    leave_id                INT(6)              NOT NULL REFERENCES rules(leave_id),
    balance_days            INT(3)              NOT NULL DEFAULT 0,
    PRIMARY KEY(slno)
);
INSERT INTO leavetrn VALUES
    (  1,  99, '2014-01-01', '2014-01-03',  3,  1, 12),
    (  2, 105, '2014-01-02', '2014-01-02',  1,  1, 14),
    (  3, 113, '2014-01-02', '2014-01-03',  2,  1, 13),
    (  4,  99, '2014-01-10', '2014-01-11',  2,  1, 10),
    (  5,  99, '2014-01-16', '2014-01-17',  2,  2, 10);


##################################################################
##################################################################
#######                                                    #######
#######                                                    #######
#######            Finance & Accounts Module               #######
#######                                                    #######
#######                                                    #######
##################################################################
##################################################################
#
################################
##  FINANCE-CONTROL-SETTING   ##
################################
SELECT 'financeControl';
DROP TABLE IF EXISTS financeControl;
CREATE TABLE IF NOT EXISTS financeControl(
    control_id                  INT(6)          NOT NULL AUTO_INCREMENT,
    control_desc                VARCHAR(50)     NOT NULL,
    control_value               VARCHAR(50)     NOT NULL,
    user_id                     INT(6)          NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(control_id)
);
INSERT INTO financeControl VALUES
    ( 1, 'CASH GROUP',   '67', 1, NULL, NULL),
    ( 2, 'BANK GROUP',   '68', 1, NULL, NULL);


#####################
##  VOUCHER-TYPE   ##
#####################
SELECT 'vtype';
DROP TABLE IF EXISTS vtype;
CREATE TABLE IF NOT EXISTS vtype(
    vtype_id                    INT(6)          NOT NULL AUTO_INCREMENT,
    vtype_desc                  VARCHAR(50)     NOT NULL UNIQUE,
    vtype_abbr                  VARCHAR(10)     UNIQUE,
    vtype_start_no              INT(6),
    vtype_end_no                INT(6),
    user_id                     INT(6)          NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(vtype_id)
);
INSERT INTO vtype VALUES
    (1, 'Opening',      'OPB', 1, 999999, 001, NULL, NULL),
    (2, 'Receipt',      'REC', 1, 999999, 001, NULL, NULL),
    (3, 'Payment',      'PAY', 1, 999999, 001, NULL, NULL),
    (4, 'Contra',       'CON', 1, 999999, 001, NULL, NULL),
    (5, 'Journal',      'JRN', 1, 999999, 001, NULL, NULL);


################################
#   GENERAL-LEDGER-HEAD (GL)   #
################################
SELECT 'gl';
DROP TABLE IF EXISTS gl;
CREATE TABLE gl(
  gl_code           INT(6)              NOT NULL AUTO_INCREMENT,
  parent_code       INT(6)              DEFAULT NULL,
  gl_name           VARCHAR(50)         NOT NULL,
  closing_balance   DOUBLE(12,2)        DEFAULT '0.00',
  minimum_balance   DOUBLE(12,2)        DEFAULT '0.00',
  budget_balance    DOUBLE(12,2)        DEFAULT '0.00',
  lfno              VARCHAR(15)         DEFAULT NULL,
  modify_allowed    ENUM('Y','N')       NOT NULL DEFAULT 'N',
  gl_type           ENUM('N','P','R')   DEFAULT NULL,
  user_id           INT(6)              NOT NULL,
  last_update       TIMESTAMP           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  del               ENUM('*')           DEFAULT NULL,
  PRIMARY KEY (gl_code),
  UNIQUE KEY gl_name (gl_name)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=latin1;

LOCK TABLES gl WRITE;
INSERT INTO gl VALUES
    (  1,NULL, 'All Accounts',                          0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (  2,   1, 'Balance Sheet',                         0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (  3,   1, 'Profit & Loss A/c',                     0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (  4,   2, 'Liabilities',                           0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (  5,   2, 'Assets',                                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (  6,   3, 'Income',                                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (  7,   3, 'Expenses',                              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (  8,   4, 'Capitals',                              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (  9,   4, 'Reserve And Surplus',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 10,   4, 'Loan Funds',                            0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 11,   5, 'Fixed Asset',                           0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 12,   5, 'Investment',                            0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 13,   5, 'Net Current Asset',                     0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 14,   5, 'Miscllaneous Expenditure',              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 15,   5, 'Capital Account',                       0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 18,   9, 'Profit/Loss of the Year',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 19,   9, 'Profit & Loss-Previous Year',           0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 20,   9, 'General Reserve',                       0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 21,  10, 'Secured Loan',                          0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 23,  21, 'Term Loan-1',                           0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 24,  21, 'Term Loan-2',                           0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 32,  11, 'Building WIP',                          0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 33,  11, 'Furniture & Fixture',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 34,  11, 'Computer',                              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 35,  11, 'Bi-cycle',                              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 36,  11, 'Electrical Items',                      0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 37,  11, 'Bus',                                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 38,  11, 'Library Books',                         0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 39,  11, 'Type Writer',                           0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 40,  12, 'Investment In Shares',                  0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 41,  12, 'Investment In Debentures',              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 42,  12, 'Investment In Others',                  0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 43,  12, 'Deposit For Profession',                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 44,  40, 'Investment In Shares In Company A',     0.00,0.00,0.00,NULL,'Y',NULL,  1,NULL,NULL),
    ( 45,  40, 'Investment In Shares In Company B',     0.00,0.00,0.00,NULL,'Y',NULL,  1,NULL,NULL),
    ( 46,  41, 'Debenture In X Limited',                0.00,0.00,0.00,NULL,'Y',NULL,  1,NULL,NULL),
    ( 47,  41, 'Debenture In Y Limited',                0.00,0.00,0.00,NULL,'Y',NULL,  1,NULL,NULL),
    ( 48,  42, 'Fixed Deposit In Banks',                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 49,  42, 'Investment In Bonds',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 50,  42, 'Government Security',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 51,  43, 'Deposit For Electricity',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 52,  43, 'Deposit For Telephone',                 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 53,  43, 'Deposit For Rent',                      0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 54,  13, 'Loans And Advances',                    0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 55,  13, 'Current Asset',                         0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 56,  13, 'Current Liabilities',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 57,  54, 'Advances Receivable',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 58,  54, 'Loans',                                 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 59,  57, 'Advances To Employee',                  0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 60,  57, 'Advances To Other',                     0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 61,  58, 'Loans To Staff',                        0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 62,  58, 'Loans To Mr.P',                         0.00,0.00,0.00,NULL,'Y',NULL,  1,NULL,NULL),
    ( 63,  58, 'Loans To Mr.Q',                         0.00,0.00,0.00,NULL,'Y',NULL,  1,NULL,NULL),
    ( 64,  55, 'Cash And Bank Balance',                 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 65,  55, 'Tax Accounts',                          0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 67,  64, 'Cash',                                  0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 68,  64, 'Bank',                                  0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 69,  67, 'Cash In Hand A/c',                      0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 70,  67, 'Petty Cash Accounts',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 71,  68, 'SBI A/c No. 32029133464',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 72,  68, 'Syndicate Bank A/c No. 80072200004862', 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 73,  65, 'Advance Tax For The Year?',             0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 75,  56, 'Provision',                             0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 77,  56, 'VAT (Sales Tax) Account',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 78,  75, 'Provision For Tax',                     0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 79,  75, 'Provision For Salaries',                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 80,  75, 'Service Tax Payable',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 81,  14, 'Opening Balance Control',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 82,  14, 'Journal Entries Control',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 83,   6, 'School Income',                         0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 84,   6, 'Other Income',                          0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 85,  83, 'Tuition Fees Income',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 86,  83, 'Session Charges Income',                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 87,  83, 'Admission Fees Income',                 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 88,  83, 'Development Fees Income',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 89,  83, 'Bus Fees Income',                       0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    ( 99,   7, 'General Expenses',                      0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (100,   7, 'Depreciation',                          0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (101,   7, 'Interest',                              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (102,   7, 'Taxes',                                 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (104,  99, 'Salaries',                              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (105,  99, 'Administrative Expenses',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (106,  99, 'Professional Development Cost',         0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (107,  99, 'Other Expenses',                        0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (108, 104, 'Professional Fees To Qualified Staff',  0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (109, 104, 'Salaries To Principal',                 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (110, 104, 'Salaries To Staff',                     0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (111, 104, 'Staff Welfare',                         0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (112, 104, 'Stipend To Article Trainee',            0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (113, 105, 'Examination Expenses',                  0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (114, 105, 'Electricity Charges',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (115, 105, 'Printing & Stationery',                 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (116, 105, 'Office Expenses',                       0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (117, 105, 'Travelling Expenses',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (118, 105, 'Fuel & Lubricant',                      0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (119, 105, 'Telephone Charges',                     0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (120, 105, 'Misc. Expenses',                        0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (121, 105, 'News Paper & Periodicals',              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (122, 105, 'Puja & Festival Expenses',              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (123, 105, 'Annual Function Expenses',              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (124, 106, 'Certified Professional Education Cost', 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (125, 106, 'Seminar & Conference',                  0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (126, 106, 'Training Expenses',                     0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (127, 107, 'Legal Expences',                        0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (128, 107, 'Entertainment Expences',                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (129, 107, 'Miscllaneous Expences',                 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (130, 107, 'Staff Convenyance',                     0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (131, 107, 'Partner Convenyance Expences',          0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (133, 107, 'Bank Charges',                          0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (135, 100, 'Depreciation-Building WIP',             0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (136, 100, 'Depreciation-Furniture & Fixture',      0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (137, 100, 'Depreciation-Computers',                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (138, 100, 'Depreciation-Bi-cycle',                 0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (139, 100, 'Depreciation-Electrical Items',         0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (140, 100, 'Depreciation-Bus',                      0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (141, 100, 'Depreciation-Library Books',            0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (142, 100, 'Depreciation-Type Writer',              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (143, 101, 'Interest On Bank Loans',                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (144, 101, 'Interest On Other Loan',                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (145, 101, 'Interest On Partner Loans',             0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (146, 102, 'Income Tax For The Year',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (147, 102, 'Service Tax Paid',                      0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (151, 105, 'Annual Sports Expenses',                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (152, 105, 'Games & Sports Expenses',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (153, 105, 'Cultural Function Expenses',            0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (154, 105, 'First Aid Expenses',                    0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (155, 105, 'Hire Charges of Vehicle',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (156, 105, 'Repair & Maintenance',                  0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (157, 105, 'Uniforms',                              0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (158, 105, 'Chemicals',                             0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (159, 105, 'Advertisement Expenses',                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (160, 105, 'Workshop Expenses',                     0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (161, 105, 'Audit Fees',                            0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (163,  84, 'Donation Income',                       0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (164,  84, 'Misc. Income',                          0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (165,  84, 'Bank Interest Income',                  0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (166,  11, 'Xerox Machine',                         0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (167,  11, 'Camera',                                0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (168,  11, 'Lab Equipment',                         0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (169, 107, 'Interest Paid',                         0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (170, 100, 'Depreciation-Xerox Machine',            0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (171, 100, 'Depreciation-Camera',                   0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (172, 100, 'Depreciation-Lab Equipment',            0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (173, 100, 'Depreciation-Air Conditioner',          0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (174,  11, 'Air Conditioner',                       0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (175,  21, 'Term Loan-3',                           0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL),
    (176,  43, 'Fixed Deposit with CBSE',               0.00,0.00,0.00,NULL,'N',NULL,  1,NULL,NULL);
UNLOCK TABLES;


###########################
##  TRANSACTION-HEADER   ##
###########################
SELECT 'trnHeader';
DROP TABLE IF EXISTS trnHeader;
CREATE TABLE IF NOT EXISTS trnHeader(
    trn_slno                INT(8)          NOT NULL AUTO_INCREMENT,
    vtype_id                INT(6)          NOT NULL REFERENCES vtype(vtype_id),
    trn_no                  INT(8)          NOT NULL,
    manual_trn_no           VARCHAR(15),
    trn_date                DATE            NOT NULL,
    trn_narration           VARCHAR(200),
    user_id                 INT(6)          NOT NULL REFERENCES userList(user_id),
    last_update             TIMESTAMP,
    del                     ENUM('*'),
    PRIMARY KEY(trn_slno)
);


###########################
##  TRANSACTION-DETAIL   ##
###########################
SELECT 'trnDetail';
DROP TABLE IF EXISTS trnDetail;
CREATE TABLE IF NOT EXISTS trnDetail(
    slno                    INT(8)          NOT NULL AUTO_INCREMENT,
    vtype_id                INT(6)          NOT NULL REFERENCES vtype(vtype_id),
    trn_slno                INT(8)          NOT NULL REFERENCES trnHeader(trn_slno),
    trn_slno_slno           INT(6)          NOT NULL,
    trn_type                ENUM('D','C')   NOT NULL,
    gl_code                 INT(6)          NOT NULL REFERENCES gl(gl_code),
    lfno                    VARCHAR(15),
    debit_amt               DOUBLE(12,2)    DEFAULT 0.00,
    credit_amt              DOUBLE(12,2)    DEFAULT 0.00,
    user_id                 INT(6)          NOT NULL REFERENCES userList(user_id),
    last_update             TIMESTAMP,
    del                     ENUM('*'),
    PRIMARY KEY(slno)
);


##################
##   BANK-MSI   ##
##################
SELECT 'bank_msi';
DROP TABLE IF EXISTS bank_msi;
CREATE TABLE IF NOT EXISTS bank_msi(
    bank_msi_id             INT(6)          NOT NULL AUTO_INCREMENT,
    academic_year           VARCHAR(10)     NOT NULL,
    full_path_name          VARCHAR(150)    NOT NULL,
    file_name               VARCHAR(100)    NOT NULL,
    work_sheet              VARCHAR(50)     NOT NULL,
    total_rows              INT(6)          DEFAULT 0,
    rows_updated            INT(6)          DEFAULT 0,
    upload_flag             ENUM('N','Y')   NOT NULL DEFAULT 'N',
    user_id                 INT(6)          NOT NULL REFERENCES userList(user_id),
    last_update             TIMESTAMP,
    del                     ENUM('*'),
    PRIMARY KEY(bank_msi_id)
);
CREATE UNIQUE INDEX bank_msi_file_name_work_sheet ON bank_msi(file_name,work_sheet);
CREATE INDEX bank_msi_full_path_name ON bank_msi(full_path_name);


#########################
##   BANK-COLLECTION   ##
#########################
SELECT 'bank_collection';
DROP TABLE IF EXISTS bank_collection;
CREATE TABLE IF NOT EXISTS bank_collection(
    collection_id           INT(6)                      NOT NULL AUTO_INCREMENT,
    bank_msi_id             INT(6)                      NOT NULL REFERENCES bank_msi(bank_msi_id),
    receipt_date            DATE                        NOT NULL,
    academic_year           VARCHAR(10)                 NOT NULL,
    transaction_no          VARCHAR(12),
    sol_id                  VARCHAR(10),
    admission_no            VARCHAR(30),
    student_uid             VARCHAR(12),
    excel_name              VARCHAR(50),
    excel_class             VARCHAR(30),
    excel_section           VARCHAR(30),
    excel_fees_span         VARCHAR(30),
    student_name            VARCHAR(50),
    class_desc              VARCHAR(30),
    section_code            VARCHAR(30),
    student_rollno          INT(8),
    computer                ENUM('N','Y')               NOT NULL DEFAULT 'Y',
    fees_span               ENUM('M','B','Q','H','Y')   NOT NULL DEFAULT 'Q',
    fees_span_no            INT(2)                      NOT NULL DEFAULT 0,
    amount                  DOUBLE(10,2)                NOT NULL,
    due_amount              DOUBLE(10,2)                DEFAULT 0.00,
    late_fees_amount        DOUBLE(10,2)                DEFAULT 0.00,
    difference_amount       DOUBLE(10,2)                DEFAULT 0.00,
    transaction_mode        VARCHAR(20),
    cheque_no               VARCHAR(20),
    cheque_date             DATE,
    authorised_flag         VARCHAR(20),
    clearance_flag          VARCHAR(20),
    branch_name             VARCHAR(50),
    update_flag             ENUM('N','Y')               NOT NULL DEFAULT 'N',
    select_flag             ENUM('N','Y')               NOT NULL DEFAULT 'Y',
    user_id                 INT(6)                      NOT NULL REFERENCES userList(user_id),
    last_update             TIMESTAMP,
    del                     ENUM('*'),
    PRIMARY KEY(collection_id)
);


##########################################
##   ADMISSION-REGD + CLASS-PROMOTION   ##
##########################################
#CREATE OR REPLACE VIEW admission_regd_view AS SELECT a.admission_slno,a.admission_no,a.student_uid,a.academic_year,a.form_no,a.admission_date,a.admission_class,a.student_name,a.student_surname,a.gender,a.dob_day,a.dob_month,a.dob_year,a.dob_words,a.birth_place,a.age,a.age_year,a.age_month,a.age_days,a.second_language,a.nationality,a.religion,a.denomination,a.mother_tongue,a.category_abbr,a.prev_school,a.prev_class,a.prev_tcno,a.blood_group,a.mother_name,a.mother_school,a.mother_school_place,a.mother_college,a.mother_college_place,a.mother_category,a.mother_qualif,a.mother_prof,a.mother_designation,a.mother_department,a.mother_ins_org_comp,a.father_name,a.father_school,a.father_school_place,a.father_college,a.father_college_place,a.father_category,a.father_qualif,a.father_prof,a.father_designation,a.father_department,a.father_ins_org_comp,a.guardian_name,a.guardian_qualif,a.guardian_prof,a.guardian_address,a.guardian_mobile,a.permanent_address,a.permanent_village,a.permanent_post,a.permanent_ps,a.permanent_dist,a.permanent_state,a.permanent_country,a.permanent_pin,a.present_address,a.present_village,a.present_post,a.present_ps,a.present_dist,a.present_state,a.present_country,a.present_pin,a.present_landline_no_1,a.present_landline_no_2,a.present_mobile_1,a.present_mobile_2,a.present_mobile_3,a.present_email_1,a.present_email_2,a.declaration,a.attach_passport_photo,a.attach_birth_certificate,a.attach_tc,a.attach_mark_sheet,a.attach_caste_certificate,a.attach_original_receipt,a.sign_mother,a.sign_father,a.sign_gardian,a.sign_candidate,a.undertaking_sign_mother,a.undertaking_sign_father,a.sign_date,a.sign_place,a.status,a.user_id,a.last_update,a.del,c.academic_year AS last_academic_year,c.class_promoted,c.student_rollno,c.section_code FROM admission_regd AS a LEFT JOIN class_promotion AS c ON (a.student_uid=c.student_uid AND c.promotion_slno=(SELECT MAX(p.promotion_slno) FROM class_promotion AS p WHERE a.student_uid=p.student_uid)) WHERE a.del IS NULL ORDER BY a.student_uid;


##############################
##   SMS-SERVICE_PROVIDER   ##
##############################
SELECT 'sms_service_provider';
DROP TABLE IF EXISTS sms_service_provider;
CREATE TABLE IF NOT EXISTS sms_service_provider(
    sms_control_id              INT(6)                  NOT NULL AUTO_INCREMENT,
    sms_active                  ENUM('N','Y')           NOT NULL,
    sms_username                VARCHAR(50),
    sms_password                VARCHAR(50),
    sms_authentication_key      VARCHAR(50),
    sms_sender_id               VARCHAR(6),
    sms_flash_message           VARCHAR(10),
    sms_route                   VARCHAR(20),
    sms_main_url                VARCHAR(200),
    sms_algorithm               INT(2)                  NOT NULL,
    total_sms                   INT(8)                  DEFAULT 0,
    balance_sms                 INT(8)                  DEFAULT 0,
    sms_date_effective_from     DATE,
    sms_date_effective_to       DATE,
    user_id                     INT(6)                  NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(sms_control_id)
);
INSERT INTO sms_service_provider VALUE
    ( 1, 'N', 'milan76',    '12345',        '86333AgSgrVRsR558cebb8', 'GEMSBS', 'n/a', 'template', 'http://54.254.154.166/sendhttp.php?',           1, 00000, 00000, '2015-08-03', NULL, 1, NULL, NULL),
    ( 2, 'N', 'milan76',    '12345',        '86333AgSgrVRsR558cebb8', 'GEMSBS', 'n/a', 'template', 'http://54.254.154.166/api/postsms.php',         2,  7000,  1121, '2015-08-03', NULL, 1, NULL, NULL),
    ( 3, 'Y', 'milandas',   'syed54321',    '3560043EC1DA6A',         'GEMSBS', '0',   '5',        'http://111.118.182.63/app/smsapi/index.php',    3, 53000, 52998, '2015-08-03', NULL, 1, NULL, NULL);


##############################
##   SMS-MESSAGE-CATEGORY   ##
##############################
SELECT 'sms_category';
DROP TABLE IF EXISTS sms_category;
CREATE TABLE IF NOT EXISTS sms_category(
    sms_category_id             INT(6)                  NOT NULL AUTO_INCREMENT,
    sms_category_key            CHAR(1)                 NOT NULL UNIQUE,
    sms_category_desc           VARCHAR(30)             NOT NULL UNIQUE,
    user_id                     INT(6)                  NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(sms_category_id)
);
INSERT INTO sms_category VALUES
    ( 1, 'P', 'Parent',     1, NULL, NULL),
    ( 2, 'S', 'Student',    1, NULL, NULL),
    ( 3, 'T', 'Teacher',    1, NULL, NULL),
    ( 4, 'F', 'Staff',      1, NULL, NULL),
    ( 5, 'R', 'Principal',  1, NULL, NULL),
    ( 6, 'C', 'Chairman',   1, NULL, NULL),
    ( 7, 'M', 'Management', 1, NULL, NULL),
    ( 9, 'E', 'Trustee',    1, NULL, NULL);


#######################
##   SMS-VARIABLES   ##
#######################
SELECT 'sms_variables';
DROP TABLE IF EXISTS sms_variables;
CREATE TABLE IF NOT EXISTS sms_variables(
    sms_variable_id             INT(6)                  NOT NULL AUTO_INCREMENT,
    sms_variable_name           VARCHAR(30)             NOT NULL UNIQUE,
    sms_variable_value          VARCHAR(100),
    user_id                     INT(6)                  NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(sms_variable_id)
);
INSERT INTO sms_variables VALUES
    ( 1, 'school',                  'GEMS',                 1, NULL, NULL),
    ( 2, 'address',                 'Dumduma',              1, NULL, NULL),
    ( 3, 'telephone_no',            '9778911223',           1, NULL, NULL),
    ( 4, 'admission_last_date',     '30 June 2015',         1, NULL, NULL),
    ( 5, 'admission_amt',           '30,000',               1, NULL, NULL),
    ( 6, 'open_date',               '25 May 2015',          1, NULL, NULL),
    ( 7, 'meeting_time',            '9 am and 12 pm',       1, NULL, NULL),
    ( 8, 'issue_date',              '25 May, 2015',         1, NULL, NULL),
    ( 9, 'amount',                  '9,000',                1, NULL, NULL),
    (10, 'a',                       '',                     1, NULL, NULL),
    (11, 'b',                       '',                     1, NULL, NULL),
    (12, 'c',                       '',                     1, NULL, NULL),
    (13, 'd',                       '',                     1, NULL, NULL),
    (14, 'e',                       '',                     1, NULL, NULL),
    (15, 'f',                       '',                     1, NULL, NULL);


###########################
##   SMS-MESSAGE-GROUP   ##
###########################
SELECT 'sms_message_group';
DROP TABLE IF EXISTS sms_message_group;
CREATE TABLE IF NOT EXISTS sms_message_group(
    sms_message_group_id        INT(6)                  NOT NULL AUTO_INCREMENT,
    sms_message_group_desc      VARCHAR(100)            NOT NULL UNIQUE,
    sms_category_key            CHAR(1)                 NOT NULL REFERENCES sms_category(sms_category_key),
    user_id                     INT(6)                  NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(sms_message_group_id)
);
INSERT INTO sms_message_group VALUES
    ( 1, 'Admission Messages',                          'P', 1, NULL, NULL),
    ( 2, 'After Admission Messages',                    'P', 1, NULL, NULL),
    ( 3, 'RTE (Right to Education) Messages',           'P', 1, NULL, NULL),
    ( 4, 'Attendance/Behavior Messages',                'P', 1, NULL, NULL),
    ( 5, 'Meeting Messages',                            'P', 1, NULL, NULL),
    ( 6, 'Transport Messages',                          'P', 1, NULL, NULL),
    ( 7, 'Fees Messages',                               'P', 1, NULL, NULL),
    ( 8, 'Holiday Messages',                            'P', 1, NULL, NULL),
    ( 9, 'Competition/Sports/Trip/Function Messages',   'P', 1, NULL, NULL),
    (10, 'Test/Exam/Result Messages (Parent)',          'P', 1, NULL, NULL),
    (11, 'Test/Exam/Result Messages (Teacher)',         'T', 1, NULL, NULL),
    (12, 'Birthday Wishes',                             'S', 1, NULL, NULL),
    (13, 'Notice',                                      'P', 1, NULL, NULL),
    (14, 'Accidental Mishap',                           'P', 1, NULL, NULL),
    (15, 'Promotional Messages',                        'P', 1, NULL, NULL);


##########################
##   SMS-MESSAGE-TEXT   ##
##########################
SELECT 'sms_message_text';
DROP TABLE IF EXISTS sms_message_text;
CREATE TABLE IF NOT EXISTS sms_message_text(
    sms_message_text_id         INT(6)                  NOT NULL AUTO_INCREMENT,
    sms_message_text_desc       VARCHAR(200)            NOT NULL,
    sms_message_group_id        INT(6)                  NOT NULL REFERENCES sms_message_group(sms_message_group_id),
    user_id                     INT(6)                  NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(sms_message_text_id)
);
INSERT INTO sms_message_text VALUES
    (  1, 'Admissions open for the academic year 2015-16 in #school#. For details contact #telephone_no#. Hurry! Only few seats left',                                                                             15, 1, NULL, NULL),
    (  2, 'Dear Parent, you are requested to submit the admission form along with the registration fees before #admission_last_date# -#school#',                                                                    1, 1, NULL, NULL),
    (  3, 'Dear Parent, visit the school between #meeting_time# and confirm the admission by paying the fees Rs.#admission_amt#. -#school#, #address#',                                                             1, 1, NULL, NULL),
    (  4, 'Dear Parent, school opens for your ward on #open_date#. Kindly visit school and receive the School Kit -#school#',                                                                                       1, 1, NULL, NULL),
    (  5, 'Dear Parent, kindly collect the School Kit on #issue_date# by paying the Rs.#amount#/-. -#school#, #address#',                                                                                           1, 1, NULL, NULL),
    (  6, 'Dear Parent, updates related to your ward and school will be sent to you via SMS. -#school#, #address#',                                                                                                 2, 1, NULL, NULL),
    (  7, 'Dear Parent, kindly collect the books which will be distributed on 20 May, 2015 from 9 am to 12 pm. -#school#, #address#',                                                                               2, 1, NULL, NULL),
    (  8, 'Dear Parent, email your concerns and suggestions related to your ward and school to school’s email-id -#school#, #address#',                                                                             2, 1, NULL, NULL),
    (  9, 'Dear Parent, you are requested to abide by the school timings. Kindly drop your ward 5 minutes before the school starts and pick up your child when school is over. -#school#, #address#',               2, 1, NULL, NULL),
    ( 10, 'Dear Parent, Homework for Class 1 is SS-Ln-4 Q&A, write 3 times. Make sure your ward is completing the homework regularly. -#school#, #address#',                                                        2, 1, NULL, NULL),
    ( 11, 'RTE Parents, bring all original documents of your child for RTE application verification on 13.02.2015@ 11am. -#school#, #address#',                                                                     3, 1, NULL, NULL),
    ( 13, 'Your ward was absent today WITHOUT PRIOR INFORMATION. Please send your ward with the Leave Letter. -#school#, #address#',                                                                                4, 1, NULL, NULL),
    ( 14, 'Dear Parent, kindly attend the Parent-Teacher Meeting scheduled on 23 June 2015 from 9 am to 12 pm. -#school#, #address#',                                                                               5, 1, NULL, NULL),
    ( 15, 'Dear Parent, Kindly pay school bus fees Rs. 2000. -Vidya1 School, Mahim, Mumbai',                                                                                                                        6, 1, NULL, NULL),
    ( 16, 'Dear Parent, Mr.Shekil (Bus 3 driver) has resigned from our school. This is for your kind information. -#school#, #address#',                                                                            6, 1, NULL, NULL),
    ( 17, 'Dear Parent, school bus will be late today due to traffic jam at KR Circle. -#school#, #address#',                                                                                                       6, 1, NULL, NULL),
    ( 18, 'Dear Parent, you are requested to pay the school fees before 23 July, 2015. Ignore if already paid. -#school#, #address#',                                                                               7, 1, NULL, NULL),
    ( 19, 'Your ward’s next fee installment is due on 23 July, 2015. Kindly pay before 23 July, 2015. Ignore if already paid. -#school#, #address#',                                                                7, 1, NULL, NULL),
    ( 20, 'Dear Parent, 26 Jan, 2015 will be holiday on occasion of Republic Day. -#school#, #address#',                                                                                                            8, 1, NULL, NULL),
    ( 21, 'Dear Parent, school remains closed on 28 Jan, 2015 due to Bharath Bandh. -#school#, #address#',                                                                                                          8, 1, NULL, NULL),
    ( 22, 'Dear Parent, Summer vacation starts from 01 Apr, 2015. School reopens on 25 May, 2015. -#school#, #address#',                                                                                            8, 1, NULL, NULL),
    ( 23, 'Dear Parent, school reopens on 25 May, 2015 after Summer vacation. Attendance on the first day is mandatory. -#school#, #address#',                                                                      8, 1, NULL, NULL),
    ( 24, 'Dear Parent, warm welcome to The Sports Day 2015 to be held on 26 Dec, 2015. -#school#, #address#',                                                                                                      9, 1, NULL, NULL),
    ( 25, 'Dear Parent, Colouring Competition will be held on 20 Nov, 2015, 10 am at School Premises. -#school#, #address#',                                                                                        9, 1, NULL, NULL),
    ( 26, 'Dear Parent, Picnic to Golden Resorts has been organized for the Class 8th. Interested students pay the amount Rs. 500 to their respective class teachers. -#school#, #address#',                        9, 1, NULL, NULL),
    ( 27, 'Dear Parent, Time Table of the II Round Test has been sent with your ward. -#school#, #address#',                                                                                                       10, 1, NULL, NULL),
    ( 28, 'Dear Parent, we wish your ward All The Best for the SSLC Exam. -#school#, #address#',                                                                                                                   10, 1, NULL, NULL),
    ( 29, 'Dear Parent, your ward’s II Round Test marks details are Eng:78, Sci:89, SS:65. -#school#, #address#',                                                                                                  10, 1, NULL, NULL),
    ( 30, 'Dear Teacher, you have Departmental Meeting today at 4:00pm. Principal, -#school#, #address#',                                                                                                          11, 1, NULL, NULL),
    ( 31, 'Dear Teacher, you have GTU Examination Duty on 23 Mar, 2015. Please be present in staff room at 8:30 am. -#school#, #address#',                                                                         12, 1, NULL, NULL);


#########################
##   SMS-MESSAGE-LOG   ##
#########################
SELECT 'sms_log';
DROP TABLE IF EXISTS sms_log;
CREATE TABLE IF NOT EXISTS sms_log(
    sms_log_id                  INT(10)                 NOT NULL AUTO_INCREMENT,
    sms_date                    DATE                    NOT NULL,
    sms_message_text_desc       VARCHAR(200)            NOT NULL,
    mobile_no                   VARCHAR(12)             NOT NULL,
    user_id                     INT(6)                  NOT NULL REFERENCES userList(user_id),
    last_update                 TIMESTAMP,
    del                         ENUM('*'),
    PRIMARY KEY(sms_log_id)
);


#####################
##   UDF INITCAP   ##
#####################
DELIMITER $$

DROP FUNCTION IF EXISTS initcap$$
CREATE FUNCTION initcap(x char(100)) RETURNS char(100) CHARSET utf8
BEGIN
    SET @str='';
    SET @l_str='';
    WHILE x REGEXP ' ' DO
        SELECT SUBSTRING_INDEX(x, ' ', 1) INTO @l_str;
        SELECT SUBSTRING(x, LOCATE(' ', x)+1) INTO x;
        SELECT CONCAT(@str, ' ', CONCAT(UPPER(SUBSTRING(@l_str,1,1)),LOWER(SUBSTRING(@l_str,2)))) INTO @str;
    END WHILE;
    RETURN LTRIM(CONCAT(@str, ' ', CONCAT(UPPER(SUBSTRING(x,1,1)),LOWER(SUBSTRING(x,2)))));
END$$

DELIMITER;
#############
##   End   ##
#############
