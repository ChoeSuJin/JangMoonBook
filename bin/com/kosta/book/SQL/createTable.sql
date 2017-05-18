
-- 계정 생성
create user book identified by oracle;

grant resource, connect to book;

create table Book_info (
  title varchar2(50),
  price number,
  author varchar2(50),
  publisher varchar2(50),
  type varchar2(50),
  isbn varchar2(100),
  category varchar2(10)
);

create table Customer (
  id varchar2(20),
  pwd varchar2(20),
  customerClass varchar2(20),
  address1 varchar2(200),
  address2 varchar2(200),
  zipcode varchar2(10),
  email varchar2(100),
  phone varchar2(11)
);

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


-- Sequence
create sequence orderNumber;	//	재고 주문에 필요한 주문번호