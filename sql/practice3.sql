create database mydb;
use mydb;

create table student(
sno int primary key,
sname nvarchar(20),
ssex nvarchar(1),
sage tinyint,
sdept varchar(40)
);

create table course(
cno int primary key,
cname nvarchar(20),
cpno int,
credit int
);

create table sc(
sno int not null,
cno int not null,
grade decimal(10, 2),
testtime date,
primary key(sno, cno)
);

insert into student
values (95001,'李敏勇','男',20,'CS'),
(95002,'刘晨','女',19,'IS'),
(95003,'王敏','女',18,'MA'),
(95004,'张立','男',18,'IS'),
(95005,'王敏','男',19,'CS'),
(95006,'丁一','女',20,'IS'),
(95007,'李响','男',19,'CS'),
(95008,'许磊','男',20,'MA');

insert into course
values (1,'数据库',5,4),
       (2,'数学',null,2),
       (3,'信息系统',1,4), 
       (4,'操作系统',6,3),
       (5,'数据结构',7,4),
       (6,'数据处理',null,2),
       (7,'Pascal语言',6,4);

insert into sc
values (95001,1,92,'2017-6-20'),
       (95001,2,88,'2017-6-23'), 
       (95001,3,88,'2017-6-26'), 
       (95002,2,90,'2017-6-23'), 
       (95002,3,80,'2017-6-26'), 
       (95003,1,92,'2017-6-20'), 
       (95003,3,85,'2017-6-26'), 
       (95005,1,99,'2017-6-20'), 
       (95005,2,95,'2017-6-23'), 
       (95005,3,98,'2017-6-26'), 
       (95005,5,56,'2017-6-29'), 
       (95006,1,89,'2017-6-20'), 
       (95006,2,75,'2017-6-23'), 
       (95006,4,92,'2017-6-30'), 
       (95008,2,78,'2017-6-23'), 
       (95008,3,88,'2017-6-26'), 
       (95008,4,46,'2017-6-30');


-- 练习1:简单数据查询
-- 1:查询全体学生的学号与姓名
select sno, sname from student;
-- 2:查询全体学生的姓名, 年龄及所在系（用“系名”来表示列名） PROBLEM
select sname, sage, sdept as '系名' from student;
-- 3:查询选修了课程的学生学号
select distinct sno from sc;
-- 4:查询全体学生的学号、姓名、出生年份
select sno, sname, sage from student;
-- 5:查询所有年龄在20岁以下的学生姓名及其年龄
select sname, sage from student
where sage <= 20;
-- 6:查询年龄在20到23间（含20和23岁）的学生的姓名,系别及年龄
select sname, sdept, sage from student
where sage <= 23 and sage >= 20;
-- 7:查询年龄不在20到23间的学生的姓名,系别及年龄
select sname, sdept, sage from student
where sage < 20 and sage > 23;
-- 8:查询不是信息系(IS)和计算机系(CS)学生的姓名和性别
select sname, ssex from student
where sdept not in ('IS', 'CS');
-- 9:查询所有姓刘的学生的姓名,学号和性别
select sname, sno, ssex from student
where sname like '刘%';
-- 10:查询名字中第2个字为”敏”字的学生姓名和学号
select sname, sno from student
where sname like '_敏_';
-- 11:查询全体学生情况，结果按所在系的号升序排列，同一系中的学生按年龄降序
select * from student
order by sdept, sage desc;
-- 12:查询学分为3分及以上且有先修课程的课程号、课程名
select cno, cname from course
where credit >= 3 and cpno is not null;
-- 13:查询成绩排在前10的学生学号及课程号
select sno, cno from sc
order by grade desc
limit 10;
-- 14:查询没有先修课程的课程信息
select * from course
where cpno is null;




-- 练习2：使用统计函数
-- 1.查询学生的总人数
select count(*) as 'count of student' from student;
-- 2.查询选修了课程的学生人数
select count(*) from
(select distinct sno from sc) as t;
-- 3.计算选2号课程的学生平均成绩，保留2位小数（提示：使用convert函数可以设置输出效果）
select convert(avg(grade), decimal(10, 2)) from sc
where cno = 2;
-- 4.查询选修3号课程的学生最高分数
select max(grade) from sc
where cno = 3;
-- 5.查询有多少课程被学生选修
select count(*) from
(select distinct cno from sc) as t;
-- 6.查询总的课程数
select count(*) from course;
-- 7.查询没有先修课的课程数
select count(*) from
(select * from course where cpno is null) as t;
-- 8.查询成绩在80-90分（含边界值）的学生人数
select count(*) from
(select * from sc
where grade >= 80 and grade <= 90) as t;
-- 9.查询成绩在80-90分（不含边界值）的学生人数（重复学号不计）
select count(*) from
(select * from sc
where grade > 80 and grade < 90) as t;
-- 10.查询参加过考试的学生人数（一个学生参加多次考试的情况不重复计算）PROBLEM


