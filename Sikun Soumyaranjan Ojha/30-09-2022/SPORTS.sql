CREATE TABLE event(
event_id                     INT(6)                      NOT NULL AUTO_INCREMENT,
event_name                   VARCHAR(100)                NOT NULL,
PRIMARY KEY(event_id)
);
INSERT INTO event(event_name)VALUES
                  ("HIGH JUMP"),
                  ("LONG JUMP");


CREATE TABLE attempts(
attempt_id              INT(6)             NOT NULL AUTO_INCREMENT,
attempt_name            VARCHAR(100)       NOT NULL,
PRIMARY KEY(attempt_id)
);
INSERT INTO attempts(attempt_name)VALUES
                    ("FIRST ATTEMPT"),
                    ("SECOND ATTEMPT"),
                    ("THIRD ATTEMPT");

CREATE TABLE participants(
participant_id             INT(6)           NOT NULL AUTO_INCREMENT,
participant_name           VARCHAR(100)     NOT NULL,
PRIMARY KEY(participant_id)
);
INSERT INTO participants(participant_name)VALUES
                        ("USAIN BOLT"),
                        ("ROGER FEDERER"),
                        ("RAFAEL NADAL"),
                        ("NOVAK DJOKOVIC"),
                        ("ANDY MURRAY");

CREATE TABLE results(
result_id               INT(6)            NOT NULL AUTO_INCREMENT,
event_id                INT(6)            NOT NULL REFERENCES event(event_id),
attempt_id              INT(6)            NOT NULL REFERENCES attemps(attempt_id),
participant_id          INT(6)            NOT NULL REFERENCES participants(participants_id),
result                  DOUBLE(6,2)       NOT NULL,
PRIMARY KEY(result_id)
);
INSERT INTO results(event_id,attempt_id,participant_id,result)VALUE
                   ("1",     "1",       "1",           "6.9"),
                   ("1",     "1",       "2",           "6.5"),
                   ("1",     "1",       "3",           "6.2"),
                   ("1",     "1",       "4",           "5.9"),
                   ("1",     "1",       "5",           "5.5"),
                   ("1",     "2",       "1",           "7.5"),
                   ("1",     "2",       "2",           "6.9"),
                   ("1",     "2",       "3",           "7.3"),
                   ("1",     "2",       "4",           "7.1"),
                   ("1",     "2",       "5",           "6.7"),
                   ("1",     "3",       "1",           "7.3"),
                   ("1",     "3",       "2",           "7.1"),
                   ("1",     "3",       "3",           "6.5"),
                   ("1",     "3",       "4",           "6.7"),
                   ("1",     "3",       "5",           "6.5"),
                   ("2",     "1",       "1",           "7.9"),
                   ("2",     "1",       "2",           "6.5"),
                   ("2",     "1",       "3",           "6.2"),
                   ("2",     "1",       "4",           "5.9"),
                   ("2",     "1",       "5",           "5.5"),
                   ("2",     "2",       "1",           "8.1"),
                   ("2",     "2",       "2",           "7.1"),
                   ("2",     "2",       "3",           "7.2"),
                   ("2",     "2",       "4",           "7.5"),
                   ("2",     "2",       "5",           "6.9"),
                   ("2",     "3",       "1",           "8.5"),
                   ("2",     "3",       "2",           "7.9"),
                   ("2",     "3",       "3",           "7.8"),
                   ("2",     "3",       "4",           "6.9"),
                   ("2",     "3",       "5",           "7.5");
                    


















