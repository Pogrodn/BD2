-- Generated by Oracle SQL Developer Data Modeler 4.1.5.907
--   at:        2017-05-14 12:02:50 CEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE Adresy
  (
    ID             NUMBER (5) NOT NULL ,
    Kraj           VARCHAR2 (30 BYTE) NOT NULL ,
    Miasto         VARCHAR2 (30 BYTE) NOT NULL ,
    Kod_pocztowy   VARCHAR2 (20 BYTE) NOT NULL ,
    Ulica          VARCHAR2 (30 BYTE) NOT NULL ,
    Numer_budynku  NUMBER (4) NOT NULL ,
    Numer_lokalu   NUMBER (4) ,
    Użytkownicy_ID NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Adresy ADD CONSTRAINT Adresy_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Kategoria_Produktów
  (
    ID    NUMBER (5) NOT NULL ,
    Nazwa VARCHAR2 (30 BYTE) NOT NULL ,
    Opis  VARCHAR2 (50)
  ) ;
ALTER TABLE Kategoria_Produktów ADD CONSTRAINT Kategoria_Produktów_PK PRIMARY KEY ( ID ) ;


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


CREATE TABLE Metody_Płatności
  (
    ID             NUMBER (5) NOT NULL ,
    Typ_płatności  VARCHAR2 (20 BYTE) NOT NULL ,
    Opis_płatności VARCHAR2 (50 BYTE)
  ) ;
ALTER TABLE Metody_Płatności ADD CONSTRAINT Metody_Płatności_PK PRIMARY KEY ( ID ) ;


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
    Kategoria_Produktów_ID NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Produkty ADD CONSTRAINT Produkty_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Produkty_Zamówienia
  (
    Zamówienia_ID NUMBER (5) NOT NULL ,
    Produkty_ID   NUMBER (6) NOT NULL
  ) ;
ALTER TABLE Produkty_Zamówienia ADD CONSTRAINT Relation_2_PK PRIMARY KEY ( Zamówienia_ID, Produkty_ID ) ;


CREATE TABLE Samochody
  (
    ID_           NUMBER (5) NOT NULL ,
    Model         VARCHAR2 (30 BYTE) NOT NULL ,
    Marka         VARCHAR2 (30 BYTE) NOT NULL ,
    Pracownicy_ID NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Samochody ADD CONSTRAINT Samochody_PK PRIMARY KEY ( ID_ ) ;


CREATE TABLE Statusy_Zamówień
  (
    ID           NUMBER (5) NOT NULL ,
    Status       VARCHAR2 (20 BYTE) NOT NULL ,
    Opis_statusu VARCHAR2 (40 BYTE)
  ) ;
ALTER TABLE Statusy_Zamówień ADD CONSTRAINT Statusy_Zamówień_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Użytkownicy
  (
    ID               NUMBER (5) NOT NULL ,
    Imie             VARCHAR2 (30 BYTE) NOT NULL ,
    Nazwisko         VARCHAR2 (30 BYTE) NOT NULL ,
    "E-mail"         VARCHAR2 (30 BYTE) ,
    Login            VARCHAR2 (40 BYTE) NOT NULL ,
    Hasło            VARCHAR2 (40 BYTE) NOT NULL ,
    Numer_telefonu   NUMBER (9) ,
    Data_rejestracji DATE NOT NULL
  ) ;
ALTER TABLE Użytkownicy ADD CONSTRAINT Użytkownicy_PK PRIMARY KEY ( ID ) ;


CREATE TABLE Zamówienia
  (
    ID                    NUMBER (5) NOT NULL ,
    Data_zamówienia       DATE NOT NULL ,
    Suma_zamówienia       NUMBER (20,2) NOT NULL ,
    Komentarz_użytkownika VARCHAR2 (50 BYTE) ,
    Użytkownicy_ID        NUMBER (5) NOT NULL ,
    Metody_Płatności_ID   NUMBER (5) NOT NULL ,
    Metody_Dostawy_ID     NUMBER (5) NOT NULL ,
    Statusy_Zamówień_ID   NUMBER (5) NOT NULL ,
    Koszyk_Magazyn_ID     NUMBER (5) NOT NULL ,
    Koszyk_Dostawcy_ID    NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Zamówienia ADD CONSTRAINT Zamówienia_PK PRIMARY KEY ( ID ) ;


ALTER TABLE Adresy ADD CONSTRAINT Adresy_Użytkownicy_FK FOREIGN KEY ( Użytkownicy_ID ) REFERENCES Użytkownicy ( ID ) ;

ALTER TABLE Produkty_Zamówienia ADD CONSTRAINT FK_ASS_7 FOREIGN KEY ( Zamówienia_ID ) REFERENCES Zamówienia ( ID ) ;

ALTER TABLE Produkty_Zamówienia ADD CONSTRAINT FK_ASS_8 FOREIGN KEY ( Produkty_ID ) REFERENCES Produkty ( ID ) ;

ALTER TABLE Koszyk_Dostawcy ADD CONSTRAINT Koszyk_Dostawcy_Samochody_FK FOREIGN KEY ( Samochody_ID_ ) REFERENCES Samochody ( ID_ ) ;

ALTER TABLE Pracownicy ADD CONSTRAINT Pracownicy_Koszyk_Magazyn_FK FOREIGN KEY ( Koszyk_Magazyn_ID ) REFERENCES Koszyk_Magazyn ( ID ) ;

ALTER TABLE Pracownicy ADD CONSTRAINT Pracownicy_Pracownicy_FK FOREIGN KEY ( Pracownicy_ID ) REFERENCES Pracownicy ( ID ) ;

ALTER TABLE Produkty ADD CONSTRAINT Produkty_Kategoria_Prod_FK FOREIGN KEY ( Kategoria_Produktów_ID ) REFERENCES Kategoria_Produktów ( ID ) ;

ALTER TABLE Samochody ADD CONSTRAINT Samochody_Pracownicy_FK FOREIGN KEY ( Pracownicy_ID ) REFERENCES Pracownicy ( ID ) ;

ALTER TABLE Zamówienia ADD CONSTRAINT Zamówienia_Koszyk_Dostawcy_FK FOREIGN KEY ( Koszyk_Dostawcy_ID ) REFERENCES Koszyk_Dostawcy ( ID ) ;

ALTER TABLE Zamówienia ADD CONSTRAINT Zamówienia_Koszyk_Magazyn_FK FOREIGN KEY ( Koszyk_Magazyn_ID ) REFERENCES Koszyk_Magazyn ( ID ) ;

ALTER TABLE Zamówienia ADD CONSTRAINT Zamówienia_Metody_Dostawy_FK FOREIGN KEY ( Metody_Dostawy_ID ) REFERENCES Metody_Dostawy ( ID ) ;

ALTER TABLE Zamówienia ADD CONSTRAINT Zamówienia_Metody_Płatności_FK FOREIGN KEY ( Metody_Płatności_ID ) REFERENCES Metody_Płatności ( ID ) ;

ALTER TABLE Zamówienia ADD CONSTRAINT Zamówienia_Statusy_Zamówień_FK FOREIGN KEY ( Statusy_Zamówień_ID ) REFERENCES Statusy_Zamówień ( ID ) ;

ALTER TABLE Zamówienia ADD CONSTRAINT Zamówienia_Użytkownicy_FK FOREIGN KEY ( Użytkownicy_ID ) REFERENCES Użytkownicy ( ID ) ;


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
