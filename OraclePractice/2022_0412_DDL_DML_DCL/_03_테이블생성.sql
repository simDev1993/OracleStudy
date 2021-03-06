create table scores
(
--변수명 자료형
--//크기는 넉넉하게 준다.
  name  varchar2(100), --byte단위 가변길이
  kor   number(5),     --숫자의 길이 단위
  eng   int, 
  mat   number(5,1),
  prev  char(4)         --byte단위 고정길이
)
/

--////////////////////////////////////////////////////////////////////--
-- DML(Data Manipulation Language) : insert update delete select(CRUD)

--데이터 삽입 - insert into ~~ values ();
insert into scores values('김길동',80,80.5,80.5,'A');
insert into scores values('나길동',90,95,100,'B');
insert into scores values('다길동',75,23,55,'C');
insert into scores values('라길동',88,55.5,60,'A'); --int형에 55.5를 넣으면 반올림이됨
insert into scores(name,kor,eng) values('바길동',99,100);

--데이터 조회 - select ~~ from ~~~ 
select * from scores
select 
   name, kor, eng, mat, prev
from scores
select
   name, kor
from scores
select
   name, kor, eng, mat, prev,
   (kor+eng+mat)/3 as avg
from scores
select
   name, kor, eng, mat, prev,
   rank() over(order by (kor+eng+mat) desc) as rank
from scores

-- 데이터 갱신 - update ~~ set ~~~ where ~~~
update scores set kor = 10;   -- <<모두 갱신
update scores set kor = 85 where name = '나길동'
update scores set eng = 90 where name = '라길동'
update scores set name = '마길동' where name = '다길동';
update scores set name = '다길동' where name = '라길동';  

-- 데이터 삭제 - delete ~~ from ~~~ where ~~~
delete from scores --전체 데이터 삭제
delete from scores where name = '바길동'
delete from scores where 1 = 1; -- 전체 데이터 삭제

--///////////////////////////////////////////////////////////////////--
-- DDL(Data Definition Language) : create(생성), drop(삭제), alter(수정)

-- 테이블 수정
-- 1. 칼럼 추가
-------------칼럼 추가시 이슈사항 : 칼럼을 추가하면 이전의 연산식을 수정해야한다.(사전 데이터 설계의 중요성)
alter table scores add sci int;
alter table scores add commt varchar2(600); --최대 200글자
update scores set sci = 100, commt = '잘했어요.';
select * from scores
-- 2. 칼럼 삭제
alter table scores drop column prev;

-- 테이블 삭제
drop table scores; 

