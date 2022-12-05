#########################################
#########################################
#########################################
#######                           #######
#######  PHARMA_STOCK_ACCOUNT     #######
#######         DATABASE          #######
#######                           #######
#######                           #######
#########################################
#########################################
#########################################



###################################
###                       		###
###   DATABASE stock_account	###
###                       		###
###################################
SELECT "DATABASE stock_accounting";
DROP DATABASE IF EXISTS stock_accounting;
CREATE DATABASE stock_accounting;
USE stock_accounting;


#############################
###                       ###
###       TABLE user      ###
###                       ###
#############################
SELECT "TABLE user";
DROP TABLE IF EXISTS user;
CREATE TABLE user(
	user_id 				INT(6)				NOT NULL AUTO_INCREMENT,
	user_name				VARCHAR(100)		NOT NULL UNIQUE,
	last_update				TIMESTAMP,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(user_id)
);
INSERT INTO user VALUES
	(1, 'Administrator', NULL, NULL),
	(2, 'Operator',      NULL, NULL);


#########################
###                   ###
###    TABLE config   ###
###                   ###
#########################
SELECT "config";
DROP TABLE IF EXISTS config;
CREATE TABLE config(
	id						INT(6)							NOT NULL AUTO_INCREMENT,
	company_name            VARCHAR(100)					NOT NULL,
	company_usp             VARCHAR(100),
	company_address			VARCHAR(200),
	gst_no					VARCHAR(100),
	dl_no					VARCHAR(100),
	user_id					INT(6)							NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP,
    del                		ENUM("*")						DEFAULT NULL,
    PRIMARY KEY(party_id)
);
INSERT INTO config VALUES
	(1, 'I-Hub Pvt Ltd', 'Health is Wealth', NULL, NULL, NULL, 1, NULL, NULL);


########################
###                  ###
###    TABLE party   ###
###                  ###
########################
SELECT "party";
DROP TABLE IF EXISTS party;
CREATE TABLE party(
	party_id				INT(6)							NOT NULL AUTO_INCREMENT,
	party_name				VARCHAR(100)					NOT NULL,
	party_type              ENUM('Buyer','Supplier')		NOT NULL,
	address                 VARCHAR(100),
	shiping_address         VARCHAR(100),
	gst_no					VARCHAR(20)                     NOT NULL,
	dl_no					VARCHAR(20)                     NOT NULL,
	mobile_no               VARCHAR(20),
	land_phone_no           VARCHAR(20),
	user_id					INT(6)							NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP,
    del                		ENUM("*")						DEFAULT NULL,
    PRIMARY KEY(party_id)
);
INSERT INTO party VALUES
	# Supplier
	(1, 'Jagabandhu Medical',		'Supplier',	'PLOT NO.B-5, Sahid Nagar, Bhubaneshwar 751007',					 NULL, NULL, NULL, '', '', 1, NULL, NULL),
	(2, 'Jayant Pharmaceuticals',	'Supplier', 'Plot No.- 40 EAST, Janpath Road, Ashok Nagar, Bhubaneshwar 751009', NULL, NULL, NULL, '', '', 1, NULL, NULL),
	(3, 'Bajoria Enterprisers',		'Supplier', ' Jaunliapatti, Cuttack 753009',									 NULL, NULL, NULL, '', '', 1, NULL, NULL),
	# Buyer
	(1001, 'Maa Tarini Medical',		'Buyer', 'Bhubaneswar',	NULL, NULL, NULL, '', '', 1, NULL, NULL),
	(1002, 'Sobhagya Drug House',		'Buyer', 'Bhubaneswar',	NULL, NULL, NULL, '', '', 1, NULL, NULL),
	(1003, 'Medicare Pharmaceuticals',	'Buyer', 'Bhubaneswar',	NULL, NULL, NULL, '', '', 1, NULL, NULL),
	(1004, 'Panda Medicine Store',		'Buyer', 'Bhubaneswar',	NULL, NULL, NULL, '', '', 1, NULL, NULL);


