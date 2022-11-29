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



#############################
###                       ###
### DATABASE stock_account###
###                       ###
#############################
SELECT "DATABASE stock_account";
DROP DATABASE IF EXISTS stock_account;
CREATE DATABASE stock_account;
USE stock_account;


#############################
###                       ###
###  TABLE product_group  ###
###                       ###
#############################
SELECT "TABLE product_group";
DROP TABLE IF EXISTS product_group;
CREATE TABLE product_group(
    mfg_id             INT(10)             NOT NULL AUTO_INCREMENT,
    mfg_name           VARCHAR(100)        NOT NULL UNIQUE,
    mfg_abbr           VARCHAR(100)        NOT NULL UNIQUE,
    del                ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(mfg_id)
);
INSERT INTO product_group VALUES
    (1,    "Abort India",                "ABORT",      null),
    (2,    "Torrent Pharmaceuticals",    "TORRENT",    null),
    (3,    "Dr. Reddy Laboratories",     "REDDY",      null),
    (4,    "Divis Laboratories Ltd.",    "DIVIS",      null),
    (5,    "Sun Pharmaceuticals Ltd.",   "SUN",        null),
    (6,    "Aurobindo Pharma Ltd.",      "AUROBINDO",  null),
    (7,     "Glenmark Pharmacist",       "GLENMARK",   null),
    (8,     "Mankind Pharma",            "MANKIND",    null),
    (9,     "Glaxo Pharmaceuticals",     "Glaxo",      null),
    (10,    "Cipla Ltd.",                "Cipla",      null);


##############################
###                        ###
###     TABLE product      ###
###                        ###
##############################
SELECT "TABLE product";
DROP TABLE IF EXISTS product;
CREATE TABLE product(
    product_id          INT(20)             DEFAULT NULL AUTO_INCREMENT,
    mfg_id              INT(20)             REFERENCES product_group(mfg_id),
    product_name        VARCHAR(70)         NOT NULL UNIQUE,
    taxfree             VARCHAR(50)         DEFAULT NULL,
    del                 ENUM("*")           DEFAULT NULL,
    PRIMARY KEY(product_id)
);
INSERT INTO product VALUES
    (1,   1,   "A-Derma Dermalibour Plus Foaming Gel",                     "FALSE",    null),
    (2,   1,   "A-Derma Epitheliale A.H Duo Cream",                        "FALSE",    null),
    (3,   1,   "A-Derma Exomega Emollient Cream",                          "FALSE",    null),
    (4,   1,   "A-Derma Protect Fluid Cream SPF 50+",                      "FALSE",    null),
    (5,   1,   "ADVACORT 6MG TABLET",                                      "FALSE",    null),
    (6,   1,   "Abact 250mg Tablet",                                       "FALSE",    null),
    (7,   1,   "Abamlo 5 Tablet",                                          "FALSE",    null),
    (8,   1,   "Abbott Gel Hand Sanitizer",                                "FALSE",    null),
    (9,   1,   "Abbott Panbio Covid 19 Antigen Self Test Kit",             "TRUE",     null),
    (10,  1,  "Abbott Supra Rize Cholecalciferol USP 60,000IU Capsule",    "FALSE",    null),
    (11,  1,  "Abetorox 60 Tablet",                                        "FALSE",    null),
    (12,  1,  "Abixim 200mg Tablet",                                       "FALSE",    null),
    (13,  1,  "Abmetop 50 XL Tablet",                                      "FALSE",    null),
    (14,  1,  "Abnib 250mg Tablet",                                        "FALSE",    null),
    (15,  1,  "Abocal 500 Tablet",                                         "FALSE",    null),
    (16,  1,  "Abtelmi-Amh Tablet",                                        "FALSE",    null),
    (17,  1,  "Abtorsmed 10 Tablet",                                       "FALSE",    null),
    (18,  1,  "Abturbi Cream",                                             "FALSE",    null);



