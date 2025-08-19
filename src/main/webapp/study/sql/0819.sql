show tables;

desc test1;

/*
	기본키(Primary key) : 테이블을 대표하는 키, 중복을 허용하지 않는다.
	- 기본키아의 필드를 여러개 줄수는 있으나, 독립필드로 여러개의 기본키는 허용하지 않는다. 
	- Primary key는 자동 인덱싱 된다.
*/

create table test2 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	address varchar(50)
);

desc test2;

create table test3 (
	idx int not null,
	name varchar(20) not null,
	age int default 20,
	/* test3Code varchar(10) not null primary key */
	test3Code varchar(10) not null,
	primary key(name, test3Code)
);

desc test3;

/*
	중복불가능키(unique key)
	primary key를 대신해서 중복을 불허시키고자 할때 사용하는 키 - 자동 인덱싱 된다.
 */
create table test4 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	test4Code varchar(10) not null unique key
);

desc test4;
drop table test4;

insert into test4 values (default, '냉장고', 1000, 'N001');
insert into test4 values (default, '오디오', 500, 'A002');
insert into test4 values (default, '선풍기', 800, 'S001');
insert into test4 values (default, '에어컨', 1500, 'AI001');
insert into test4 values (default, '전자레인지', 850, 'JJ001');
insert into test4 values (default, '전기밥솥', 700, 'JG002');
insert into test4 values (default, '다리미', 300, 'JG002');

select * from test4;

/*
 	외래키(foreign key) : 하나의 테이블에서 다른테이블의 정보를 찾기위해서는 테이블 서로간의 관계설정을 하여야 한다.
 		이때 주테이블의 키는 중복될수 없는키(primary key, unique key)가 되어야 되고, 관계설정 맺은 테이블의 필드(키)를 외래키라고 한다.
 */

create table test5 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	test4Code varchar(10) not null,
	foreign key(test4Code) references test4(test4Code)
);

insert into test5 values (default, '홍길동', 23, 'N001');
--insert into test5 values (default, '홍길동', 23, 'N002');
insert into test5 values (default, '홍길동', 23, 'N001');

select * from test5;

desc test5;

/*------------------------------------------------------------*/

/* 학과(hakkwa) 테이블 */
CREATE TABLE hakkwa(
	code INT NOT NULL PRIMARY KEY, /*학과코드*/
	name VARCHAR(20) NOT NULL, /*학과명*/
	UNIQUE KEY(name)
);
DESC hakkwa;
DROP TABLE hakkwa;

-- 기본키 추가
ALTER TABLE hakkwa ADD PRIMARY KEY(code);
-- 기본키 삭제
ALTER TABLE hakkwa DROP PRIMARY KEY;

-- UNIQUE KEY 추가
ALTER TABLE hakkwa ADD UNIQUE KEY(name);
-- UNIQUE KEY 삭제
ALTER TABLE hakkwa DROP INDEX name;

INSERT INTO hakkwa VALUES (101, '컴퓨터공학과');
INSERT INTO hakkwa VALUES (102, '경영학과');
INSERT INTO hakkwa VALUES (103, '건축공학과');
INSERT INTO hakkwa VALUES (104, '토목공학과');
INSERT INTO hakkwa VALUES (105, '기계공학과');
INSERT INTO hakkwa VALUES (106, '영문과');
INSERT INTO hakkwa VALUES (107, '물리과');
-- INSERT INTO hakkwa VALUES (107, '화학과');
-- INSERT INTO hakkwa VALUES (108, '물리과');

SELECT * FROM hakkwa;
SELECT * FROM hakkwa ORDER BY name DESC;

/* 학생정보테이블(student) */
CREATE TABLE student (
	idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY, /*학생 고유번호*/
	name VARCHAR(20) NOT NULL, /*학생 성명*/
	hakkwa_code INT, /*학과코드(hakkwa테이블의 code필드와 관계설정) - 외래키*/
	age INT DEFAULT 20,
	FOREIGN KEY(hakkwa_code) REFERENCES hakkwa(code) 
	ON UPDATE CASCADE 
	-- ON DELETE RESTRICT
	ON DELETE RESTRICT
);

DESC student;
DROP TABLE student;
ALTER TABLE student ADD FOREIGN KEY hakkwa_code;