#############################
###                       ###
###  TABLE product_group  ###
###                       ###
#############################
SELECT "TABLE product_group";
DROP TABLE IF EXISTS product_group;
CREATE TABLE product_group(
    pgroup_id             	INT(10)             NOT NULL AUTO_INCREMENT,
    pgroup_name           	VARCHAR(100)        NOT NULL UNIQUE,
    pgroup_abbr           	VARCHAR(100)        NOT NULL UNIQUE,
	user_id					INT(6)				NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(pgroup_id)
);
INSERT INTO product_group VALUES
    ( 1,	"Abort India",                	"ABORT",      	1, NULL, NULL),
    ( 2,    "Torrent Pharmaceuticals",    	"TORRENT",    	1, NULL, NULL),
    ( 3,    "Dr. Reddy Laboratories",     	"REDDY",      	1, NULL, NULL),
    ( 4,    "Divis Laboratories Ltd.",    	"DIVIS",      	1, NULL, NULL),
    ( 5,    "Sun Pharmaceuticals Ltd.",   	"SUN",        	1, NULL, NULL),
    ( 6,    "Aurobindo Pharma Ltd.",      	"AUROBINDO",  	1, NULL, NULL),
    ( 7,    "Glenmark Pharmacist",       	"GLENMARK",   	1, NULL, NULL),
    ( 8,    "Mankind Pharma",            	"MANKIND",    	1, NULL, NULL),
    ( 9,    "Glaxo Pharmaceuticals",     	"Glaxo",      	1, NULL, NULL),
    (10,    "Cipla Ltd.",                	"Cipla",       	1, NULL, NULL);


