drop table book_info;
 CREATE TABLE "BOOK"."BOOK_INFO" 
   (   "TITLE" VARCHAR2(50 BYTE), 
   "PRICE" NUMBER, 
   "AUTHOR" VARCHAR2(50 BYTE), 
   "PUBLISHER" VARCHAR2(50 BYTE), 
   "TYPE" VARCHAR2(50 BYTE), 
   "ISBN" VARCHAR2(100 BYTE), 
   "CATEGORY" VARCHAR2(10 BYTE)
   );

--------------------------------------------------------
--  DDL for Table BRANCH_INFO
--------------------------------------------------------
drop table BRANCH_INFO;
  CREATE TABLE "BOOK"."BRANCH_INFO" 
   (   "NAME" VARCHAR2(20 BYTE), 
   "ADDRESS1" VARCHAR2(200 BYTE), 
   "ADDRESS2" VARCHAR2(200 BYTE), 
   "PHONE" VARCHAR2(11 BYTE), 
   "MASTER" VARCHAR2(20 BYTE),
   "SALES" NUMBER, 
   "TIME" VARCHAR2(200 BYTE)
   );
--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------
drop table CUSTOMER;
  CREATE TABLE "BOOK"."CUSTOMER" 
   (   "ID" VARCHAR2(20 BYTE), 
   "PWD" VARCHAR2(20 BYTE), 
   "CLASS" VARCHAR2(20 BYTE), 
   "ADDRESS1" VARCHAR2(200 BYTE), 
   "ADDRESS2" VARCHAR2(200 BYTE), 
   "ZIPCODE" VARCHAR2(10 BYTE), 
   "EMAIL" VARCHAR2(100 BYTE), 
   "PHONE" VARCHAR2(11 BYTE)
   );
--------------------------------------------------------
--  DDL for Table CUSTOMERCLASS
--------------------------------------------------------
drop table CUSTOMERCLASS;
  CREATE TABLE "BOOK"."CUSTOMERCLASS" 
   (   "NAME" VARCHAR2(100 BYTE), 
   "DISCOUNT" NUMBER, 
   "EXPLAIN" VARCHAR2(200 BYTE)
   );
--------------------------------------------------------
--  DDL for Table EBOOK_DISTLIST
--------------------------------------------------------
drop table EBOOK_DISTLIST;
  CREATE TABLE "BOOK"."EBOOK_DISTLIST" 
   (   "ISBN" NUMBER, 
   "TITLE" VARCHAR2(50 BYTE), 
   "ONO" VARCHAR2(50 BYTE)
   );
--------------------------------------------------------
--  DDL for Table EBOOK_EXTENDREQLIST
--------------------------------------------------------
drop table EBOOK_EXTENDREQLIST;
  CREATE TABLE "BOOK"."EBOOK_EXTENDREQLIST" 
   (   "ONO" NUMBER, 
   "EXTENDDATE" VARCHAR2(20 BYTE)
   );
--------------------------------------------------------
--  DDL for Table EBOOK_ORGAN
--------------------------------------------------------
drop table EBOOK_ORGAN;
  CREATE TABLE "BOOK"."EBOOK_ORGAN" 
   (   "ONO" NUMBER, 
   "OPWD" VARCHAR2(20 BYTE), 
   "ONAME" VARCHAR2(50 BYTE), 
   "DEADLINE" VARCHAR2(70 BYTE), 
   "TYPE" VARCHAR2(50 BYTE)
   );
--------------------------------------------------------
--  DDL for Table EBOOK_REQLIST
--------------------------------------------------------
drop table EBOOK_REQLIST;
  CREATE TABLE "BOOK"."EBOOK_REQLIST" 
   (   "REQNO" NUMBER, 
   "ISBN" VARCHAR2(50 BYTE), 
   "TITLE" VARCHAR2(50 BYTE), 
   "COM" VARCHAR2(50 BYTE)
   );
