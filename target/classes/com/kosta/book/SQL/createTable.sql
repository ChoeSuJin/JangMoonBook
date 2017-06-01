
create user book identified by oracle;

grant resource, connect to book;

 CREATE TABLE BOOK_INFO 
   (   TITLE VARCHAR2(200 BYTE), 
   PRICE NUMBER, 
   AUTHOR VARCHAR2(100 BYTE), 
   PUBLISHER VARCHAR2(100 BYTE), 
   TYPE VARCHAR2(100 BYTE), 
   ISBN VARCHAR2(100 BYTE), 
   CATEGORY VARCHAR2(10 BYTE), 
   ID VARCHAR2(100 BYTE), 
   BOOK NUMBER
   );
create table Customer (
  id varchar2(20),
  pwd varchar2(20),
  customerClass varchar2(20),
  zipcode varchar2(10),
  address1 varchar2(200),
  address2 varchar2(200),
  email varchar2(100),
  phone varchar2(11)
);

--QNA 게시판
create table board(
    bno number not null,
    title varchar2(200) not null,
    content varchar2(4000),
    writer varchar2(50),
    regdate date default sysdate,
    viewcnt number default 0,
    primary key(bno)

);
create sequence bno_seq;


create table Employee (
  empNo number,
  pwd varchar2(20),
  name varchar2(20),
  empClass varchar2(20),
  address1 varchar2(200),
  address2 varchar2(200),
  phone varchar2(11),
  gender varchar2(1),
  birth varchar2(6),
  branch varchar2(20)
);

create table branch_info(
  name varchar2(20),
  address1 varchar2(200),
  address2 varchar2(200),
  phone varchar2(11),
  Master varchar2(20),
  EmpCount number,
  Sales number,
  Time varchar2(200)
);

create table SaleList (
  orderNumber number,
  isbn varchar2(100),
  title varchar2(50),
  id varchar2(20),
  dPrice number,
  branchName varchar2(20),
  quantity number,
  s_date varchar2(100)
);

create table CustomerClass(
  name varchar2(100),
  discount number,
  explain varchar2(200)
);

create table orderList(
  orderNumber number,
  isbn varchar2(100),
  title varchar2(50),
  publisher varchar2(50),
  quantity number,
  branch varchar2(20),
  cost number,
  o_date varchar2(10)
);

create table Inventory(
  isbn varchar2(100),
  title varchar2(20),
  quantity number,
  branch varchar2(20)
);

create table EmployeeClass(
  name varchar2(20),
  basePay number
);

create table Salary(
  empno number,
  bonus number,
  payment number,
  bank varchar2(20),
  account varchar2(40)
);

-- 고객공지사항
create table notice(
  title varchar2(50) not null,
  content varchar2(3000) not null,
  regDate DATE,
  ArticleNumber number
);

create table ebook_organ(
  ono number,
  opwd varchar2(20),
  oname varchar2(50),
  deadline varchar2(70),
  type varchar2(50)
);

create table ebook_distList(
  ISBN number,
  title varchar2(50),
  com varchar2(50)
);

create table ebook_reqList(
  ebook_reqNo number,
  isbn varchar2(50),
  title varchar2(50),
  com varchar2(50)
);
create table ebook_extendReqList(
  ono number,
  extendDate varchar2(20)
);

create table ebook_reqList(
  ISBN number,
  title varchar2(50),
  com varchar2(50)
);

create table ebook_distList(
  ISBN number,
  title varchar2(50),
  com varchar2(50)
);

-- 사내공지사항
create table AdminNotice (
  num number,
  writer varchar2(100),
  title varchar2(1000),
  content varchar2(2000),
  regDate date
);
-- 주문
create table customerorder(
    orderno number,
    name varchar2(50),
    zipcode varchar2(20),
    address1 varchar2(100),
    address2 varchar2(100),
    orderDate date default sysdate,
    phone varchar2(50),
    primary key(orderno)

);
-- 장바구니
  CREATE TABLE CART
   (STATUS VARCHAR2(50 BYTE),
   CARTNO NUMBER, 
   ID VARCHAR2(50 BYTE), 
   ISBN VARCHAR2(50 BYTE), 
   TITLE VARCHAR2(100 BYTE), 
   IMAGE VARCHAR2(100 BYTE), 
   PRICE NUMBER, 
   AMOUNT NUMBER DEFAULT 0, 
   MONEY NUMBER DEFAULT 0
   );
-- Sequence
create sequence orderNumber;	//	재고 주문에 필요한 주문번호
create sequence salenumber;		//  고객들의 주문에 대한 주문번호 부여
create sequence bno_seq;
create sequence orgno;
create sequence ebook_reqNo;
create sequence seq_adminNotice;	// 사내공지사항번호
create sequence cus_order_seq;
create sequence cart_seq;