##############################
###                        ###
###     TABLE product      ###
###                        ###
##############################
SELECT "TABLE product";
DROP TABLE IF EXISTS product;
CREATE TABLE product(
    product_id          	INT(6)              DEFAULT NULL AUTO_INCREMENT,
    pgroup_id           	INT(6)              REFERENCES product_group(pgroup_id),
    product_name        	VARCHAR(100)        NOT NULL UNIQUE,
    taxfree             	ENUM('N','Y')       DEFAULT NULL,
	user_id					INT(6)				NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(product_id)
);
INSERT INTO product VALUES
    ( 1,  1,	"A-Derma Dermalibour Plus Foaming Gel",              			"N",    1,	NULL, NULL),
    ( 2,  1,   	"A-Derma Epitheliale A.H Duo Cream",                        	"N",    1,	NULL, NULL),
    ( 3,  1,   	"A-Derma Exomega Emollient Cream",                          	"N",    1,	NULL, NULL),
    ( 4,  1,   	"A-Derma Protect Fluid Cream SPF 50+",                      	"N",    1,	NULL, NULL),
    ( 5,  1,   	"ADVACORT 6MG TABLET",                                      	"N",    1,	NULL, NULL),
    ( 6,  1,   	"Abact 250mg Tablet",                                       	"N",    1,	NULL, NULL),
    ( 7,  1,   	"Abamlo 5 Tablet",                                          	"N",    1,	NULL, NULL),
    ( 8,  1,   	"Abbott Gel Hand Sanitizer",                                	"N",    1,	NULL, NULL),
    ( 9,  1,   	"Abbott Panbio Covid 19 Antigen Self Test Kit",             	"N",    1,	NULL, NULL),
    (10,  1,  	"Abbott Supra Rize Cholecalciferol USP 60,000IU Capsule",    	"N",    1,	NULL, NULL),
    (11,  1,  	"Abetorox 60 Tablet",                                        	"N",    1,	NULL, NULL),
    (12,  1,  	"Abixim 200mg Tablet",                                       	"N",    1,	NULL, NULL),
    (13,  1,  	"Abmetop 50 XL Tablet",                                      	"N",    1,	NULL, NULL),
    (14,  1,  	"Abnib 250mg Tablet",                                        	"N",    1,	NULL, NULL),
    (15,  1,  	"Abocal 500 Tablet",                                        	"N",    1,	NULL, NULL),
    (16,  1,  	"Abtelmi-Amh Tablet",                                       	"N",    1,	NULL, NULL),
    (17,  1,  	"Abtorsmed 10 Tablet",                                       	"N",    1,	NULL, NULL),
    (18,  1,  	"Abturbi Cream",                                             	"N",    1,	NULL, NULL),
	#
	(19,  2,    "Abatitor 250mg Tablet",                                        "N",    1,	NULL, NULL),
	(20,  2,    "Acegesic 100 mg/325 mg Tablet",                                "N",    1,	NULL, NULL),
	(21,  2,    "Acnex 10mg Capsule",                                           "N",    1,	NULL, NULL),
	(22,  2,    "Acyclosure TH 8 Tablet",                                       "N",    1,	NULL, NULL),
	(23,  2,    "Adfrar Injection",                                             "N",    1,	NULL, NULL),
	(24,  2,    "Afoglip M 1000 Tablet ER",                                     "N",    1,	NULL, NULL),
	(25,  2,    "Afoglip M 500 Tablet ER",                                      "N",    1,	NULL, NULL),
	(26,  2,    "Agotine 25mg Tablet",                                          "N",    1,	NULL, NULL),
	(27,  2,    "Ahaglow Advanced Skin Rejuvenating Face Wash",                 "N",    1,	NULL, NULL),
	(28,  2,    "Ahaglow Advanced Skin Rejuvenating Face Wash",                 "N",    1,	NULL, NULL),
	(29,  2,    "Ahaglow Advanced Skin Rejuvenating Face Wash",                 "N",    1,	NULL, NULL),
	(30,  2,    "Ahaglow S Foaming Face Wash",                                  "N",    1,	NULL, NULL),
	(31,  2,    "Ahaglow S Foaming Face Wash",                                  "N",    1,	NULL, NULL),
	(32,  2,    "Allerfex 120mg Tablet",                                        "N",    1,	NULL, NULL),
	(33,  2,    "Alprax 0.25 Tablet",                                           "N",    1,	NULL, NULL),
	(34,  2,    "Alprax 0.5mg Tablet",                                          "N",    1,	NULL, NULL),
	(35,  2,    "Alprax 1mg Tablet SR",                                         "N",    1,	NULL, NULL),
	(36,  2,    "Alprax Plus Tablet SR",                                        "N",    1,	NULL, NULL),
	(37,  2,    "Altipod 100mg Tablet DT",                                      "N",    1,	NULL, NULL),
	(38,  2,    "Altipod CV 100mg/62.5mg Tablet DT",                            "N",    1,	NULL, NULL),
	(39,  2,    "Amazeo 100 Tablet",                                            "N",    1,	NULL, NULL),
	(40,  2,    "Amazeo 200 Tablet",                                            "N",    1,	NULL, NULL),
	(41,  2,    "Amazeo OD 50mg Tablet",                                        "N",    1,	NULL, NULL),
	(42,  2,    "Ambiz 10mg Tablet",                                            "N",    1,	NULL, NULL),
	(43,  2,    "Amifru 40 Tablet",                                             "N",    1,	NULL, NULL),
	(44,  2,    "Amlocor 10mg Tablet",                                          "N",    1,	NULL, NULL),
	(45,  2,    "Amlocor 5mg Tablet",                                           "N",    1,	NULL, NULL),
	(46,  2,    "Ampoxin LB Capsule",                                           "N",    1,	NULL, NULL),
	(47,  2,    "Ampoxin-CV 200mg/28.5mg Suspension",                           "N",    1,	NULL, NULL),
	(48,  2,    "Androz 25mg Tablet",                                           "N",    1,	NULL, NULL),
	(49,  2,    "Androz 50mg Tablet",                                           "N",    1,	NULL, NULL),
	(50,  2,    "Angiopril 25mg Tablet",                                        "N",    1,	NULL, NULL),
	(51,  2,    "Anticox 4 Kit",                                             	"N",    1,	NULL, NULL),
	(52,  2,    "Anticox II 450 mg/300 mg Tablet",                              "N",    1,	NULL, NULL),
	(53,  2,    "Anticox Z 450 mg/300 mg/750 mg Tablet",                        "N",    1,	NULL, NULL),
	(54,  2,    "Anxipar 0.25mg Tablet",                                        "N",    1,	NULL, NULL),
	(55,  2,    "Arip MT 20 Tablet",                                            "N",    1,	NULL, NULL),
	(56,  2,    "Arip MT 30 Tablet",                                            "N",    1,	NULL, NULL),
	(57,  2,    "Arkamin H Tablet",                                             "N",    1,	NULL, NULL),
	(58,  2,    "Aroff 200mg Tablet SR",                                        "N",    1,	NULL, NULL),
	(59,  2,    "Asthafen Syrup",                                             	"N",    1,	NULL, NULL),
	(60,  2,    "Asthafen Tablet",                                             	"N",    1,	NULL, NULL),
	(61,  2,    "Asthesia Cream",                                             	"N",    1,	NULL, NULL),
	(62,  2,    "Atlura 40 Tablet",                                             "N",    1,	NULL, NULL),
	(63,  2,    "Atlura 80 Tablet",                                             "N",    1,	NULL, NULL),
	(64,  2,    "Atmost 50mg Tablet",                                           "N",    1,	NULL, NULL),
	(65,  2,    "Azibold 100mg/5ml Syrup",                                      "N",    1,	NULL, NULL),
	(66,  2,    "Azisuper 100mg Suspension",                                    "N",    1,	NULL, NULL),
	(67,  2,    "Azisuper 500mg Tablet",                                        "N",    1,	NULL, NULL),
	(68,  2,    "Azona 20mg Capsule",                                           "N",    1,	NULL, NULL);


