-- 多表视图
use schoolwork;

create table stu_info(
       s_id int(3),
       cls varchar(50),
       addr  varchar(100)
);

insert into stu_info
values (1, 'erban', 'anhui'),
       (2, 'sanban', 'chongqing;'),
       (3, 'yiban', 'shangdong');
       
