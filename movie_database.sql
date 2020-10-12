--
----------------------------------------------;
--		   		  MOVIE DATABASE 
--			   BY MUSIAL BARTLOMIEJ
----------------------------------------------;
--
CLEAR SCREEN;
--
DELETE FROM XMOV_GENRES;     
DROP TABLE  XMOV_GENRES;
DELETE FROM MOV_GENRES;      
DROP TABLE  MOV_GENRES;
DELETE FROM XPRODUCTION_STUDIO;  
DROP TABLE  XPRODUCTION_STUDIO;
DELETE FROM PRODUCTION_STUDIO;   
DROP TABLE  PRODUCTION_STUDIO;
DELETE FROM XCOUNTRY_OF_PRODUCTION;      
DROP TABLE  XCOUNTRY_OF_PRODUCTION;
DELETE FROM COUNTRY_OF_PRODUCTION;       
DROP TABLE  COUNTRY_OF_PRODUCTION;
DELETE FROM XDIRECTOR;             
DROP TABLE  XDIRECTOR;
DELETE FROM DIRECTOR;              
DROP TABLE  DIRECTOR;
DELETE FROM XSCENARIO; 	      
DROP TABLE  XSCENARIO;
DELETE FROM SCENARIO;           
DROP TABLE  SCENARIO;
DELETE FROM XCHARACTERS; 		      
DROP TABLE  XCHARACTERS;
DELETE FROM CHARACTERS; 		      
DROP TABLE  CHARACTERS;
DELETE FROM XACTOR;               
DROP TABLE  XACTOR;
DELETE FROM ACTOR; 		          
DROP TABLE  ACTOR;
DELETE FROM REVIEWS;             
DROP TABLE  REVIEWS;
DELETE FROM USER; 	      
DROP TABLE  USER;
DELETE FROM TRAILER; 		      
DROP TABLE  TRAILER;
DELETE FROM PERSONS; 			      
DROP TABLE  PERSONS;
DELETE FROM COUNTRY_OF_ORIGIN;     
DROP TABLE  COUNTRY_OF_ORIGIN;
DELETE FROM MOVIE; 			      
DROP TABLE  MOVIE;
--
--
------------------------------------------;
-- CREATE TABLE MOVIE;
------------------------------------------;
--
--
CREATE TABLE MOVIE
( 
MOVp_ID            number(4)      NOT NULL,
MOV_Title          varchar2(50)   NOT NULL,
MOV_Relase_Date    date,
MOV_Duration       varchar2(20),
MOV_Budget         number(20),
MOV_Description    varchar2(1000)
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table MOVIE
add constraint PK_MOV
primary key (MOVp_ID);
--
--
------------------------------------------;
-- CREATE TABLE COUNTRY_OF_ORIGIN;
------------------------------------------;
--
--
CREATE TABLE COUNTRY_OF_ORIGIN
( 
COOp_ID         number(4)    NOT NULL,
COO_Country     varchar2(50) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table COUNTRY_OF_ORIGIN
add constraint PK_COUNTRY_OF_ORIGIN
primary key (COOp_ID);
--
--
------------------------------------------;
-- CREATE TABLE PERSONS;
------------------------------------------;
--
--
CREATE TABLE PERSONS 
( 
PERp_ID               number(4)      NOT NULL,
PER_Name              varchar2(50)   NOT NULL,
PER_Name2             varchar2(50),
PER_Surname           varchar2(50)   NOT NULL,
PER_Surname2          varchar2(50),
PER_Date_Of_Birth 	  number(4)      NOT NULL, 
COO_ID				  number(4)      NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table PERSONS
add constraint PK_PERSONS
primary key (PERp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table PERSONS add constraint PER_FK_COO
foreign key (COO_ID)
references  COUNTRY_OF_ORIGIN (COOp_ID);
--
--
------------------------------------------;
-- CREATE TABLE TRAILER;
------------------------------------------;
--
--
CREATE TABLE TRAILER
( 
TRAp_ID 			  number(4)      NOT NULL,
TRA_Link              varchar2(100),
MOV_ID                number(4)      NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table TRAILER
add constraint PK_TRAILER
primary key (TRAp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table TRAILER add constraint TRA_FK_MOV
foreign key (MOV_ID)
references MOVIE (MOVp_ID);
--
--
------------------------------------------;
-- CREATE TABLE USER;
------------------------------------------;
--
--
CREATE TABLE USER
( 
USRp_ID       number(4)     NOT NULL,
USR_Nick      varchar2(50),
PER_ID		  number(4)     NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table USER 
add constraint PK_USER
primary key (USRp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table USER add constraint FK_USR
foreign key (PER_ID)
references PERSONS (PERp_ID);
--
--
------------------------------------------;
-- CREATE TABLE REVIEWS;
------------------------------------------;
--
--
CREATE TABLE REVIEWS
( 
REVp_ID                 number(4)        NOT NULL,
REV_Content             varchar2(1000),
REV_Date                date,
REV_Stars               number(1),
USR_ID                  number(4)        NOT NULL,
MOV_ID                  number(4)        NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table REVIEWS
add constraint PK_REVIEWS
primary key (REVp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table REVIEWS add constraint REV_FK_USR
foreign key (USR_ID)
references USER (USRp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table REVIEWS add constraint REV_FK_MOV
foreign key (MOV_ID)
references MOVIE (MOVp_ID);
--
--
------------------------------------------;
-- CREATE TABLE ACTOR;
------------------------------------------;
--
--
CREATE TABLE ACTOR
( 
ACTp_ID       number(4) NOT NULL,
PER_ID		  number(4) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table ACTOR 
add constraint PK_ACTOR
primary key (ACTp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table ACTOR add constraint ACT_FK_PER
foreign key (PER_ID)
references PERSONS (PERp_ID);
--
--
------------------------------------------;
-- CREATE TABLE XACTOR;
------------------------------------------;
--
--
CREATE TABLE XACTOR
( 
XACp_ID       number(4) NOT NULL,
ACT_ID		  number(4) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table XACTOR 
add constraint PK_XACTOR
primary key (XACp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XACTOR add constraint XAC_FK_ACT
foreign key (ACT_ID)
references ACTOR (ACTp_ID);
--
--
------------------------------------------;
-- CREATE TABLE CHARACTERS;
------------------------------------------;
--
--
CREATE TABLE CHARACTERS
( 
CHRp_ID           number(4)        NOT NULL,
CHR_Name          varchar2(20),
CHR_Surname       varchar2(20),
CHR_Age           number(3),
CHR_Description	  varchar2(1000),
XAC_ID		      number(4)        NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table CHARACTERS
add constraint PK_CHARACTERS
primary key (CHRp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table CHARACTERS add constraint CHR_FK_XAC
foreign key (XAC_ID)
references XACTOR (XACp_ID);
--
--
------------------------------------------;
-- CREATE TABLE XCHARACTERS;
------------------------------------------;
--
--
CREATE TABLE XCHARACTERS
( 
XCHp_ID       number(4) NOT NULL,
CHR_ID        number(4) NOT NULL,
MOV_ID        number(4) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table XCHARACTERS
add constraint PK_CHARACTERS
primary key (XCHp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XCHARACTERS add constraint XCH_FK_CHR
foreign key (CHR_ID)
references CHARACTERS (CHRp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XCHARACTERS add constraint MOV_FK_CHR
foreign key (MOV_ID)
references MOVIE (MOVp_ID);
--
--
------------------------------------------;
-- CREATE TABLE SCENARIO;
------------------------------------------;
--
--
CREATE TABLE SCENARIO
( 
SCNp_ID       number(4) NOT NULL,
PER_ID        number(4) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table SCENARIO
add constraint PK_SCENARIO
primary key (SCNp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table SCENARIO add constraint SCN_FK_PER
foreign key (PER_ID)
references PERSONS (PERp_ID);
--
--
------------------------------------------;
-- CREATE TABLE XSCENARIO;
------------------------------------------;
--
--
CREATE TABLE XSCENARIO
( 
XSCp_ID       number(4) NOT NULL,
SCN_ID        number(4) NOT NULL,
MOV_ID		  number(4) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table XSCENARIO
add constraint PK_XSCENARIO
primary key (XSCp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XSCENARIO add constraint XSC_FK_SCN
foreign key (SCN_ID)
references SCENARIO (SCNp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XSCENARIO add constraint XSC_FK_MOV
foreign key (MOV_ID)
references MOVIE (MOVp_ID);
--
--
------------------------------------------;
-- CREATE TABLE DIRECTOR;
------------------------------------------;
--
--
CREATE TABLE DIRECTOR
( 
DIRp_ID       number(4) NOT NULL,
PER_ID        number(4) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table DIRECTOR
add constraint PK_DIRECTOR
primary key (DIRp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table DIRECTOR add constraint DIR_FK_PER
foreign key (PER_ID)
references PERSONS (PERp_ID);
--
--
------------------------------------------;
-- CREATE TABLE XDIRECTOR;
------------------------------------------;
--
--
CREATE TABLE XDIRECTOR
( 
XDIp_ID       number(4) NOT NULL,
DIR_ID        number(4) NOT NULL,
MOV_ID		  number(4) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table XDIRECTOR
add constraint PK_XDIRYSER
primary key (XDIp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XDIRECTOR add constraint XDI_FK_DIR
foreign key (DIR_ID)
references DIRECTOR (DIRp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XDIRECTOR add constraint XDI_FK_MOV
foreign key (MOV_ID)
references MOVIE (MOVp_ID);
--
--
------------------------------------------;
-- CREATE TABLE COUNTRY_OF_PRODUCTION;
------------------------------------------;
--
--
CREATE TABLE COUNTRY_OF_PRODUCTION
( 
COPp_ID       			        number(4)    NOT NULL,
COP_Country_Of_Production       varchar2(20)
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table COUNTRY_OF_PRODUCTION
add constraint PK_COUNTRY_OF_PRODUCTION
primary key (COPp_ID);
--
--
------------------------------------------;
-- CREATE TABLE XCOUNTRY_OF_PRODUCTION;
------------------------------------------;
--
--
CREATE TABLE XCOUNTRY_OF_PRODUCTION
( 
XCPp_ID       number(4) NOT NULL,
COP_ID        number(4) NOT NULL,
MOV_ID        number(4) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table XCOUNTRY_OF_PRODUCTION
add constraint PK_XCOUNTRY_OF_PRODUCTION
primary key (XCPp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XCOUNTRY_OF_PRODUCTION add constraint XCP_FK_COP
foreign key (COP_ID)
references COUNTRY_OF_PRODUCTION (COPp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XCOUNTRY_OF_PRODUCTION add constraint XCP_FK_MOV
foreign key (MOV_ID)
references MOVIE (MOVp_ID);
--
--
------------------------------------------;
-- CREATE TABLE PRODUCTION_STUDIO;
------------------------------------------;
--
--
CREATE TABLE PRODUCTION_STUDIO
( 
PDSp_ID       			   number(4) NOT NULL,
PDS_Production_Studio      varchar2(40)
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table PRODUCTION_STUDIO
add constraint PK_PRODUCTION_STUDIO
primary key (PDSp_ID);
--
--
------------------------------------------;
-- CREATE TABLE XPRODUCTION_STUDIO;
------------------------------------------;
--
--
CREATE TABLE XPRODUCTION_STUDIO
( 
XPSp_ID   number(4) NOT NULL,
PDS_ID    number(4) NOT NULL,
MOV_ID    number(4) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table XPRODUCTION_STUDIO
add constraint PK_XPRODUCTION_STUDIO
primary key (XPSp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XPRODUCTION_STUDIO add constraint XPS_FK_PDS
foreign key (PDS_ID)
references PRODUCTION_STUDIO (PDSp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XPRODUCTION_STUDIO add constraint XPS_FK_MOV
foreign key (MOV_ID)
references MOVIE (MOVp_ID);
--
--
------------------------------------------;
-- CREATE TABLE MOV_GENRES;
------------------------------------------;
--
--
CREATE TABLE MOV_GENRES
( 
MVGp_ID           number(4) NOT NULL,
MVG_Movie_Genre   varchar2(20)
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table MOV_GENRES
add constraint PK_MOVIE_GENRES
primary key (MVGp_ID);
--
--
------------------------------------------;
-- CREATE TABLE XMOV_GENRES;
------------------------------------------;
--
--
CREATE TABLE XMOV_GENRES
( 
XMGp_ID  number(4) NOT NULL,
MVG_ID   number(4) NOT NULL,
MOV_ID   number(4) NOT NULL
);
--
------------------------------------------;
-- Primary Key;
------------------------------------------;
--
alter table XMOV_GENRES
add constraint PK_XMOV_GENRES
primary key (XMGp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XMOV_GENRES add constraint XMG_FK_MVG
foreign key (MVG_ID)
references MOV_GENRES (MVGp_ID);
--
------------------------------------------;
-- Foreign Key;
------------------------------------------;
--
alter table XMOV_GENRES add constraint XMG_FK_MOV
foreign key (MOV_ID)
references MOVIE (MOVp_ID);
--
DESCRIBE COUNTRY_OF_ORIGIN;
DESCRIBE PERSONS;
DESCRIBE MOVIE;
DESCRIBE TRAILER;
DESCRIBE USER;
DESCRIBE REVIEWS;
DESCRIBE ACTOR;
DESCRIBE XACTOR;
DESCRIBE CHARACTERS;
DESCRIBE XCHARACTERS;
DESCRIBE SCENARIO;
DESCRIBE XSCENARIO;
DESCRIBE DIRECTOR;
DESCRIBE XDIRECTOR;
DESCRIBE COUNTRY_OF_PRODUCTION;
DESCRIBE XCOUNTRY_OF_PRODUCTION;
DESCRIBE PRODUCTION_STUDIO;
DESCRIBE XPRODUCTION_STUDIO;
DESCRIBE MOV_GENRES;    
DESCRIBE XMOV_GENRES;    
--
COMMIT WORK;