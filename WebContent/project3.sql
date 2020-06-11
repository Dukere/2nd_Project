create table membership
(
	name VARCHAR(20) NOT NULL,
	id VARCHAR(30) NOT NULL PRIMARY key,
	pass VARCHAR(30) NOT null,
	tel VARCHAR(30),
	mobile VARCHAR(30) NOT NULL,
	email VARCHAR(100) NOT NULL,
	openemail VARCHAR(5) NOT NULL DEFAULT 'n',
	zip VARCHAR(10) NOT NULL,
	addr VARCHAR(100) NOT NULL,
	extraaddr VARCHAR(100),
	regidate datetime DEFAULT CURRENT_TIMESTAMP, 
	auth VARCHAR(10) DEFAULT 'normal'
);

DROP TABLE membership;

INSERT into membership VALUES (
	'정덕래',
	'admin',
	'1234',
	'',
	'010-7499-6255',
	'j941223@gmail.com',
	'yes',
	'서울 금천구 가산동 149-64',
	default,
	'admin'
); 

INSERT into membership(name, id, pass, tel, mobile, email, openemail, addr) VALUES (
	'1234',
	'1234',
	'1234',
	'',
	'010-7499-6255',
	'j941223@gmail.com',
	'yes',
	'서울 금천구 가산동 149-64'
); 

create table board
(
    num int not NULL auto_increment,
    title varchar(100) not null,
    content text not null,
    postdate datetime default CURRENT_TIMESTAMP,
    id VARCHAR(30) not null,
    visitcount MEDIUMINT NOT NULL DEFAULT 0,
    bname VARCHAR(20) NOT NULL,
    ofile VARCHAR(100),
    sfile VARCHAR(100),
	 primary key (num)
);

DROP TABLE board;

INSERT INTO board(title, content, id, bname)
 VALUE ('여긴 공지사항1', '내용없음', 'admin', 'notice');
 INSERT INTO board(title, content, id, bname)
 VALUE ('여긴 공지사항2', '내용없음', 'admin', 'notice');
 INSERT INTO board(title, content, id, bname)
 VALUE ('여긴 공지사항3', '내용없음', 'admin', 'notice');
 INSERT INTO board(title, content, id, bname)
 VALUE ('여긴 공지사항4', '내용없음', 'admin', 'notice');
 INSERT INTO board(title, content, id, bname)
 VALUE ('여긴 공지사항5', '내용없음', 'admin', 'notice');
 
 create table request_form_blue
(
    num int not NULL auto_increment,
    name varchar(100) not null,
    addr text not null,
	 tel VARCHAR(30),
	 mobile VARCHAR(30) NOT NULL,
	 email VARCHAR(100) NOT NULL,
	 cleantype VARCHAR(50) NOT NULL,
	 AREA VARCHAR(10) NOT NULL,
    postdate datetime default CURRENT_TIMESTAMP,
    id VARCHAR(30) not null,
    cleandate VARCHAR(30) NOT null,
    receipt VARCHAR(20),
    memo VARCHAR(100),
	 primary key (num)
);

 create table request_form_exp
(
    num int not NULL auto_increment,
    name varchar(100) not null,
    disabled VARCHAR(10) NOT NULL,
    disabledtype VARCHAR(50) NOT NULL,
    equip VARCHAR(10) NOT NULL,
    equipname VARCHAR(50) NOT NULL,
	 tel VARCHAR(30),
	 mobile VARCHAR(30) NOT NULL,
	 email VARCHAR(100) NOT NULL,
	 cakeexp VARCHAR(50) NOT NULL,
	 cookieexp VARCHAR(50) NOT NULL,
    postdate datetime default CURRENT_TIMESTAMP,
    id VARCHAR(30) not null,
    expdate VARCHAR(30) NOT null,
    Receipt VARCHAR(20),
    memo VARCHAR(100),
	 primary key (num)
);

CREATE TABLE shop_products (
	num int not NULL auto_increment,
	image VARCHAR(100) NOT NULL,
	NAME VARCHAR(100) NOT NULL,
	price int NOT NULL,shop_products
	mileage INT NOT NULL,
	primary key (num)
);

INSERT INTO shop_products (image, NAME, price, mileage)
	VALUE ('prod1.png', '띠껍티콘',5000, 50);
INSERT INTO shop_products (image, NAME, price, mileage)
	VALUE ('prod2.jpg', '곱창',30000, 300);
INSERT INTO shop_products (image, NAME, price, mileage)
	VALUE ('prod3.png', '루주라',50000, 500);
INSERT INTO shop_products (image, NAME, price, mileage)
	VALUE ('prod4.jpg', '시크릿쥬쥬',60000, 600);
INSERT INTO shop_products (image, NAME, price, mileage)
	VALUE ('prod5.png', '커밋',3000, 30);
INSERT INTO shop_products (image, NAME, price, mileage)
	VALUE ('prod6.png', '은석이 콧물',1000, 10);
INSERT INTO shop_products (image, NAME, price, mileage)
	VALUE ('prod7.png', '장발메시',200000, 2000);
INSERT INTO shop_products (image, NAME, price, mileage)
	VALUE ('prod8.jpg', '은석이 혀',2000, 20);
	
CREATE TABLE shop_basket (
	basket_num int not NULL auto_increment,
	num INT NOT NULL,
	id VARCHAR(50) NOT NULL,
	qty INT not NULL,
	total INT NOT NULL,
	primary key (basket_num)
);

alter table shop_basket add foreign key (num) REFERENCES shop_products(num);

CREATE table shop_ordering (
	num int not NULL auto_increment,
	id VARCHAR(30) NOT NULL,
	oname VARCHAR(30) NOT NULL,
	ozip VARCHAR(10) NOT NULL,
	oaddr VARCHAR(100) NOT NULL,
	oextraaddr VARCHAR(300),
	omobile VARCHAR(20) NOT NULL,
	oemail VARCHAR(50) NOT NULL,
	sname VARCHAR(30) NOT NULL,
	szip VARCHAR(10) NOT NULL,
	saddr VARCHAR(100) NOT NULL, 
	sextraaddr VARCHAR(300),
	smobile VARCHAR(20) NOT NULL,
	semail VARCHAR(50) NOT NULL, 
	ordering VARCHAR(200) NOT NULL,
	total VARCHAR(50) NOT NULL,
	payment VARCHAR(30) NOT NULL,
	primary key (num)
);

DROP TABLE shop_ordering;