#############################
###                       ###
###     TABLE rack        ###
###                       ###
#############################
SELECT "TABLE rack";
DROP TABLE IF EXISTS rack;
CREATE TABLE rack(
    rack_id            INT(20)           NOT NULL AUTO_INCREMENT,
    rack_desc          VARCHAR(100)      NOT NULL,
    rack_no            VARCHAR(20)       NOT NULL,
    del                ENUM("*")         DEFAULT NULL,
    PRIMARY KEY(rack_id)
);
INSERT INTO rack VALUES
    (1,     "Room No.-1-Rack-Self No",       "I-1-1",      null),
    (2,     "Room No.-1-Rack-Self No",       "I-1-2",      null),
    (3,     "Room No.-1-Rack-Self No",       "I-1-3",      null),
    (4,     "Room No.-1-Rack-Self No",       "I-1-4",      null),
    (5,     "Room No.-1-Rack-Self No",       "I-1-1",      null),
    (6,     "Room No.-1-Rack-Self No",       "I-1-2",      null),
    (7,     "Room No.-1-Rack-Self No",       "I-1-3",      null),
    (8,     "Room No.-1-Rack-Self No",       "I-1-4",      null),
    (9,     "Room No.-1-Rack-Self No",       "I-1-1",      null),
    (10,    "Room No.-1-Rack-Self No",       "I-1-2",      null);




#############################
###                       ###
###     TABLE trn_type    ###
###                       ###
#############################
SELECT "TABLE trn_type";
DROP TABLE IF EXISTS trn_type;
CREATE TABLE trn_type(
    trn_type_id            INT(20)           NOT NULL AUTO_INCREMENT,
    trn_type_desc          VARCHAR(100)      NOT NULL,
    operation              VARCHAR(20)       NOT NULL,
    del                    ENUM("*")         DEFAULT NULL,
    PRIMARY KEY(trn_type_id)
);
INSERT INTO trn_type VALUES
    (1,    "Purchase",          "+",     null),
    (2,    "Sales Return",      "+",     null),
    (3,    "Sample",            "+",     null),
    (4,    "Sales",             "-",     null),
    (5,    "Purchase Return",   "-",     null),
    (6,    "Damage",            "-",     null),
    (7,    "Expire",            "-",     null),
    (8,    "Theft",             "-",     null);



#############################
###                       ###
###     TABLE stock       ###
###                       ###
#############################
SELECT "TABLE stock";
DROP TABLE IF EXISTS stock;
CREATE TABLE stock(
    product_id         int(30)           NOT NULL AUTO_INCREMENT,
    batch_no           VARCHAR(20)       NOT NULL UNIQUE,
    exp_date           VARCHAR(20)       NOT NULL UNIQUE,
    mfg_date           VARCHAR(20)       NOT NULL UNIQUE,
    rate_purchase      INT(30)           NOT NULL,
    rate_sale          INT(30)           NOT NULL,
    rate_mrp           INT(30)           NOT NULL,
    qty_balance        INT(100)          NOT NULL,
    del                ENUM("*")         DEFAULT NULL,
    PRIMARY KEY(product_id)
);
INSERT INTO stock VALUES
    (1,     "EZ0316",      "25/03/2024",      "21/02/2022",        59.00,       65.00,      75.00,      0,     null);




#############################
###                       ###
###    TABLE trn_detail   ###
###                       ###
#############################
SELECT "trn_detail";
DROP TABLE IF EXISTS trn_detail;
CREATE TABLE trn_detail(
     trn_type          INT(100)                 NOT NULL AUTO_INCREMENT,
     trn_no            INT(100)                 NOT NULL,
     trn_date          VARCHAR(10)              NOT NULL UNIQUE,
     product_id        INT(100)                 NOT NULL,
     batch_no          VARCHAR(20)              NOT NULL UNIQUE,
     exp_date          VARCHAR(20)              NOT NULL UNIQUE,
     mfg_date          VARCHAR(20)              NOT NULL UNIQUE,
     rate_purchase     INT(20)                  NOT NULL,
     rate_sale         INT(20)                  NOT NULL,
     rate_mrp          INT(20)                  NOT NULL,
     qty               INT(255)                 NOT NULL,
     free              INT(255)                 NOT NULL,
     del               ENUM("*")                DEFAULT NULL,
     PRIMARY KEY(trn_type)
);
INSERT INTO trn_detail VALUES
    (1,    1,    "23-11-2022",       1,        "EZ0316",        "25/03/2024",       "21/02/2022",       59.00,     65.00,      75.00,      3000.00,        300.00,       null);







                 