-- SQLite

CREATE TABLE ORGANIZATION
(
  ORGANIZATION_CODE TEXT NOT NULL,
  NAME              TEXT NULL    ,
  PRIMARY KEY (ORGANIZATION_CODE)
);

CREATE TABLE AUTHORITY
(
  AUTHORITY_CODE TEXT NOT NULL,
  RIGHTS         TEXT NULL    ,
  PRIMARY KEY (AUTHORITY_CODE)
);

CREATE TABLE MEMBER
(
  MEMBER_ID         TEXT NOT NULL,
  EMAIL             TEXT NULL    ,
  ORGANIZATION_CODE TEXT NOT NULL,
  NAME              TEXT NULL    ,
  PRIMARY KEY (MEMBER_ID),
  CONSTRAINT FK_ORGANIZATION_TO_MEMBER
    FOREIGN KEY (ORGANIZATION_CODE)
    REFERENCES ORGANIZATION (ORGANIZATION_CODE)
);

CREATE TABLE MEMBER_AUTHORITY
(
  MEMBER_ID      TEXT NOT NULL,
  AUTHORITY_CODE TEXT NOT NULL,
  CONSTRAINT FK_MEMBER_TO_MEMBER_AUTHORITY
    FOREIGN KEY (MEMBER_ID)
    REFERENCES MEMBER (MEMBER_ID),
    CONSTRAINT FK_AUTHORITY_TO_MEMBER_AUTHORITY
    FOREIGN KEY (AUTHORITY_CODE)
    REFERENCES AUTHORITY (AUTHORITY_CODE)
);

INSERT INTO ORGANIZATION VALUES ('01','IT BILLING');
INSERT INTO ORGANIZATION VALUES ('02','ENGINEERING');

INSERT INTO AUTHORITY VALUES ('GU', 'GUEST');
INSERT INTO AUTHORITY VALUES ('AD', 'ADMIN');
INSERT INTO AUTHORITY VALUES ('MA', 'MANAGER');

INSERT INTO MEMBER VALUES ('P@IG', 'paul01@gmail.com','01', 'Paul');
INSERT INTO MEMBER VALUES ('A@EA', 'texas@imfblog.org','02', 'Allen');
INSERT INTO MEMBER VALUES ('T@IA', 'norway@iotm.com', '01','Teddy');

INSERT INTO MEMBER_AUTHORITY VALUES ('P@IG', 'GU');
INSERT INTO MEMBER_AUTHORITY VALUES ('P@IG', 'AD');
INSERT INTO MEMBER_AUTHORITY VALUES ('P@IG', 'MA');
INSERT INTO MEMBER_AUTHORITY VALUES ('A@EA', 'AD');
INSERT INTO MEMBER_AUTHORITY VALUES ('A@EA', 'MA');
INSERT INTO MEMBER_AUTHORITY VALUES ('T@IA', 'AD');

CREATE TABLE ATTACHFILES
(
  IMAGE NAME      TEXT NULL    ,
  ATTACHFILE_CODE TEXT NOT NULL,
  FILE_CODE       TEXT NOT NULL,
  PRIMARY KEY (FILE_CODE),
  CONSTRAINT FK_MULTI_BOARD_TO_ATTACHFILES
    FOREIGN KEY (ATTACHFILE_CODE)
    REFERENCES MULTI_BOARD (ATTACHFILE_CODE)
);

CREATE TABLE MULTI_BOARD
(
  ATTACHFILE_CODE TEXT NOT NULL,
  SUBJECT         TEXT NULL    ,
  TYPE            TEXT NULL    ,
  MEMBER_ID       TEXT NOT NULL,
  PRIMARY KEY (ATTACHFILE_CODE),
  CONSTRAINT FK_MEMBER_TO_MULTI_BOARD
    FOREIGN KEY (MEMBER_ID)
    REFERENCES MEMBER (MEMBER_ID)
);

-- DELETE FROM ATTACHFILES;

INSERT INTO MULTI_BOARD VALUES ('001','용감한 가족','한국 영화 장르','P@IG');
INSERT INTO MULTI_BOARD VALUES ('002','용감한 형제','일본 영화 장르','T@IA');
INSERT INTO MULTI_BOARD VALUES ('003','용감한 친척','미국 영화 장르','A@EA');

INSERT INTO ATTACHFILES VALUES ('poster.png','001','poster1');
INSERT INTO ATTACHFILES VALUES ('actor.png','001','actor1');
INSERT INTO ATTACHFILES VALUES ('poster02.png','002','poster2');
INSERT INTO ATTACHFILES VALUES ('actor02.png','002','actor2');
INSERT INTO ATTACHFILES VALUES ('poster03.png','003','poster3');
INSERT INTO ATTACHFILES VALUES ('actor03.png','003','actor3');

SELECT MEMBER.NAME,MULTI_BOARD.SUBJECT,MULTI_BOARD.TYPE,ATTACHFILES.FILE_CODE
FROM MEMBER,MULTI_BOARD,ATTACHFILES
WHERE MULTI_BOARD.MEMBER_ID = MEMBER.MEMBER_ID
AND ATTACHFILES.ATTACHFILE_CODE = MULTI_BOARD.ATTACHFILE_CODE;