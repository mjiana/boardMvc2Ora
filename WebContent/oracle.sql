create table board(
	num int not null,
	writer varchar2(10) not null,
	email varchar2(30) default null,
	subject varchar2(50) not null,
	passwd varchar2(12) not null,
	reg_date date not null,
	readcount int default 0,
	ref int not null,
	re_step int not null,
	re_level int not null,
	content varchar2(2000) not null,
	ip varchar2(20) not null,
	primary key(num)
);
create sequence board_num_seq;
drop table board;
drop sequence board_num_seq;