#############################
###                       ###
###     TABLE rack        ###
###                       ###
#############################
SELECT "TABLE rack";
DROP TABLE IF EXISTS rack;
CREATE TABLE rack(
    rack_id            		INT(6)           	NOT NULL AUTO_INCREMENT,
    rack_desc          		VARCHAR(50)      	NOT NULL,
    rack_no            		VARCHAR(10)       	NOT NULL,
	user_id					INT(6)				NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(rack_id)
);
INSERT INTO rack VALUES
    ( 1,	"Room-1, Rack-1, Self-1",		"I-1-1",	  1,	NULL, NULL),
    ( 2,    "Room-1, Rack-1, Self-2",    	"I-1-2",      1,	NULL, NULL),
    ( 3,    "Room-1, Rack-1, Self-3",    	"I-1-3",      1,	NULL, NULL),
    ( 4,    "Room-1, Rack-1, Self-4",    	"I-1-4",      1,	NULL, NULL),
    ( 5,    "Room-1, Rack-2, Self-1",    	"I-2-1",      1,	NULL, NULL),
    ( 6,    "Room-1, Rack-2, Self-2",    	"I-2-2",      1,	NULL, NULL),
    ( 7,    "Room-1, Rack-2, Self-3",    	"I-2-3",      1,	NULL, NULL),
    ( 8,    "Room-1, Rack-2, Self-4",    	"I-2-4",      1,	NULL, NULL),
    ( 9,    "Room-1, Rack-3, Self-1",    	"I-3-1",      1,	NULL, NULL),
    (10,    "Room-1, Rack-3, Self-2",    	"I-3-2",      1,	NULL, NULL);


