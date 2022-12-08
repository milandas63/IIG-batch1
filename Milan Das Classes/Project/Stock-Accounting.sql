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
	company_name            VARCHAR(100)		            NOT NULL,
	company_usp             VARCHAR(100)                    NOT NULL,
	gst_no					INT(100)                        NOT NULL,
	dl_no					INT(100)                        NOT NULL,
	user_id					INT(6)							NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP                       NOT NULL,
    del                		ENUM("*")						DEFAULT NULL,
    PRIMARY KEY(id)
);
INSERT INTO config VALUES
	(1, 'I-Hub Pvt Ltd', 'Health is Wealth', 123456789, 1234567, 1, NULL, NULL);


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
	last_update				TIMESTAMP           NOT NULL,
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
	(30,  2,    "Ahaglow S Foaming Face Wash",                                  "N",    1,	NULL, NULL),
	(31,  2,    "Ahaglow S Foaming Face Wash1",                                 "N",    1,	NULL, NULL),
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
	(55,  3,    "Arip MT 20 Tablet",                                            "N",    1,	NULL, NULL),
	(56,  3,    "Arip MT 30 Tablet",                                            "N",    1,	NULL, NULL),
	(57,  3,    "Arkamin H Tablet",                                             "N",    1,	NULL, NULL),
	(58,  3,    "Aroff 200mg Tablet SR",                                        "N",    1,	NULL, NULL),
	(59,  3,    "Asthafen Syrup",                                             	"N",    1,	NULL, NULL),
	(60,  3,    "Asthafen Tablet",                                             	"N",    1,	NULL, NULL),
	(61,  3,    "Asthesia Cream",                                             	"N",    1,	NULL, NULL),
	(62,  3,    "Atlura 40 Tablet",                                             "N",    1,	NULL, NULL),
	(63,  3,    "Atlura 80 Tablet",                                             "N",    1,	NULL, NULL),
	(64,  3,    "Atmost 50mg Tablet",                                           "N",    1,	NULL, NULL),
	(65,  3,    "Azibold 100mg/5ml Syrup",                                      "N",    1,	NULL, NULL),
	(66,  3,    "Azisuper 100mg Suspension",                                    "N",    1,	NULL, NULL),
	(67,  3,    "Azisuper 500mg Tablet",                                        "N",    1,	NULL, NULL),
	(68,  3,    "Azona 20mg Capsule",                                           "N",    1,	NULL, NULL),
	(69,  3,    "Asthafen Tablet1",                                              "N",    1,  NULL, NULL),
	(70,  3,    "Asthafen Tablet2",                                              "N",    1,  NULL, NULL),
	(71,  3,    "Asthafen Tablet3",                                              "N",    1,  NULL, NULL),
	(72,  3,    "Asthafen Tablet4",                                              "N",    1,  NULL, NULL);


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
	stock_id                INT(6)              NOT NULL AUTO_INCREMENT,
    product_id         		INT(6)           	NOT NULL REFERENCES product(product_id),
    batch_no           		VARCHAR(7)       	NOT NULL,
    exp_date           		VARCHAR(7)       	NOT NULL,
    mfg_date           		VARCHAR(7)       	NOT NULL,
    rate_purchase      		DOUBLE(10,2)      	DEFAULT 0.00,
    rate_sale          		DOUBLE(10,2)        NOT NULL,
    rate_mrp           		DOUBLE(5,2)         NOT NULL,
    qty_balance        		DOUBLE(12,3)        NOT NULL,
	rack_id                 INT(6)              REFERENCES rack(rack_id),
	user_id					INT(6)				NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(stock_id)
);
INSERT INTO stock VALUES
	(1,   1,   "EZ0316",   "11/2023",   "03/2022",      59.00,     65.00,      75.00,      3000,     1,    1,   NULL,  NULL),
	(2,   2,   "EZ0412",   "10/2024",   "06/2021",      90.00,     91.00,      93.00,      3540,     1,    1,   NULL,  NULL),
	(3,   5,   "GZ0315",   "08/2023",   "03/2021",      45.00,     66.00,      77.00,      6950,     1,    1,   NULL,  NULL),
	(4,   3,   "TZ0311",   "09/2025",   "10/2020",      89.00,     92.00,      96.00,      3690,     1,    1,   NULL,  NULL),
	(5,   4,   "TZ0315",   "12/2025",   "11/2021",      54.00,     77.00,      79.00,      6899,     1,    1,   NULL,  NULL),
	(6,   6,   "GZ0317",   "01/2024",   "04/2020",      64.00,     67.00,      76.00,      6899,     1,    1,   NULL,  NULL),
	(7,   8,   "DZ0310",   "10/2024",   "02/2020",      96.00,     98.00,      99.00,      9490,     1,    1,   NULL,  NULL),
	(8,   7,   "DZ0444",   "06/2025",   "01/2020",      34.00,     44.00,      55.00,      3068,     1,    1,   NULL,  NULL),
	(9,   9,   "EZ0112",   "05/2023",   "09/2021",      78.00,     82.00,      89.00,      3096,     1,    1,   NULL,  NULL),
	(10,  8,   "EZ0101",   "04/2024",   "09/2022",      55.00,     59.00,      67.00,      3044,     1,    1,   NULL,  NULL),
	(11,  10,  "EV0110",   "10/2024",   "08/2021",      33.00,     47.00,      57.00,      3066,     2,    1,   NULL,  NULL),
	(12,  1,   "VZ0122",   "12/2025",   "04/2021",      48.00,     56.00,      59.00,      3897,     2,    1,   NULL,  NULL),
	(13,  11,  "WZ0199",   "11/2025",   "11/2020",      43.00,     88.00,      93.00,      3908,     2,    1,   NULL,  NULL),
	(14,  19,  "EZ0099",   "09/2023",   "11/2021",      87.00,     90.00,      94.00,      9999,     2,    1,   NULL,  NULL),
	(15,  41,  "EF0300",   "04/2024",   "10/2022",      67.00,     79.00,      84.00,      3333,     2,    1,   NULL,  NULL),
	(16,  31,  "EZ0211",   "02/2023",   "03/2020",      39.00,     48.00,      53.00,      8888,     2,    1,   NULL,  NULL),
	(17,  33,  "WE0214",   "05/2023",   "09/2020",      29.00,     66.00,      78.00,      4444,     2,    1,   NULL,  NULL),
	(18,  23,  "ESS009",   "10/2024",   "05/2021",      33.00,     77.00,      85.00,      3688,     2,    1,   NULL,  NULL),
	(19,  10,  "ESZ008",   "07/2025",   "07/2022",      66.00,     82.00,      89.00,      4688,     2,    1,   NULL,  NULL),
	(20,  26,  "EZD016",   "07/2025",   "09/2022",      77.00,     83.00,      87.00,      5684,     2,    1,   NULL,  NULL),
	(21,  54,  "EZS001",   "04/2024",   "11/2021",      88.00,     90.00,      95.00,      7890,     3,    1,   NULL,  NULL),
	(22,  60,  "EWS398",   "11/2025",   "12/2022",      68.00,     73.00,      77.00,      4568,     3,    1,   NULL,  NULL),
	(23,  1,   "EE0067",   "12/2024",   "10/2021",      27.00,     33.00,      40.00,      9760,     3,    1,   NULL,  NULL),
	(24,  1,   "WC0003",   "09/2023",   "04/2020",      74.00,     78.00,      92.00,      8769,     3,    1,   NULL,  NULL),
	(25,  1,   "VS0062",   "11/2024",   "09/2021",      38.00,     45.00,      58.00,      6780,     3,    1,   NULL,  NULL),
   # Purchase #2
    (26,  1,  "ES0316",   "09/2024",   "03/2022",      51.00,     61.00,      71.00,      3021,     3,     1,   NULL,  NULL),
	(27,  1,  "EZ0312",   "11/2025",   "06/2021",      80.00,     92.00,      92.00,      3542,     3,     1,   NULL,  NULL),
	(28,  1,  "FS0315",   "02/2023",   "03/2022",      41.00,     63.00,      73.00,      6953,     3,     1,   NULL,  NULL),
	(29,  18, "SF0311",   "03/2025",   "10/2021",      81.00,     94.00,      94.00,      3694,     3,     1,   NULL,  NULL),
	(30,  21, "SF0315",   "11/2026",   "12/2021",      51.00,     75.00,      75.00,      6895,     3,     1,   NULL,  NULL),
	(31,  31, "EZ0317",   "10/2025",   "03/2020",      61.00,     66.00,      76.00,      6896,     4,     1,   NULL,  NULL),
	(32,  51, "FZ0310",   "08/2024",   "05/2020",      97.00,     97.00,      97.00,      9497,     4,     1,   NULL,  NULL),
	(33,  11, "SF0444",   "05/2025",   "06/2020",      36.00,     47.00,      58.00,      3068,     4,     1,   NULL,  NULL),
	(34,  10, "EZF112",   "04/2023",   "07/2021",      77.00,     88.00,      89.00,      3099,     4,     1,   NULL,  NULL),
	(35,  9,  "SZ0101",   "03/2024",   "08/2022",      56.00,     59.00,      60.00,      3040,     4,     1,   NULL,  NULL),
	(36,  5,  "SZ0110",   "09/2024",   "08/2021",      35.00,     40.00,      51.00,      3061,     4,     1,   NULL,  NULL),
	(37,  4,  "FS0122",   "11/2025",   "04/2022",      44.00,     51.00,      52.00,      3892,     4,     1,   NULL,  NULL),
	(38,  3,  "EZ0199",   "12/2025",   "11/2021",      43.00,     82.00,      91.00,      3903,     4,     1,   NULL,  NULL),
	(39,  1,  "SF0099",   "03/2023",   "11/2020",      81.00,     93.00,      92.00,      9994,     4,     1,   NULL,  NULL),
	(40,  3,  "SZ0300",   "09/2024",   "11/2022",      61.00,     74.00,      85.00,      3335,     4,     1,   NULL,  NULL),
	(41,  4,  "SS0211",   "01/2023",   "02/2020",      34.00,     45.00,      54.00,      8886,     4,     1,   NULL,  NULL),
	(42,  4,  "SD0214",   "04/2023",   "02/2020",      29.00,     66.00,      76.00,      4447,     4,     1,   NULL,  NULL),
	(43,  5,  "SD0009",   "11/2024",   "03/2021",      70.00,     77.00,      87.00,      3689,     4,     1,   NULL,  NULL),
	(44,  8,  "SD0008",   "08/2025",   "04/2022",      61.00,     88.00,      88.00,      4680,     4,     1,   NULL,  NULL),
	(45,  8,  "WW0016",   "08/2025",   "05/2022",      73.00,     89.00,      89.00,      5681,     4,     1,   NULL,  NULL),
	(46,  8,  "EE0001",   "12/2024",   "12/2021",      85.00,     90.00,      90.00,      7892,     4,     1,   NULL,  NULL),
	(47,  6,  "EW0198",   "10/2025",   "11/2022",      67.00,     71.00,      71.00,      4563,     4,     1,   NULL,  NULL),
	(48,  1,  "WD0067",   "11/2024",   "12/2021",      22.00,     32.00,      42.00,      9762,     4,     1,   NULL,  NULL),
	(49,  6,  "EZ0003",   "02/2023",   "03/2020",      73.00,     73.00,      93.00,      8764,     4,     1,   NULL,  NULL),
	(50,  6,  "VD0062",   "11/2024",   "05/2021",      28.00,     44.00,      54.00,      6785,     4,     1,   NULL,  NULL),
	(51,  5,  "XV0211",   "02/2023",   "06/2020",      39.00,     45.00,      55.00,      8886,     5,     1,   NULL,  NULL),
	(52,  6,  "XZ0214",   "09/2023",   "06/2020",      59.00,     66.00,      75.00,      4447,     5,     1,   NULL,  NULL),
	(53,  7,  "XZ0009",   "12/2024",   "04/2021",      63.00,     77.00,      86.00,      3687,     5,     1,   NULL,  NULL),
	(54,  55, "XD0008",   "01/2025",   "06/2022",      76.00,     88.00,      87.00,      4689,     5,     1,   NULL,  NULL),
	(55,  17, "XF0016",   "03/2025",   "06/2022",      73.00,     82.00,      87.00,      5689,     5,     1,   NULL,  NULL),
	(56,  19, "SD0001",   "11/2024",   "10/2021",      84.00,     91.00,      98.00,      7891,     5,     1,   NULL,  NULL),
	(57,  33, "MJ0198",   "10/2025",   "10/2022",      63.00,     72.00,      78.00,      4562,     5,     1,   NULL,  NULL),
	(58,  55, "GB0067",   "09/2024",   "11/2021",      22.00,     33.00,      41.00,      9763,     5,     1,   NULL,  NULL),
	(59,  62, "GR0003",   "09/2023",   "03/2020",      73.00,     74.00,      92.00,      8764,     5,     1,   NULL,  NULL),
	(60,  23, "PV0062",   "10/2024",   "05/2021",      33.00,     45.00,      55.00,      6784,     5,     1,   NULL,  NULL),
	# Sale #1
	(61,  5,   "AS0316",   "09/2024",   "07/2021",     41.00,     62.00,      72.00,      4656,     6,     1,   NULL,  NULL),
	(62,  10,  "BE0318",   "08/2025",   "09/2022",     31.00,     31.00,      32.00,      9764,     6,     1,   NULL,  NULL),
	(63,  8,   "CV0416",   "09/2023",   "02/2021",     55.00,     51.00,      53.00,      3858,     6,     1,   NULL,  NULL),
	(64,  18,  "DE0518",   "10/2024",   "04/2022",     45.00,     64.00,      76.00,      8452,     6,     1,   NULL,  NULL),
	(65,  19,  "EW0753",   "11/2025",   "08/2021",     86.00,     90.00,      98.00,      9647,     6,     1,   NULL,  NULL),
	(66,  34,  "FG0364",   "12/2026",   "12/2022",     54.00,     58.00,      99.00,      8964,     6,     1,   NULL,  NULL),
	(67,  23,  "GW0338",   "05/2024",   "11/2021",     36.00,     41.00,      67.00,      7842,     6,     1,   NULL,  NULL),
	(68,  45,  "HQ0337",   "04/2025",   "07/2022",     84.00,     97.00,      99.00,      9623,     6,     1,   NULL,  NULL),
	(69,  12,  "IH0327",   "12/2026",   "02/2021",     57.00,     88.00,      89.00,      0753,     6,     1,   NULL,  NULL),
	(70,  18,  "JQ0334",   "06/2027",   "06/2022",     47.00,     71.00,      78.00,      3565,     6,     1,   NULL,  NULL),
	(71,  55,  "KJ0347",   "05/2025",   "11/2021",     26.00,     61.00,      76.00,      6347,     7,     1,   NULL,  NULL),
	(72,  64,  "LQ0335",   "12/2026",   "05/2022",     84.00,     51.00,      73.00,      8532,     7,     1,   NULL,  NULL),
   # Sale #2
    (73,  67,  "AH0356",   "09/2023",   "03/2021",      51.00,     71.00,      81.00,     3436,     7,     1,   NULL,  NULL),
	(74,  63,  "NH0343",   "09/2023",   "04/2022",      53.00,     61.00,      72.00,     3764,     7,     1,   NULL,  NULL),
	(75,  53,  "ES0353",   "09/2023",   "05/2021",      54.00,     81.00,      87.00,     3034,     7,     1,   NULL,  NULL),
	(76,  35,  "JC0557",   "09/2023",   "06/2022",      58.00,     75.00,      78.00,     3354,     7,     1,   NULL,  NULL),
	(77,  24,  "DG0346",   "09/2023",   "07/2021",      62.00,     67.00,      79.00,     3421,     7,     1,   NULL,  NULL),
	(78,  36,  "JH0374",   "09/2023",   "08/2022",      65.00,     66.00,      72.00,     5021,     7,     1,   NULL,  NULL),
	(79,  46,  "GD0357",   "09/2023",   "09/2021",      68.00,     81.00,      91.00,     6021,     7,     1,   NULL,  NULL),
	(80,  7,   "SG0756",   "09/2023",   "10/2022",      23.00,     71.00,      81.00,     4301,     7,     1,   NULL,  NULL),
	(81,  37,  "DG0347",   "09/2023",   "11/2021",      46.00,     56.00,      77.00,     3145,     8,     1,   NULL,  NULL),
	(82,  49,  "HG0378",   "09/2023",   "12/2022",      22.00,     33.00,      46.00,     7306,     8,     1,   NULL,  NULL),
	(83,  47,  "SF0467",   "09/2023",   "05/2021",      29.00,     36.00,      96.00,     1411,     8,     1,   NULL,  NULL),
	(84,  26,  "FF0963",   "09/2023",   "06/2022",      38.00,     67.00,      73.00,     1425,     8,     1,   NULL,  NULL),
	(85,  41,  "GK0314",   "09/2023",   "12/2021",      44.00,     54.00,      76.00,     3145,     8,     1,   NULL,  NULL),
	(86,  64,  "VX0313",   "09/2023",   "02/2022",      26.00,     64.00,      75.00,     8474,     8,     1,   NULL,  NULL),
	(87,  32,  "HJ0334",   "09/2023",   "03/2021",      38.00,     66.00,      97.00,     3435,     8,     1,   NULL,  NULL),
	(88,  28,  "SG0363",   "09/2023",   "04/2022",      55.00,     97.00,      98.00,     5754,     8,     1,   NULL,  NULL),
	(89,  64,  "FH0336",   "09/2023",   "05/2021",      59.00,     67.00,      79.00,     3546,     8,     1,   NULL,  NULL),
	(90,  53,  "AG0394",   "09/2023",   "06/2022",      63.00,     65.00,      75.00,     6443,     8,     1,   NULL,  NULL),
	(91,  25,  "FT0348",   "09/2023",   "07/2021",      75.00,     77.00,      79.00,     3546,     9,     1,   NULL,  NULL),
	(92,  52,  "EA0395",   "09/2023",   "08/2022",      45.00,     74.00,      79.00,     6445,     9,     1,   NULL,  NULL),
	(93,  24,  "QF0327",   "09/2023",   "09/2021",      66.00,     68.00,      77.00,     4666,     9,     1,   NULL,  NULL),
	(94,  64,  "CS0326",   "09/2023",   "10/2022",      37.00,     81.00,      91.00,     2566,     9,     1,   NULL,  NULL),
	(95,  14,  "DF0346",   "09/2023",   "11/2021",      78.00,     97.00,      98.00,     3557,     9,     1,   NULL,  NULL),
	(96,  27,  "SF0336",   "09/2023",   "12/2022",      88.00,     90.00,      95.00,     6578,     9,     1,   NULL,  NULL),
	(97,  48,  "BD0516",   "09/2023",   "01/2021",      69.00,     88.00,      97.00,     2435,     9,     1,   NULL,  NULL),
	(98,  4,   "HS0337",   "09/2023",   "02/2022",      70.00,     96.00,      97.00,     5467,     9,     1,   NULL,  NULL),
	(99,  6,   "ZJ0312",   "09/2023",   "03/2021",      61.00,     94.00,      98.00,     3467,     9,     1,   NULL,  NULL);
    


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
	trn_tax_amount          DOUBLE(10,2)        DEFAULT 0.00,
	trn_disc_amount         DOUBLE(10,2)        DEFAULT 0.00,
	trn_net_amount          DOUBLE(10,2)        DEFAULT 0.00,
	user_id					INT(6)				NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP			NOT NULL,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(trn_slno)
);
INSERT INTO trn_header VALUES
    (1,  "2022-12-06",   1,   1,   1,     2300.98,    67.58,    87.86,    2280.70,  1,     NULL,    NULL),    # Purchase
	(2,  "2022-12-22",   2,   1,   1,     25000.00,   888.75,   375.00,   25513.75, 1,     NULL,    NULL),    # Purchase
    (3,  "2022-12-26",   1,   4,   1001,  50000.00,   1000.50,  500.34,   50500.16, 1,     NULL,    NULL),    # Sale
	(4,  "2022-12-29",   2,   4,   1002,  45000.00,   900.40,   420.19,   45480.21, 1,     NULL,    NULL),    # Sale
	(5,  "2022-12-30",   3,   4,   1003,  56700.00,   670.35,   125.50,   57244.85, 1,     NULL,    NULL);    # Sale