-- 练习3：分组统计查询
-- 1.查询选修了课程的同学的选课数目、最高分
select sno, count(*), max(grade) from sc
group by sno;
-- 2.查询各学分等级的课程数目
select credit, count(*) from course
group by credit;
-- 3.查询信息系（IS）男女生的人数
select ssex, count(*) as '人数' from student
where sdept = 'IS'
group by ssex;
-- 4.查询人数最多的系及相应的人数
select sdept, count(*) as 'count' from student
group by sdept
order by count desc;
-- 5.统计已被选的每门课程的选课人数，显示课程号、选课人数
select cno, count(*) as 'count' from sc
group by cno;
-- 6.统计每个专业的学生人数，显示专业名和学生人数，按人数降序显示
select sdept, count(*) as 'count' from student
group by sdept
order by count desc;
-- 7.统计每个专业19岁（含）以上的男生人数，显示专业名和人数
select sdept, count(*) as 'count' from student
where ssex = '男' and sage >= 19
group by sdept;
-- 8.查询选修了2门及以上课程的学生的学号和平均成绩，并根据平均成绩降序排列
select sno, count(1) as 'result' from sc
group by sno;
-- PROBLEM Here
select sno, count(*) as 'count' from sc
group by sno
having count > 1;
-- 9.统计学生的平均分，显示平均分高于85分（不含85）的学生学号及平均分
select sno, avg from
    (select sno, avg(grade) 'avg' from sc
     group by sno) as result
where avg > 85;

-- 10.显示没有一门功课不及格的学生的学号、选课数和最高分
-- firstly is the second table

-- 练习4：连接查询
-- TODO some prepare
create table t1(
       `id` int primary key,
       `person` nvarchar(50) not null
);

create table t2(
       `id` varchar(50) primary key,
       `person` nvarchar(50) not null
);       

insert into t1(id, person)
values (1, '小明'),
       (2, '小红'),
       (3, '小强');

insert into t2(id, person)
values ('A', '小明'),
       ('B', '小红'),
       ('C', '小刚');

-- innert join
select
	t1.id, t2.id
from
	t1
	inner join
	t2
	on
	t1.person = t2.person;
-- left join
select
	t1.id, t2.id
from
	t1
	left join
	t2
	on
	t1.person = t2.person;

select
	t1.id, t2.id
from
	t1
	right join
	t2
	on
	t1.person = t2.person;

-- 1.查询选修“数据库”课程的学生的学号
select
	sno
from
	sc
where
	cno = 1;
-- 2.查询学生“李敏勇”，成绩大于80分的课程号、成绩
-- TODO without join
select
	cno, grade
from
	sc
where
	sno
	in
	(select
		sno
	from
		student
	where
		sname = '李敏勇');
		      
	
-- TODO with join
select
	cno, grade
from
	sc
	join
	student
	on
	sc.sno = student.sno
	where
	student.sname = '李敏勇';
	
-- 3. 查询选课表中每位学生的平均分，显示学生姓名和平均分（注意重名情况）
select
	student.sname, grade
from
	student
	join
	(select
		sno, avg(grade) as 'grade'
         from
		sc
		group by
		sno
	) as tbl
	on
	student.sno = tbl.sno;
-- 4.查询“数学”考试超过75分的学生的总人数
-- ATTENTION join is join, check the joined table
select
	count(*) as 'count'
from
	sc join course
	on sc.cno = course.cno
	where
	course.cname = '数学';
	

-- 5. DONE 查询选课人数最多的课程号、课程名
select
	distinct course.cno, course.cname, count(*)
from
	sc join course
	on
	sc.cno = course.cno
	group by cno;
	
-- 6. DONE 查询选4学分的课最多的学生的学号、姓名和课程数
select
	sno, sname, count(*) as 'classcount'
from
	(
	 select
		 student.sno, sc.cno, student.sname
	 from
		 student join sc
		 on student.sno = sc.sno
		 join
		 course
		 on
		 course.cno = sc.cno
		 and
		 course.credit = 4
	) as tbl