INSERT INTO student VALUES (default, '홍길동', 101, default);
INSERT INTO student VALUES (default, '김말숙', 102, 22);
INSERT INTO student VALUES (default, '이기자', 102, 32);
INSERT INTO student VALUES (default, '소나무', 103, 28);
INSERT INTO student VALUES (default, '오하늘', 104, 24);
INSERT INTO student VALUES (default, '김연아', 104, default);
INSERT INTO student VALUES (default, '강감찬', 103, 20);
INSERT INTO student VALUES (default, '홍길순', 104, 19);
INSERT INTO student VALUES (default, '고인돌', 105, 18);
INSERT INTO student VALUES (default, '손흥민', 105, default);
INSERT INTO student VALUES (default, '아톰맨', 105, 27);
INSERT INTO student VALUES (default, '비톰맨', 106, 31);
-- INSERT INTO student VALUES (default, '비톰맨', 108, 31);

SELECT * FROM student;

SELECT * FROM hakkwa WHERE code=101;
SELECT * FROM student WHERE hakkwa_code=108;
SELECT * FROM student WHERE name='비톰맨';

DELETE FROM hakkwa WHERE code=101;
DELETE FROM hakkwa WHERE code=106;

UPDATE student SET hakkwa_code=101 WHERE name='비톰맨';
UPDATE hakkwa SET code=108 WHERE code=101;

-- 현재 시스템(DBMS)에 모든 제약조건을 확인하기
SELECT * FROM information_schema.TABLE_CONSTRAINTS;
SELECT * FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA='springgroup';

--springgroup데이터베이스의 student테이블의 foreing key를 삭제
ALTER TABLE student DROP FOREIGN KEY student_ibfk_1;

/*----------------활용(조인:JOIN) 설정 ----------------*/

-- Inner Join = 일반조인 = 내부조인 = 교집합
SELECT * FROM hakkwa INNER JOIN student WHERE hakkwa.code = student.hakkwa_code;
SELECT * FROM hakkwa INNER JOIN student ON hakkwa.code = student.hakkwa_code;
SELECT * FROM hakkwa INNER JOIN student ON hakkwa.code = student.hakkwa_code ORDER BY hakkwa.name;
SELECT * FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;
SELECT * FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code WHERE s.hakkwa_code=105 ORDER BY h.name;
SELECT h.*, s.name FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;
SELECT h.*, s.name AS 성명 FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;
SELECT h.*, s.name AS 성명, s.age AS 나이 FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;

-- Left Join = Left Outer Join : 왼쪽테이블이 기준이고, 오른쪽 테이블을 조합한다.(즉, 왼쪽테이블의 모든 필드가 출력되게한다.)
SELECT * FROM hakkwa h LEFT JOIN student s ON h.code = s.hakkwa_code;
SELECT * FROM hakkwa h LEFT JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;

-- Right Join = Right Outer Join : 오른쪽테이블이 기준이고, 왼쪽 테이블을 조합한다.(즉, 오른쪽테이블의 모든 필드가 출력되게한다.)
SELECT * FROM hakkwa h Right JOIN student s ON h.code = s.hakkwa_code;
SELECT * FROM hakkwa h Right JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;

-- Cross Join : 곱집합의 개념으로 모든 자료를 크로스해서 가져온다.
SELECT * FROM hakkwa, student;

-- 응용
SELECT * FROM hakkwa h, student s WHERE h.code=s.hakkwa_code;
SELECT * FROM hakkwa h, student s WHERE h.code=s.hakkwa_code and s.hakkwa_code=105;

-- 합집합 : 완전 외부조인(Full Outer Join) - MySQL에서는 지원하지 않는다.
-- SELECT * FORM hakkwa h FULL OUTER JOIN student s;
-- MySQL에서는 union을 이용하여 합집합의 개념으로 사용한다. - Merge(병합)
-- 해당테이블의 필드명이 같으면 병합테이블로 만들어주지만, 필드명이 다르면 왼쪽테이블 기준으로 처리한다.
-- 병합할 테이블의 컬럼수를 일치시켜서 조회처리한다.
-- ALL 사용하면 중복자료도 모두 출력한다.
SELECT * FROM hakkwa UNION SELECT hakkwa_code,name AS irum FROM student;
SELECT code FROM hakkwa UNION SELECT hakkwa_code FROM student;
select code from hakkwa union all select hakkwa_code as code from student;
select * from hakkwa union all select hakkwa_code as code, name as irum from student;
select * from hakkwa union select hakkwa_code as code, name as irum from student;