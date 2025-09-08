show tables;

rename table hoewon to hoewon2;

create table hoewon (
	mid varchar(15) not null,
	pwd varchar(15) not null,
    name varchar(15) not null,
    age int default 20,
    sex char(2) default '남자',
    ipsail date default (current_date),
    address varchar(50)
);

desc hoewon;

insert into hoewon values('hong','1234','홍길동',25,'남자','1990-10-05','서울');
insert into hoewon values('kim','1234','김말숙',33,'여자','1997-12-3','부산');
insert into hoewon values('lee','1234','이순자',24,'여자','1985-7-25','광주');
insert into hoewon values('lee1','1234','이기자',40,'남자','1999-10-3','울산');
insert into hoewon values('park','1234','박찬호',32,'남자','1980-6-08','대전');
insert into hoewon values('bae','1234','배은숙',19,'여자','1993-11-22','마산');
insert into hoewon values('son','1234','손기정',45,'남자','1987-12-15','제주');
insert into hoewon values('kim1','1234','김영숙',36,'여자','2002-10-5','부천');
insert into hoewon values('kim2','1234','김영철',39,'남자','1988-10-05','인천');
insert into hoewon values('lee2','1234','이겨라',29,'남자','2000-10-09','서울');
insert into hoewon values('son2','1234','손오공',23,'남자','2005-12-15','서울');

select * from hoewon;

alter table hoewon change sex gender char(2) default '여자';
DESC hoewon;

alter table hoewon add column point int default 1000;
select * from hoewon;

update hoewon set point=point+100 where gender='여자';

select mid as '아이디', gender as '성별', ipsail as '입사일' from hoewon where ipsail >= '2000-01-01';

select mid as '아이디', name as '성명', gender as '성별' from hoewon where name like '%영%' order by name desc limit 5;