#############################
###                       ###
###     TABLE trn_type    ###
###                       ###
#############################
SELECT "TABLE trn_type";
DROP TABLE IF EXISTS trn_type;
CREATE TABLE trn_type(
    trn_type_id            	INT(20)           	NOT NULL AUTO_INCREMENT,
    trn_type_desc          	VARCHAR(100)      	NOT NULL,
    operation_type         	ENUM('+','-','=')   NOT NULL,
	user_id					INT(6)				NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(trn_type_id)
);
INSERT INTO trn_type VALUES
    (1,    "Purchase",          "+",	1,	NULL, NULL),
    (2,    "Sales Return",      "+",    1,	NULL, NULL),
    (3,    "Sample",            "+",    1,	NULL, NULL),
    (4,    "Sales",             "-",    1,	NULL, NULL),
    (5,    "Purchase Return",   "-",    1,	NULL, NULL),
    (6,    "Damage",            "-",    1,	NULL, NULL),
    (7,    "Expire",            "-",    1,	NULL, NULL),
    (8,    "Theft",             "-",    1,	NULL, NULL);


#############################
###                       ###
###     TABLE stock       ###
###                       ###
#############################
SELECT "TABLE stock";
DROP TABLE IF EXISTS stock;
CREATE TABLE stock(
    product_id         		INT(30)           	NOT NULL AUTO_INCREMENT,
    batch_no           		VARCHAR(7)       	NOT NULL,
    exp_date           		VARCHAR(7)       	NOT NULL,
    mfg_date           		VARCHAR(7)       	NOT NULL,
    rate_purchase      		DOUBLE(10,2)      	DEFAULT 0.00,
    rate_sale          		DOUBLE(10,2)        NOT NULL,
    rate_mrp           		DOUBLE(5)           NOT NULL,
    qty_balance        		DOUBLE(12,3)        NOT NULL,
	user_id					INT(6)				NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(product_id)
);
INSERT INTO stock VALUES
    (1,     "EZ0316",      "03/2024",      "02/2022",        59.00,       65.00,      75.00,      100,     1,	NULL, NULL);


#############################
###                       ###
###    TABLE trn_header   ###
###                       ###
#############################
SELECT "trn_header";
DROP TABLE IF EXISTS trn_header;
CREATE TABLE trn_header(
	trn_slno				INT(10)				NOT NULL AUTO_INCREMENT,
	trn_date				DATE				NOT NULL,
	trn_no                  INT(10)             NOT NULL,
	trn_type				INT(6)				NOT NULL REFERENCES trn_type(trn_type_id),
	party_id				INT(6)				NOT NULL REFERENCES party(party_id),
	trn_amount              DOUBLE(12,2)        DEFAULT 0.00,
	trn_tax_amount
	trn_disc_amount

	user_id					INT(6)				NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP			DEFAULT NULL,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(trn_slno)
);



#############################
###                       ###
###    TABLE trn_detail   ###
###                       ###
#############################
SELECT "trn_detail";
DROP TABLE IF EXISTS trn_detail;
CREATE TABLE trn_detail(
    trn_slno           		INT(100)            NOT NULL,
    product_id        		INT(100)            NOT NULL,
    batch_no          		VARCHAR(20)         NOT NULL UNIQUE,
    exp_date          		VARCHAR(20)         NOT NULL UNIQUE,
    mfg_date          		VARCHAR(20)         NOT NULL UNIQUE,
    rate_purchase     		INT(20)             NOT NULL,
    rate_sale         		INT(20)             NOT NULL,
    rate_mrp          		INT(20)             NOT NULL,
    qty               		INT(255)            NOT NULL,
    free              		INT(255)            NOT NULL,
	tax_pc
	amount
	user_id					INT(6)				NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP			DEFAULT NULL,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(trn_type)
);
INSERT INTO trn_detail VALUES
    (1,    1,    "23-11-2022",       1,        "EZ0316",        "25/03/2024",       "21/02/2022",       59.00,     65.00,      75.00,      3000.00,        300.00,       null);
