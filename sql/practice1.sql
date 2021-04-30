create database Studmanager;
use Studmanager;
-- create table Student, Course, Class, SC
create table Student(
Sno	char(7)		not null,
Sname 	varchar(20)	not null,
Ssex	char(2)		not null,
Sage	smallint,
Clno	char(5)		not null,

primary key(Sno)
);

create table Course(
Cno	char(1)		not null,
Cname	varchar(20)	not null,
Credit	smallint,

primary key(Cno)
);

create table Class(
Clno		char(5)		not null,
Speciiality	varchar(20)	not null,
Inyear		char(4)		not null,
Number		Integer,
Monitor		char(7),

primary key(Clno)
);

create table SC(
Sno   char(7)	not null,
Cno   char(1)	not null,
Gmark Numeric(4, 1)
);

--  1. 在学生表中添加两个字段，phone（varchar(50)，可以为空），email（varchar(50)，可以为空），并且要求这2个字段不能同时为空。
alter table Student
add phone varchar(50);

alter table Student
add email varchar(50);

alter table Student
add check(phone is not null or email is not null);

--   2. 将Class表中，“入校年份”的数据类型改为date型。
alter table Class
modify Inyear date;
-- or you can do this
-- alter table Class
-- change Inyear Inyear date not null;

--   3. 在Student表中添加字段IDCard（身份证号），18位定长字符，不允许为空，要求惟一。
alter table Student
add IDCard  char(18)  not null unique;
-- 4. 在Student表中添加字段institute（专业），最长是10个汉字，不允许为空，默认值为“计算机科学与技术”。
alter table Student
add institude nvarchar(10) not null default '计算机科学与技术';
--   5. 对Student表中的性别，添加默认值为“男”。
-- PROBLEM here invalid value for Ssex when using default value '男'
-- alter table Student
-- modify Ssex char(2) default 'na';

-- FIXME
alter table Student
modify Ssex nchar(1) default '男';

--  6. 对SC表中的sno,cno创建主键约束。
alter table SC
add primary key(sno, cno);
-- 7. 对Student表中的年龄字段，添加约束，要求年龄在14到65之间。
alter table Student
add check(Sage >= 14 and Sage <= 65);

--   8. 对Class表中的Monitor创建外键。
alter table Class
add foreign key(Monitor) references Student(Sno);
-- 9. 对Course表中的学分字段，要求只能是1、2、3、4、5、6这几个数。
alter table Course
add check(Credit in (1, 2, 3, 4, 5, 6));
--   10. 为学生表添加标识列，种子为1，增量为1。
alter table Student
add id int not null unique auto_increment;

-- MODULE 练习3 操作数据
-- a. clno 字段为空， email 与 phone 字段同时为空， institute 为空
-- b. 成功
-- c. 成功插入

update Student
set institute='计算机';

update Student
set phone='13633556789'
where Sname='王刚';

delete from Student
where Sno='40921';