group by
      sno
order by
      classcount desc
limit 1;
	
      
-- 7. DONE 查询选课人数超过2人且平均分高于90分的课程号、课程名
-- 查询课程
select
	course.cno, course.cname
from
	course
	join
	(
	select
		cno, count(*), avg(grade)
	from
		sc
		group by
		cno
	having
		avg(grade) > 90
	  	and
		count(*) > 2
	) as tbl
	on
	course.cno = tbl.cno;
-- 8. DONE 查询所有学生的选课情况，显示学生姓名、课程名称和成绩
-- sno, cno, grade are all in the `sc` table
select
	sname, cname, grade
from
	student
	join
	sc
	on student.sno = sc.sno
	join
	course
	on sc.cno = course.cno;
-- 9. DONE 查询所有课程的选课情况，显示课程名、选课人数，如果没有人选，选课人数显示为0
select
	course.cname, count(sno)
from
	sc
	right join
	course
	on sc.cno = course.cno
group by
	course.cno;


-- 10. DONE 查询所在系相同的学生，显示的列名包括学生学号、姓名、系名、相同系的学生学号、姓名，剔除自己跟自己系相同及其他重复的情况
-- PROBLEM 重复，对称
select
	a.sname, a.sdept, b.sno, b.sname
from
	student as a
	join
	student as b
	on a.sdept = b.sdept and a.sno != b.sno;
	
-- 11. DONE 查询学分相同的课程，显示的列名包括课程名称、学分、相同学分的另一课程名称
select
	a.cname, a.credit, b.cname
from
	course as a
	join
	course as b
	on a.credit = b.credit
	   and a.cno != b.cno;
-- 12. DONE 查询所有课程的先修课程情况，显示课程名、先修课程名
select
	a.cname, b.cname
from
	course as a
	join
	course as b
	on a.cpno is not null
	   and a.cpno = b.cno;
--
-- 练习5：子查询
-- 1. DONE 查询至少参加了三次考试的学生姓名（用子查询）
select
	sname
from
	student
	join
	(
	 select
		 sno, count(cno)
	 from
		 sc
		 group by
		 sno
	 having
		 count(cno) >= 3
	) as tbl
	on student.sno = tbl.sno;
	
	
-- 2. DOING 查询平均分大于85的学生姓名及选课数目（用子查询）
select
	sname, avg(grade)
from
	sc
	join
	student
	on sc.sno = student.sno
	group by sname
having
	avg(grade) > 85;

-- 3. DOING 查询在2017年6月22日至2017年6月25日期间（含起止日期）参加过考试的学生学号、学生姓名、相应的考试科目名称、考试时间（用子查询方法实现）
select
	sc.sno, student.sname, cname, testtime
from
	sc
	join
	student
	on sc.sno = student.sno
	join
	course
	on course.cno = sc.cno
where
	testtime > '2017-6-22'
	and
	testtime < '2017-6-25';
-- 4. 查询和李敏勇同一个系的学生人数（含李敏勇本人）

-- 5. 查询有不及格科目的学生的平均分（即该生所有科目汇总后的平均分），显示姓名、平均分
-- 6. 查询没有不及格科目的学生的平均分（即该生所有科目汇总后的平均分），显示姓名、平均分
-- 7. 查询选了2门课程（含）以上的学生所在系的分布情况，显示系名、人数
-- 8. 查询选课人数最多的课程的平均分，显示课程名和平均分
-- 9. 查询没有选课的学生名单，显示学号、姓名
-- 10. 查询丁一同学高于其所有课程平均分的那些课程名和成绩。


-- 练习6： 综合练习
-- 1.统计选课人数低于3人且平均分低于80分的课程号
-- 2.统计90分以上成绩最多的学生学号
-- 3.查询没有一门考试科目成绩低于86分的学生的姓名以及平均分
-- 4.查询在2017-6-25前参加考试的各课程的优秀学生人数（即成绩>=90）
-- 5.查询没有一门考试科目成绩低于85分的学生的姓名
-- 6.查询选了课的每位同学的总学分，显示姓名和总学分
-- 7.查询所有学生的成绩情况，显示的列名包括学生姓名、课程号、考试时间、成绩，注意结果集中也应包括未选修课程的学生。
-- 8.查询所有课程的成绩情况，显示的列名包括学生课程名称、学生学号、考试时间、成绩，注意结果集中也应包括未考试的课程。
