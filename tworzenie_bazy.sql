CREATE TABLE Adresy
  (
    ID             NUMBER (5) NOT NULL ,
    Kraj           VARCHAR2 (30 BYTE) NOT NULL ,
    Miasto         VARCHAR2 (30 BYTE) NOT NULL ,
    Kod_pocztowy   VARCHAR2 (20 BYTE) NOT NULL ,
    Ulica          VARCHAR2 (30 BYTE) NOT NULL ,
    Numer_budynku  NUMBER (4) NOT NULL ,
    Numer_lokalu   NUMBER (4) ,
    Uzytkownicy_ID NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Adresy ADD CONSTRAINT Adresy_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Kategoria_Produktow
  (
    ID    NUMBER (5) NOT NULL ,
    Nazwa VARCHAR2 (30 BYTE) NOT NULL ,
    Opis  VARCHAR2 (50)
  ) ;
ALTER TABLE Kategoria_Produktow ADD CONSTRAINT Kategoria_Produktow_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Koszyk_Dostawcy
  (
    ID            NUMBER (5) NOT NULL ,
    Samochody_ID_ NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Koszyk_Dostawcy ADD CONSTRAINT Koszyk_Dostawcy_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Koszyk_Magazyn
  ( ID NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Koszyk_Magazyn ADD CONSTRAINT Koszyk_Magazyn_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Metody_Dostawy
  (
    ID                NUMBER (5) NOT NULL ,
    Nazwa             VARCHAR2 (30 BYTE) NOT NULL ,
    Koszt_jednostkowy NUMBER (10,2) NOT NULL ,
    Czas_realizacji   VARCHAR2 (30 BYTE)
  ) ;
ALTER TABLE Metody_Dostawy ADD CONSTRAINT Metody_Dostawy_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Metody_Platnosci
  (
    ID             NUMBER (5) NOT NULL ,
    Typ_platnosci  VARCHAR2 (20 BYTE) NOT NULL ,
    Opis_platnosci VARCHAR2 (50 BYTE)
  ) ;
ALTER TABLE Metody_Platnosci ADD CONSTRAINT Metody_Platnosci_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Pracownicy
  (
    ID                NUMBER (5) NOT NULL ,
    Imie              VARCHAR2 (30 BYTE) NOT NULL ,
    Nazwisko          VARCHAR2 (30 BYTE) NOT NULL ,
    Stanowisko        VARCHAR2 (30 BYTE) NOT NULL ,
    Pracownicy_ID     NUMBER (5) ,
    Koszyk_Magazyn_ID NUMBER (5)
  ) ;
ALTER TABLE Pracownicy ADD CONSTRAINT Pracownicy_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Produkty
  (
    ID                     NUMBER (6) NOT NULL ,
    Nazwa                  VARCHAR2 (30 BYTE) NOT NULL ,
    Cena                   NUMBER (10,2) NOT NULL ,
    Stan_magazynowy        NUMBER (10) NOT NULL ,
    Producent              VARCHAR2 (30 BYTE) NOT NULL ,
    Model                  VARCHAR2 (30 BYTE) ,
    Kategoria_Produktow_ID NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Produkty ADD CONSTRAINT Produkty_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Produkty_Zamowienia
  (
    Zamowienia_ID NUMBER (5) NOT NULL ,
    Produkty_ID   NUMBER (6) NOT NULL
  ) ;
ALTER TABLE Produkty_Zamowienia ADD CONSTRAINT Relation_2_PK PRIMARY KEY ( Zamowienia_ID, Produkty_ID ) ;


CREATE TABLE Samochody
  (
    ID_           NUMBER (5) NOT NULL ,
    Model         VARCHAR2 (30 BYTE) NOT NULL ,
    Marka         VARCHAR2 (30 BYTE) NOT NULL ,
    Pracownicy_ID NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Samochody ADD CONSTRAINT Samochody_PK PRIMARY KEY ( ID_ ) ;


CREATE TABLE Statusy_Zamowien
  (
    ID           NUMBER (5) NOT NULL ,
    Status       VARCHAR2 (20 BYTE) NOT NULL ,
    Opis_statusu VARCHAR2 (40 BYTE)
  ) ;
ALTER TABLE Statusy_Zamowien ADD CONSTRAINT Statusy_Zamowien_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Uzytkownicy
  (
    ID               NUMBER (5) NOT NULL ,
    Imie             VARCHAR2 (30 BYTE) NOT NULL ,
    Nazwisko         VARCHAR2 (30 BYTE) NOT NULL ,
    "E-mail"         VARCHAR2 (30 BYTE) ,
    Login            VARCHAR2 (40 BYTE) NOT NULL ,
    Haslo            VARCHAR2 (40 BYTE) NOT NULL ,
    Numer_telefonu   NUMBER (9) ,
    Data_rejestracji DATE NOT NULL
  ) ;
ALTER TABLE Uzytkownicy ADD CONSTRAINT Uzytkownicy_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Zamowienia
  (
    ID                    NUMBER (5) NOT NULL ,
    Data_zamowienia       DATE NOT NULL ,
    Suma_zamowienia       NUMBER (20,2) NOT NULL ,
    Komentarz_uzytkownika VARCHAR2 (50 BYTE) ,
    Uzytkownicy_ID        NUMBER (5) NOT NULL ,
    Metody_Platnosci_ID   NUMBER (5) NOT NULL ,
    Metody_Dostawy_ID     NUMBER (5) NOT NULL ,
    Statusy_Zamowien_ID   NUMBER (5) NOT NULL ,
    Koszyk_Magazyn_ID     NUMBER (5) NOT NULL ,
    Koszyk_Dostawcy_ID    NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_PK PRIMARY KEY ( ID ) ;


ALTER TABLE Adresy ADD CONSTRAINT Adresy_Uzytkownicy_FK FOREIGN KEY ( Uzytkownicy_ID ) REFERENCES Uzytkownicy ( ID ) ;

ALTER TABLE Produkty_Zamowienia ADD CONSTRAINT FK_ASS_7 FOREIGN KEY ( Zamowienia_ID ) REFERENCES Zamowienia ( ID ) ;

ALTER TABLE Produkty_Zamowienia ADD CONSTRAINT FK_ASS_8 FOREIGN KEY ( Produkty_ID ) REFERENCES Produkty ( ID ) ;

ALTER TABLE Koszyk_Dostawcy ADD CONSTRAINT Koszyk_Dostawcy_Samochody_FK FOREIGN KEY ( Samochody_ID_ ) REFERENCES Samochody ( ID_ ) ;

ALTER TABLE Pracownicy ADD CONSTRAINT Pracownicy_Koszyk_Magazyn_FK FOREIGN KEY ( Koszyk_Magazyn_ID ) REFERENCES Koszyk_Magazyn ( ID ) ;

ALTER TABLE Pracownicy ADD CONSTRAINT Pracownicy_Pracownicy_FK FOREIGN KEY ( Pracownicy_ID ) REFERENCES Pracownicy ( ID ) ;

ALTER TABLE Produkty ADD CONSTRAINT Produkty_Kategoria_Prod_FK FOREIGN KEY ( Kategoria_Produktow_ID ) REFERENCES Kategoria_Produktow ( ID ) ;

ALTER TABLE Samochody ADD CONSTRAINT Samochody_Pracownicy_FK FOREIGN KEY ( Pracownicy_ID ) REFERENCES Pracownicy ( ID ) ;

ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Koszyk_Dostawcy_FK FOREIGN KEY ( Koszyk_Dostawcy_ID ) REFERENCES Koszyk_Dostawcy ( ID ) ;

ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Koszyk_Magazyn_FK FOREIGN KEY ( Koszyk_Magazyn_ID ) REFERENCES Koszyk_Magazyn ( ID ) ;

ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Metody_Dostawy_FK FOREIGN KEY ( Metody_Dostawy_ID ) REFERENCES Metody_Dostawy ( ID ) ;

ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Metody_Platnosci_FK FOREIGN KEY ( Metody_Platnosci_ID ) REFERENCES Metody_Platnosci ( ID ) ;

ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Statusy_Zamowien_FK FOREIGN KEY ( Statusy_Zamowien_ID ) REFERENCES Statusy_Zamowien ( ID ) ;

ALTER TABLE Zamowienia ADD CONSTRAINT Zamowienia_Uzytkownicy_FK FOREIGN KEY ( Uzytkownicy_ID ) REFERENCES Uzytkownicy ( ID ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
