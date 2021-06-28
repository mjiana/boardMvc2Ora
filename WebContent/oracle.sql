create table board3(
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
create sequence board3_num_seq;
--drop table board3;
--drop sequence board3_num_seq;

select * from board3;
select max(num) from board3;
select reg_date from board3;

select a.* from
 (select ROWNUM as RN, b.* from
  (select * from board3 order by ref desc, re_step asc) b
 ) a
  where a.RN >= 1 and a.RN <= 3;
  
  
  

select count(*) from board3 where subject like '%'||1||'%' ;
select count(*) from board3 where subject like '%'||'1'||'%';
select count(*) from board3 where subject like '%'||'a'||'%';



select a.* from
 (select ROWNUM as RN, b.* from
  (select * from board3 where writer like '%'||'a'||'%' order by ref desc, re_step asc) b
 ) a
  where a.RN >= 1 and a.RN <= 3;
  