use studmanager;

-- MODULE 练习1
create table Student(
       sno   char(7)	 not null,
       sname varchar(20) not null,
       ssex  char(2)	 not null,
       sage  smallint,
       clno  char(5)	 not null,

       primary key(sno)
);

create table Course(
       cno	char(1)	    not null,
       cname 	varchar(20) not null,
       credit	smallint,

       primary key(cno)
);

create table Class(
       clno	  char(5)	    not null,
       speciality varchar(20)	    not null,
       inyear	  char(4)	    not null,
       numer	  integer,
       monitor	  char(7),

       primary key(clno)
);

create table SC(
       sno   char(7) not null,
       cno   char(1) not null,
       gmark numeric(4, 1) 
);

-- MODULE 练习2
alter table Student
add phone varchar(50);

alter table Student
add email varchar(50);
		
alter table Student
add check(phone is not null or email is not null);

alter table Class
modify inyear date;

alter table Student
add idcard	char(18) not null unique;

alter table Student
add institute 	nvarchar(10) not null default '计算机科学与技术';

alter table Student
modify ssex char(2) default '男';

alter table SC
add primary key(sno, cno);

alter table Student
add check(year >= 14 and year <= 65);

-- PROBLEM 第八题 
alter table Class
add constraint fk
foreign key(Monitor) references Student(sno);


alter table Course
add check(credict in (1, 2, 3, 4, 5, 6));

-- 第10题, Mysql 中的`auto_increment 相当于 mssql 中的 identity
alter table Student
add id int not null auto_increment unique;

-- MODULE 练习三
insert into Student(sno, sname, ssex, sage, clno, phone, email, idcard, institute)
values ('00861', '张良', '男', 30, '', '', '', 1234, ''),
       ('40921', '李思思', '女', 27, '10003', '13022336789', '', 5555, default),
       ('01033', '王刚', '男', 85, '10004', '', 'wgf@163.com', 1234, '会计');

-- 不能
-- 1. -> ERROR 1366 (HY000): Incorrect string value: '\xE5\xBC\xA0\xE8\x89\xAF' for column 'sname' at row 1, 数据类型不对，sname应该是nvarchar(20)
-- 2. IDCard 字段为 unique，有相同的数据插入，发生错误

-- PROBLEM 2


update Student
set phone='13633556789'
where sname='王刚';

delete from Student
where sno='40921';


