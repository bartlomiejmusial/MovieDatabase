--
--
----------------------------------------------;
--		   		  FILM DATABASE 
--				MUSIAL BARTLOMIEJ
----------------------------------------------;
--
CLEAR SCREEN;
--
DELETE FROM XGATUNKI_FILMOWE;     
DROP TABLE XGATUNKI_FILMOWE;
DELETE FROM GATUNKI_FILMOWE;      
DROP TABLE GATUNKI_FILMOWE;
DELETE FROM XSTUDIO_PRODUKCYJNE;  
DROP TABLE XSTUDIO_PRODUKCYJNE;
DELETE FROM STUDIO_PRODUKCYJNE;   
DROP TABLE STUDIO_PRODUKCYJNE;
DELETE FROM XKRAJ_PRODUKCJI;      
DROP TABLE XKRAJ_PRODUKCJI;
DELETE FROM KRAJ_PRODUKCJI;       
DROP TABLE KRAJ_PRODUKCJI;
DELETE FROM XREZYSER;             
DROP TABLE XREZYSER;
DELETE FROM REZYSER;              
DROP TABLE REZYSER;
DELETE FROM XSCENARIUSZ; 	      
DROP TABLE XSCENARIUSZ;
DELETE FROM SCENARIUSZ;           
DROP TABLE SCENARIUSZ;
DELETE FROM XPOSTACIE; 		      
DROP TABLE XPOSTACIE;
DELETE FROM POSTACIE; 		      
DROP TABLE POSTACIE;
DELETE FROM XAKTOR;               
DROP TABLE XAKTOR;
DELETE FROM AKTOR; 		          
DROP TABLE AKTOR;
DELETE FROM RECENZJE;             
DROP TABLE RECENZJE;
DELETE FROM UZYTKOWNIK; 	      
DROP TABLE UZYTKOWNIK;
DELETE FROM ZWIASTUNY; 		      
DROP TABLE ZWIASTUNY;
DELETE FROM OSOBY; 			      
DROP TABLE OSOBY;
DELETE FROM KRAJ_POCHODZENIA;     
DROP TABLE KRAJ_POCHODZENIA;
DELETE FROM FILM; 			      
DROP TABLE FILM;
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE FILM;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE FILM
( 
FILp_ID            number(4)      NOT NULL,
FIL_Tytul          varchar2(50)   NOT NULL,
FIL_Data_Premiery  date,
FIL_Czas_Trwania   varchar2(20),
FIL_Budzet         number(20),
FIL_Opis_Filmu     varchar2(1000)
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table FILM
add constraint PK_FILM
primary key (FILp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE KRAJ_POCHODZENIA;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE KRAJ_POCHODZENIA
( 
KRPp_ID      number(4)    NOT NULL,
KRP_Kraj     varchar2(50) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table KRAJ_POCHODZENIA
add constraint PK_KRAJ_POCHODZENIA
primary key (KRPp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE OSOBY;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE OSOBY 
( 
OSOp_ID               number(4)      NOT NULL,
OSO_Imie              varchar2(50)   NOT NULL,
OSO_Imie2             varchar2(50),
OSO_Nazwisko          varchar2(50)   NOT NULL,
OSO_Nazwisko2         varchar2(50),
OSO_Rok_Urodzenia 	  number(4)      NOT NULL, 
KRP_ID				  number(4)      NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table OSOBY
add constraint PK_OSOBY
primary key (OSOp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table OSOBY add constraint OSO_FK_KRP
foreign key (KRP_ID)
references KRAJ_POCHODZENIA (KRPp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE ZWIASTUNY;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE ZWIASTUNY
( 
ZWIp_ID 			  number(4)      NOT NULL,
ZWI_Link_Zwiastun     varchar2(100),
FIL_ID                number(4)      NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table ZWIASTUNY
add constraint PK_ZWIASTUNY
primary key (ZWIp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table ZWIASTUNY add constraint ZWI_FK_FIL
foreign key (FIL_ID)
references FILM (FILp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE UZYTKOWNIK;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE UZYTKOWNIK
( 
UZYp_ID       number(4)     NOT NULL,
UZY_Nick      varchar2(50),
OSO_ID		  number(4)     NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table UZYTKOWNIK 
add constraint PK_UZYTKOWNIK
primary key (UZYp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table UZYTKOWNIK add constraint FK_UZY
foreign key (OSO_ID)
references OSOBY (OSOp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE RECENZJE;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE RECENZJE
( 
RECp_ID                 number(4)        NOT NULL,
REC_Tresc               varchar2(1000),
REC_Data_Wystawienia    date,
REC_Liczba_Gwiazdek     number(1),
UZY_ID                  number(4)        NOT NULL,
FIL_ID                  number(4)        NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table RECENZJE
add constraint PK_RECENZJE
primary key (RECp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table RECENZJE add constraint REC_FK_UZY
foreign key (UZY_ID)
references UZYTKOWNIK (UZYp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table RECENZJE add constraint REC_FK_FIL
foreign key (FIL_ID)
references FILM (FILp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE AKTOR;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE AKTOR
( 
AKTp_ID       number(4) NOT NULL,
OSO_ID		  number(4) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table AKTOR 
add constraint PK_AKTOR
primary key (AKTp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table AKTOR add constraint AKT_FK_OSO
foreign key (OSO_ID)
references OSOBY (OSOp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE XAKTOR;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE XAKTOR
( 
XAKp_ID       number(4) NOT NULL,
AKT_ID		  number(4) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XAKTOR 
add constraint PK_XAKTOR
primary key (XAKp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XAKTOR add constraint XAK_FK_AKT
foreign key (AKT_ID)
references AKTOR (AKTp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE POSTACIE;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE POSTACIE
( 
POSp_ID       number(4)        NOT NULL,
POS_Imie      varchar2(20),
POS_Nazwisko  varchar2(20),
POS_Wiek      number(3),
POS_Opis	  varchar2(1000),
XAK_ID		  number(4)        NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table POSTACIE
add constraint PK_POSTACIE
primary key (POSp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table POSTACIE add constraint POS_FK_XAK
foreign key (XAK_ID)
references XAKTOR (XAKp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE XPOSTACIE;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE XPOSTACIE
( 
XPSp_ID       number(4) NOT NULL,
POS_ID        number(4) NOT NULL,
FIL_ID        number(4) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XPOSTACIE
add constraint PK_XPOSTACIE
primary key (XPSp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XPOSTACIE add constraint XPS_FK_POS
foreign key (POS_ID)
references POSTACIE (POSp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XPOSTACIE add constraint FIL_FK_POS
foreign key (FIL_ID)
references FILM (FILp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE SCENARIUSZ;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE SCENARIUSZ
( 
SCNp_ID       number(4) NOT NULL,
OSO_ID        number(4) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table SCENARIUSZ
add constraint PK_SCENARIUSZ
primary key (SCNp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table SCENARIUSZ add constraint SCN_FK_OSO
foreign key (OSO_ID)
references OSOBY (OSOp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE XSCENARIUSZ;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE XSCENARIUSZ
( 
XSCp_ID       number(4) NOT NULL,
SCN_ID        number(4) NOT NULL,
FIL_ID		  number(4) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XSCENARIUSZ
add constraint PK_XSCENARIUSZ
primary key (XSCp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XSCENARIUSZ add constraint XSC_FK_SCN
foreign key (SCN_ID)
references SCENARIUSZ (SCNp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XSCENARIUSZ add constraint XSC_FK_FIL
foreign key (FIL_ID)
references FILM (FILp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE REZYSER;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE REZYSER
( 
REZp_ID       number(4) NOT NULL,
OSO_ID        number(4) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table REZYSER
add constraint PK_REZYSER
primary key (REZp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table REZYSER add constraint REZ_FK_OSO
foreign key (OSO_ID)
references OSOBY (OSOp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE XREZYSER;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE XREZYSER
( 
XREp_ID       number(4) NOT NULL,
REZ_ID        number(4) NOT NULL,
FIL_ID		  number(4) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XREZYSER
add constraint PK_XREZYSER
primary key (XREp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XREZYSER add constraint XRE_FK_REZ
foreign key (REZ_ID)
references REZYSER (REZp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XREZYSER add constraint XRE_FK_FIL
foreign key (FIL_ID)
references FILM (FILp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE KRAJ_PRODUKCJI;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE KRAJ_PRODUKCJI
( 
KPDp_ID       			 number(4)    NOT NULL,
KPD_Kraj_Produkcji       varchar2(20)
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table KRAJ_PRODUKCJI
add constraint PK_KRAJ_PRODUKCJI
primary key (KPDp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE XKRAJ_PRODUKCJI;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE XKRAJ_PRODUKCJI
( 
XKPp_ID       number(4) NOT NULL,
KPD_ID        number(4) NOT NULL,
FIL_ID        number(4) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XKRAJ_PRODUKCJI
add constraint PK_XKRAJ_PRODUKCJI
primary key (XKPp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XKRAJ_PRODUKCJI add constraint XKP_FK_KPD
foreign key (KPD_ID)
references KRAJ_PRODUKCJI (KPDp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XKRAJ_PRODUKCJI add constraint XKP_FK_FIL
foreign key (FIL_ID)
references FILM (FILp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE STUDIO_PRODUKCYJNE;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE STUDIO_PRODUKCYJNE
( 
SPDp_ID       			   number(4) NOT NULL,
SPD_Studio_Produkcyjne     varchar2(40)
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table STUDIO_PRODUKCYJNE
add constraint PK_STUDIO_PRODUKCYJNE
primary key (SPDp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE XSTUDIO_PRODUKCYJNE;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE XSTUDIO_PRODUKCYJNE
( 
XSPp_ID   number(4) NOT NULL,
SPD_ID    number(4) NOT NULL,
FIL_ID    number(4) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XSTUDIO_PRODUKCYJNE
add constraint PK_XSTUDIO_PRODUKCYJNE
primary key (XSPp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XSTUDIO_PRODUKCYJNE add constraint XSP_FK_SPD
foreign key (SPD_ID)
references STUDIO_PRODUKCYJNE (SPDp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XSTUDIO_PRODUKCYJNE add constraint XSP_FK_FIL
foreign key (FIL_ID)
references FILM (FILp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE GATUNKI_FILMOWE;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE GATUNKI_FILMOWE
( 
GTFp_ID       number(4) NOT NULL,
GTF_Gatunek   varchar2(20)
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table GATUNKI_FILMOWE
add constraint PK_GATUNKI_FILMOWE
primary key (GTFp_ID);
--
PROMPT ;
PROMPT----------------------------------------;
PROMPT CREATE TABLE XGATUNKI_FILMOWE;
PROMPT----------------------------------------;
PROMPT ;
--
CREATE TABLE XGATUNKI_FILMOWE
( 
XGFp_ID  number(4) NOT NULL,
GTF_ID   number(4) NOT NULL,
FIL_ID   number(4) NOT NULL
);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Primary Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XGATUNKI_FILMOWE
add constraint PK_XGATUNKI_FILMOWE
primary key (XGFp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XGATUNKI_FILMOWE add constraint XGF_FK_GTF
foreign key (GTF_ID)
references GATUNKI_FILMOWE (GTFp_ID);
PROMPT ;
PROMPT----------------------------------------;
PROMPT Foreign Key;
PROMPT----------------------------------------;
PROMPT ;
alter table XGATUNKI_FILMOWE add constraint XGF_FK_FIL
foreign key (FIL_ID)
references FILM (FILp_ID);
--
DESCRIBE KRAJ_POCHODZENIA;
DESCRIBE OSOBY;
DESCRIBE FILM;
DESCRIBE ZWIASTUNY;
DESCRIBE UZYTKOWNIK;
DESCRIBE RECENZJE;
DESCRIBE AKTOR;
DESCRIBE XAKTOR;
DESCRIBE POSTACIE;
DESCRIBE XPOSTACIE;
DESCRIBE SCENARIUSZ;
DESCRIBE XSCENARIUSZ;
DESCRIBE REZYSER;
DESCRIBE XREZYSER;
DESCRIBE KRAJ_PRODUKCJI;
DESCRIBE XKRAJ_PRODUKCJI;
DESCRIBE STUDIO_PRODUKCYJNE;
DESCRIBE XSTUDIO_PRODUKCYJNE;
DESCRIBE GATUNKI_FILMOWE;    
DESCRIBE XGATUNKI_FILMOWE;    
--
COMMIT WORK;