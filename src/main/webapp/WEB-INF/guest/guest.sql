show tables;

create table guest(
	idx int not null auto_increment primary key, /*방명록 고유번호*/
	name varchar(20) not null, /*방명록 작성자 성명*/
	content text not null, /*방명록 글 내용*/
	email varchar(50), /*메일주소*/
	homepage varchar(50), /*홈페이지주소(블로그주소)*/
	vDate dateTime default now(), /*방문일자*/
	hostIP varchar(30) /*방문자의 접속 IP*/
);

desc guest;

insert into guest values (default, '관리자', '방명록 서비스를 시작합니다', 'fam123123@naver.com', 'https://github.com/jigyeong-501/javaDatabase', default, '192.168.50.62');

select * from guest;

select * from guest limit 5;
select * from guest limit 0,5;
select * from guest limit 5,5;

select * from guest order by idx desc
select count(*) from guest;
select count(*) from guest where name='aaa';