#############################
###                       ###
###    TABLE trn_detail   ###
###                       ###
#############################
SELECT "trn_detail";
DROP TABLE IF EXISTS trn_detail;
CREATE TABLE trn_detail(
	trn_id                  INT(12)             NOT NULL AUTO_INCREMENT,
    trn_slno           		INT(10)             NOT NULL REFERENCES trn_header(trn_slno),
    product_id        		INT(10)             NOT NULL REFERENCES product(product_id),
    batch_no          		VARCHAR(20)         NOT NULL UNIQUE,
    exp_date          		VARCHAR(20)         NOT NULL,
    mfg_date          		VARCHAR(20)         NOT NULL,
    rate_purchase     		DOUBLE(20,2)        NOT NULL,
    rate_sale         		DOUBLE(20,2)        NOT NULL,
    rate_mrp          		DOUBLE(20,2)        NOT NULL,
    qty               		INT(10)             NOT NULL,
    free              		INT(6)              NOT NULL,
	tax_pc                  DOUBLE(6,2)         DEFAULT 0.00,
	tax_amount              DOUBLE(12,2)        DEFAULT 0.00,
	amount                  DOUBLE(12,2)        DEFAULT 0.00,
	user_id					INT(6)				NOT NULL REFERENCES user(user_id),
	last_update				TIMESTAMP			NOT NULL,
    del                		ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(trn_id)
);
INSERT INTO trn_detail VALUES
    # Purchase #1
    (1,      1,   1,   "EZ0316",   "11/2023",   "03/2022",      59.00,     65.00,      75.00,      3000,     10,    15.50,  68.55,  3676.00,  1,   NULL,  NULL),
	(2,      1,   2,   "EZ0412",   "10/2024",   "06/2021",      90.00,     91.00,      93.00,      3540,     5,     16.98,  60.96,  4576.00,  1,   NULL,  NULL),
	(3,      1,   5,   "GZ0315",   "08/2023",   "03/2021",      45.00,     66.00,      77.00,      6950,     7,     17.87,  67.57,  3575.00,  1,   NULL,  NULL),
	(4,      1,   3,   "TZ0311",   "09/2025",   "10/2020",      89.00,     92.00,      96.00,      3690,     9,     55.88,  40.76,  4585.00,  1,   NULL,  NULL),
	(5,      1,   4,   "TZ0315",   "12/2025",   "11/2021",      54.00,     77.00,      79.00,      6899,     12,    46.77,  43.86,  7648.00,  1,   NULL,  NULL),
	(6,      1,   6,   "GZ0317",   "01/2024",   "04/2020",      64.00,     67.00,      76.00,      6899,     3,     57.87,  46.85,  8537.00,  1,   NULL,  NULL),
	(7,      1,   8,   "DZ0310",   "10/2024",   "02/2020",      96.00,     98.00,      99.00,      9490,     17,    48.89,  45.57,  6784.00,  1,   NULL,  NULL),
	(8,      1,   7,   "DZ0444",   "06/2025",   "01/2020",      34.00,     44.00,      55.00,      3068,     8,     57.99,  46.95,  4554.00,  1,   NULL,  NULL),
	(9,      1,   9,   "EZ0112",   "05/2023",   "09/2021",      78.00,     82.00,      89.00,      3096,     23,    47.68,  47.74,  6478.00,  1,   NULL,  NULL),
	(10,     1,   8,   "EZ0101",   "04/2024",   "09/2022",      55.00,     59.00,      67.00,      3044,     15,    48.65,  57.86,  5359.00,  1,   NULL,  NULL),
	(11,     1,   10,  "EV0110",   "10/2024",   "08/2021",      33.00,     47.00,      57.00,      3066,     66,    18.45,  64.75,  3457.00,  1,   NULL,  NULL),
	(12,     1,   1,   "VZ0122",   "12/2025",   "04/2021",      48.00,     56.00,      59.00,      3897,     44,    17.46,  66.86,  2346.00,  1,   NULL,  NULL),
	(13,     1,   11,  "WZ0199",   "11/2025",   "11/2020",      43.00,     88.00,      93.00,      3908,     21,    19.35,  68.57,  5896.00,  1,   NULL,  NULL),
	(14,     1,   19,  "EZ0099",   "09/2023",   "11/2021",      87.00,     90.00,      94.00,      9999,     54,    23.77,  50.46,  8757.00,  1,   NULL,  NULL),
	(15,     1,   41,  "EF0300",   "04/2024",   "10/2022",      67.00,     79.00,      84.00,      3333,     34,    34.57,  40.46,  8457.58,  1,   NULL,  NULL),
	(16,     1,   31,  "EZ0211",   "02/2023",   "03/2020",      39.00,     48.00,      53.00,      8888,     53,    97.57,  30.67,  5751.75,  1,   NULL,  NULL),
	(17,     1,   33,  "WE0214",   "05/2023",   "09/2020",      29.00,     66.00,      78.00,      4444,     77,    75.57,  96.46,  1747.47,  1,   NULL,  NULL),
	(18,     1,   23,  "ESS009",   "10/2024",   "05/2021",      33.00,     77.00,      85.00,      3688,     52,    95.36,  86.57,  5922.75,  1,   NULL,  NULL),
	(19,     1,   10,  "ESZ008",   "07/2025",   "07/2022",      66.00,     82.00,      89.00,      4688,     4,     46.67,  57.85,  4748.68,  1,   NULL,  NULL),
	(20,     1,   26,  "EZD016",   "07/2025",   "09/2022",      77.00,     83.00,      87.00,      5684,     91,    79.46,  47.75,  3596.69,  1,   NULL,  NULL),
	(21,     1,   54,  "EZS001",   "04/2024",   "11/2021",      88.00,     90.00,      95.00,      7890,     66,    36.58,  58.87,  8886.58,  1,   NULL,  NULL),
	(22,     1,   60,  "EWS398",   "11/2025",   "12/2022",      68.00,     73.00,      77.00,      4568,     12,    36.69,  36.95,  1584.47,  1,   NULL,  NULL),
	(23,     1,   1,   "EE0067",   "12/2024",   "10/2021",      27.00,     33.00,      40.00,      9760,     97,    48.85,  67.75,  3647.74,  1,   NULL,  NULL),
	(24,     1,   1,   "WC0003",   "09/2023",   "04/2020",      74.00,     78.00,      92.00,      8769,     54,    37.83,  34.58,  5642.09,  1,   NULL,  NULL),
	(25,     1,   1,   "VS0062",   "11/2024",   "09/2021",      38.00,     45.00,      58.00,      6780,     17,    47.61,  48.84,  8753.75,  1,   NULL,  NULL),
   # Purchase #2
    (26,      2,    1,  "ES0316",   "09/2024",   "03/2022",      51.00,     61.00,      71.00,      3021,     11,    18.50,  64.55,  3976.00,  1,   NULL,  NULL),
	(27,      2,    1,  "EZ0312",   "11/2025",   "06/2021",      80.00,     92.00,      92.00,      3542,     6,     15.98,  65.96,  4876.00,  1,   NULL,  NULL),
	(28,      2,    1,  "FS0315",   "02/2023",   "03/2022",      41.00,     63.00,      73.00,      6953,     8,     13.87,  66.57,  3775.00,  1,   NULL,  NULL),
	(29,      2,    18, "SF0311",   "03/2025",   "10/2021",      81.00,     94.00,      94.00,      3694,     5,     53.88,  47.76,  4685.00,  1,   NULL,  NULL),
	(30,      2,    21, "SF0315",   "11/2026",   "12/2021",      51.00,     75.00,      75.00,      6895,     22,    44.77,  48.86,  7548.00,  1,   NULL,  NULL),
	(31,      2,    31, "EZ0317",   "10/2025",   "03/2020",      61.00,     66.00,      76.00,      6896,     4,     53.87,  49.85,  8437.00,  1,   NULL,  NULL),
	(32,      2,    51, "FZ0310",   "08/2024",   "05/2020",      97.00,     97.00,      97.00,      9497,     27,    43.89,  40.57,  6384.00,  1,   NULL,  NULL),
	(33,      2,    11, "SF0444",   "05/2025",   "06/2020",      36.00,     47.00,      58.00,      3068,     6,     55.99,  41.95,  4254.00,  1,   NULL,  NULL),
	(34,      2,    10, "EZF112",   "04/2023",   "07/2021",      77.00,     88.00,      89.00,      3099,     23,    46.68,  42.74,  6178.00,  1,   NULL,  NULL),
	(35,      2,    9,  "SZ0101",   "03/2024",   "08/2022",      56.00,     59.00,      60.00,      3040,     55,    47.65,  53.86,  5059.00,  1,   NULL,  NULL),
	(36,      2,    5,  "SZ0110",   "09/2024",   "08/2021",      35.00,     40.00,      51.00,      3061,     76,    16.45,  64.75,  3957.00,  1,   NULL,  NULL),
	(37,      2,    4,  "FS0122",   "11/2025",   "04/2022",      44.00,     51.00,      52.00,      3892,     84,    17.46,  65.86,  2846.00,  1,   NULL,  NULL),
	(38,      2,    3,  "EZ0199",   "12/2025",   "11/2021",      43.00,     82.00,      91.00,      3903,     31,    16.35,  66.57,  5796.00,  1,   NULL,  NULL),
	(39,      2,    1,  "SF0099",   "03/2023",   "11/2020",      81.00,     93.00,      92.00,      9994,     44,    25.77,  57.46,  8657.00,  1,   NULL,  NULL),
	(40,      2,    3,  "SZ0300",   "09/2024",   "11/2022",      61.00,     74.00,      85.00,      3335,     54,    34.57,  48.46,  8557.58,  1,   NULL,  NULL),
	(41,      2,    4,  "SS0211",   "01/2023",   "02/2020",      34.00,     45.00,      54.00,      8886,     73,    93.57,  39.67,  5451.75,  1,   NULL,  NULL),
	(42,      2,    4,  "SD0214",   "04/2023",   "02/2020",      29.00,     66.00,      76.00,      4447,     47,    72.57,  90.46,  1347.47,  1,   NULL,  NULL),
	(43,      2,    5,  "SD0009",   "11/2024",   "03/2021",      70.00,     77.00,      87.00,      3689,     62,    91.36,  81.57,  5222.75,  1,   NULL,  NULL),
	(44,      2,    8,  "SD0008",   "08/2025",   "04/2022",      61.00,     88.00,      88.00,      4680,     7,     40.67,  52.85,  4148.68,  1,   NULL,  NULL),
	(45,      2,    8,  "WW0016",   "08/2025",   "05/2022",      73.00,     89.00,      89.00,      5681,     41,    79.46,  43.75,  3196.69,  1,   NULL,  NULL),
	(46,      2,    8,  "EE0001",   "12/2024",   "12/2021",      85.00,     90.00,      90.00,      7892,     76,    38.58,  54.87,  8086.58,  1,   NULL,  NULL),
	(47,      2,    6,  "EW0198",   "10/2025",   "11/2022",      67.00,     71.00,      71.00,      4563,     52,    37.69,  35.95,  1984.47,  1,   NULL,  NULL),
	(48,      2,    1,  "WD0067",   "11/2024",   "12/2021",      22.00,     32.00,      42.00,      9762,     77,    46.85,  66.75,  3847.74,  1,   NULL,  NULL),
	(49,      2,    6,  "EZ0003",   "02/2023",   "03/2020",      73.00,     73.00,      93.00,      8764,     44,    35.83,  37.58,  5742.09,  1,   NULL,  NULL),
	(50,      2,    6,  "VD0062",   "11/2024",   "05/2021",      28.00,     44.00,      54.00,      6785,     37,    45.61,  48.84,  8653.75,  1,   NULL,  NULL),
	(51,      2,    5,  "XV0211",   "02/2023",   "06/2020",      39.00,     45.00,      55.00,      8886,     53,    94.57,  39.67,  5551.75,  1,   NULL,  NULL),
	(52,      2,    6,  "XZ0214",   "09/2023",   "06/2020",      59.00,     66.00,      75.00,      4447,     47,    73.57,  90.46,  1447.47,  1,   NULL,  NULL),
	(53,      2,    7,  "XZ0009",   "12/2024",   "04/2021",      63.00,     77.00,      86.00,      3687,     52,    92.36,  81.57,  5322.75,  1,   NULL,  NULL),
	(54,      2,    55, "XD0008",   "01/2025",   "06/2022",      76.00,     88.00,      87.00,      4689,     6,     41.67,  52.85,  4248.68,  1,   NULL,  NULL),
	(55,      2,    17, "XF0016",   "03/2025",   "06/2022",      73.00,     82.00,      87.00,      5689,     41,    70.46,  43.75,  3196.69,  1,   NULL,  NULL),
	(56,      2,    19, "SD0001",   "11/2024",   "10/2021",      84.00,     91.00,      98.00,      7891,     76,    39.58,  54.87,  6886.58,  1,   NULL,  NULL),
	(57,      2,    33, "MJ0198",   "10/2025",   "10/2022",      63.00,     72.00,      78.00,      4562,     42,    38.69,  35.95,  5584.47,  1,   NULL,  NULL),
	(58,      2,    55, "GB0067",   "09/2024",   "11/2021",      22.00,     33.00,      41.00,      9763,     57,    47.85,  66.75,  4647.74,  1,   NULL,  NULL),
	(59,      2,    62, "GR0003",   "09/2023",   "03/2020",      73.00,     74.00,      92.00,      8764,     64,    36.83,  37.58,  2642.09,  1,   NULL,  NULL),
	(60,      2,    23, "PV0062",   "10/2024",   "05/2021",      33.00,     45.00,      55.00,      6784,     87,    45.61,  48.84,  1753.75,  1,   NULL,  NULL),
	# Sale #1
	(61,      1,    5,   "AS0316",   "09/2024",   "07/2021",     41.00,     62.00,      72.00,      4656,     55,    18.50,  67.67,  6488.00,  1,   NULL,  NULL),
	(62,      1,    10,  "BE0318",   "08/2025",   "09/2022",     31.00,     31.00,      32.00,      9764,     33,    19.59,  68.33,  6964.00,  1,   NULL,  NULL),
	(63,      1,    8,   "CV0416",   "09/2023",   "02/2021",     55.00,     51.00,      53.00,      3858,     22,    46.75,  63.67,  7537.00,  1,   NULL,  NULL),
	(64,      1,    18,  "DE0518",   "10/2024",   "04/2022",     45.00,     64.00,      76.00,      8452,     11,    13.85,  36.35,  7534.00,  1,   NULL,  NULL),
	(65,      1,    19,  "EW0753",   "11/2025",   "08/2021",     86.00,     90.00,      98.00,      9647,     12,    19.36,  53.68,  9636.00,  1,   NULL,  NULL),
	(66,      1,    34,  "FG0364",   "12/2026",   "12/2022",     54.00,     58.00,      99.00,      8964,     44,    18.37,  53.68,  8636.00,  1,   NULL,  NULL),
	(67,      1,    23,  "GW0338",   "05/2024",   "11/2021",     36.00,     41.00,      67.00,      7842,     32,    24.63,  63.33,  0858.00,  1,   NULL,  NULL),
	(68,      1,    45,  "HQ0337",   "04/2025",   "07/2022",     84.00,     97.00,      99.00,      9623,     85,    57.47,  63.67,  5787.00,  1,   NULL,  NULL),
	(69,      1,    12,  "IH0327",   "12/2026",   "02/2021",     57.00,     88.00,      89.00,      0753,     54,    74.54,  63.33,  5376.00,  1,   NULL,  NULL),
	(70,      1,    18,  "JQ0334",   "06/2027",   "06/2022",     47.00,     71.00,      78.00,      3565,     07,    48.74,  63.37,  4675.00,  1,   NULL,  NULL),
	(71,      1,    55,  "KJ0347",   "05/2025",   "11/2021",     26.00,     61.00,      76.00,      6347,     34,    85.57,  63.86,  4748.00,  1,   NULL,  NULL),
	(72,      1,    64,  "LQ0335",   "12/2026",   "05/2022",     84.00,     51.00,      73.00,      8532,     34,    57.56,  65.36,  5642.00,  1,   NULL,  NULL),
   # Sale #2
    (73,      2,    67,  "AH0356",   "09/2023",   "03/2021",      51.00,     71.00,      81.00,     3436,     22,    15.50,  45.76,  4632.00,  1,   NULL,  NULL),
	(74,      2,    63,  "NH0343",   "09/2023",   "04/2022",      53.00,     61.00,      72.00,     3764,     23,    16.63,  67.75,  8643.00,  1,   NULL,  NULL),
	(75,      2,    53,  "ES0353",   "09/2023",   "05/2021",      54.00,     81.00,      87.00,     3034,     12,    16.54,  86.97,  7536.00,  1,   NULL,  NULL),
	(76,      2,    35,  "JC0557",   "09/2023",   "06/2022",      58.00,     75.00,      78.00,     3354,     16,    23.57,  65.76,  8643.00,  1,   NULL,  NULL),
	(77,      2,    24,  "DG0346",   "09/2023",   "07/2021",      62.00,     67.00,      79.00,     3421,     13,    14.57,  65.75,  7543.00,  1,   NULL,  NULL),
	(78,      2,    36,  "JH0374",   "09/2023",   "08/2022",      65.00,     66.00,      72.00,     5021,     14,    14.37,  97.68,  9764.00,  1,   NULL,  NULL),
	(79,      2,    46,  "GD0357",   "09/2023",   "09/2021",      68.00,     81.00,      91.00,     6021,     17,    17.57,  87.67,  9864.00,  1,   NULL,  NULL),
	(80,      2,    7,   "SG0756",   "09/2023",   "10/2022",      23.00,     71.00,      81.00,     4301,     15,    12.68,  89.64,  7537.00,  1,   NULL,  NULL),
	(81,      2,    37,  "DG0347",   "09/2023",   "11/2021",      46.00,     56.00,      77.00,     3145,     12,    17.46,  94.57,  8634.00,  1,   NULL,  NULL),
	(82,      2,    49,  "HG0378",   "09/2023",   "12/2022",      22.00,     33.00,      46.00,     7306,     11,    28.56,  86.67,  8653.00,  1,   NULL,  NULL),
	(83,      2,    47,  "SF0467",   "09/2023",   "05/2021",      29.00,     36.00,      96.00,     1411,     18,    36.74,  46.78,  4678.00,  1,   NULL,  NULL),
	(84,      2,    26,  "FF0963",   "09/2023",   "06/2022",      38.00,     67.00,      73.00,     1425,     15,    57.57,  76.68,  4854.00,  1,   NULL,  NULL),
	(85,      2,    41,  "GK0314",   "09/2023",   "12/2021",      44.00,     54.00,      76.00,     3145,     23,    53.57,  85.68,  8643.00,  1,   NULL,  NULL),
	(86,      2,    64,  "VX0313",   "09/2023",   "02/2022",      26.00,     64.00,      75.00,     8474,     57,    57.85,  67.75,  6774.00,  1,   NULL,  NULL),
	(87,      2,    32,  "HJ0334",   "09/2023",   "03/2021",      38.00,     66.00,      97.00,     3435,     13,    46.87,  86.67,  8536.00,  1,   NULL,  NULL),
	(88,      2,    28,  "SG0363",   "09/2023",   "04/2022",      55.00,     97.00,      98.00,     5754,     47,    78.86,  64.76,  4748.00,  1,   NULL,  NULL),
	(89,      2,    64,  "FH0336",   "09/2023",   "05/2021",      59.00,     67.00,      79.00,     3546,     36,    65.57,  68.86,  7654.00,  1,   NULL,  NULL),
	(90,      2,    53,  "AG0394",   "09/2023",   "06/2022",      63.00,     65.00,      75.00,     6443,     46,    67.75,  78.65,  7477.00,  1,   NULL,  NULL),
	(91,      2,    25,  "FT0348",   "09/2023",   "07/2021",      75.00,     77.00,      79.00,     3546,     43,    57.84,  86.67,  4743.00,  1,   NULL,  NULL),
	(92,      2,    52,  "EA0395",   "09/2023",   "08/2022",      45.00,     74.00,      79.00,     6445,     13,    68.89,  75.68,  4647.00,  1,   NULL,  NULL),
	(93,      2,    24,  "QF0327",   "09/2023",   "09/2021",      66.00,     68.00,      77.00,     4666,     54,    86.74,  68.78,  6547.00,  1,   NULL,  NULL),
	(94,      2,    64,  "CS0326",   "09/2023",   "10/2022",      37.00,     81.00,      91.00,     2566,     47,    57.48,  57.75,  9875.00,  1,   NULL,  NULL),
	(95,      2,    14,  "DF0346",   "09/2023",   "11/2021",      78.00,     97.00,      98.00,     3557,     15,    97.06,  68.86,  4747.00,  1,   NULL,  NULL),
	(96,      2,    27,  "SF0336",   "09/2023",   "12/2022",      88.00,     90.00,      95.00,     6578,     12,    74.57,  75.86,  5743.00,  1,   NULL,  NULL),
	(97,      2,    48,  "BD0516",   "09/2023",   "01/2021",      69.00,     88.00,      97.00,     2435,     86,    78.96,  67.57,  8643.00,  1,   NULL,  NULL),
	(98,      2,    4,   "HS0337",   "09/2023",   "02/2022",      70.00,     96.00,      97.00,     5467,     43,    57.58,  76.76,  5746.00,  1,   NULL,  NULL),
	(99,      2,    6,   "ZJ0312",   "09/2023",   "03/2021",      61.00,     94.00,      98.00,     3467,     67,    57.60,  67.76,  9547.00,  1,   NULL,  NULL);
    