--------------------------------------------------------
--  DDL for Table EMPLOYEE
--------------------------------------------------------
drop table EMPLOYEE;
  CREATE TABLE "BOOK"."EMPLOYEE" 
   (   "EMPNO" NUMBER, 
   "PWD" VARCHAR2(20 BYTE), 
   "NAME" VARCHAR2(20 BYTE), 
   "EMPCLASS" VARCHAR2(20 BYTE), 
   "ADDRESS1" VARCHAR2(200 BYTE), 
   "ADDRESS2" VARCHAR2(200 BYTE), 
   "PHONE" VARCHAR2(11 BYTE), 
   "GENDER" VARCHAR2(1 BYTE), 
   "BIRTH" VARCHAR2(6 BYTE), 
   "BRANCH" VARCHAR2(20 BYTE)
   ) ;
   create sequence seq_empno_bronze INCREMENT BY 1 START WITH 3000 MAXVALUE 6000;
   create sequence seq_empno_gold INCREMENT BY 1 START WITH 2000 MAXVALUE 2999;
   create sequence seq_empno_PLATINUM INCREMENT BY 1 START WITH 1000 MAXVALUE 1999;
   create sequence seq_empno_diamond INCREMENT BY 1 START WITH 1 MAXVALUE 999;
--------------------------------------------------------
--  DDL for Table EMPLOYEECLASS
--------------------------------------------------------
drop table EMPLOYEECLASS;
  CREATE TABLE "BOOK"."EMPLOYEECLASS" 
   (   "NAME" VARCHAR2(20 BYTE), 
   "BASEPAY" NUMBER
   );
--------------------------------------------------------
--  DDL for Table INVENTORY
--------------------------------------------------------
drop table INVENTORY;
  CREATE TABLE "BOOK"."INVENTORY" 
   (   "ISBN" VARCHAR2(100 BYTE), 
   "TITLE" VARCHAR2(20 BYTE), 
  "AUTHOR" VARCHAR2(50 BYTE),
   "QUANTITY" NUMBER, 
   "BRANCH" VARCHAR2(20 BYTE)
   );
--------------------------------------------------------
--  DDL for Table ORDERLIST
--------------------------------------------------------
drop table ORDERLIST;
  CREATE TABLE "BOOK"."ORDERLIST" 
   (   "TITLE" VARCHAR2(50 BYTE), 
   "PUBLISHER" VARCHAR2(50 BYTE), 
   "QUANTITY" NUMBER, 
   "BRANCH" VARCHAR2(20 BYTE), 
   "COST" NUMBER, 
   "O_DATE" VARCHAR2(10 BYTE), 
   "ISBN" VARCHAR2(100 BYTE), 
   "ORDERNUMBER" NUMBER
   );
--------------------------------------------------------
--  DDL for Table SALARY
--------------------------------------------------------
drop table SALARY;
  CREATE TABLE "BOOK"."SALARY" 
   (   "EMPNO" NUMBER, 
   "BONUS" NUMBER, 
   "PAYMENT" NUMBER, 
   "BANK" VARCHAR2(20 BYTE), 
   "ACCOUNT" VARCHAR2(40 BYTE)
   );
--------------------------------------------------------
--  DDL for Table SALELIST
--------------------------------------------------------
drop table SALELIST;
  CREATE TABLE "BOOK"."SALELIST" 
   (   "ISBN" VARCHAR2(100 BYTE), 
   "TITLE" VARCHAR2(50 BYTE), 
   "ID" VARCHAR2(20 BYTE), 
   "DPRICE" NUMBER, 
   "BRANCHNAME" VARCHAR2(20 BYTE), 
   "QUANTITY" NUMBER, 
   "S_DATE" VARCHAR2(100 BYTE), 
   "SALENUMBER" NUMBER
   );
--------------------------------------------------------
--  DDL for Sequence EBOOK_REQNO
--------------------------------------------------------

   CREATE SEQUENCE  "BOOK"."EBOOK_REQNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ORDERNUMBER
--------------------------------------------------------

   CREATE SEQUENCE  "BOOK"."ORDERNUMBER"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ORGNO
--------------------------------------------------------

   CREATE SEQUENCE  "BOOK"."ORGNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REQNO
--------------------------------------------------------

   CREATE SEQUENCE  "BOOK"."REQNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SALENUMBER
--------------------------------------------------------

   CREATE SEQUENCE  "BOOK"."SALENUMBER"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
REM INSERTING into BOOK.BOOK_INFO
SET DEFINE OFF;