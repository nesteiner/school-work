create database schoolwork;
use schoolwork

create table tb(
       sid	char(8) not null,
       sname 	varchar(20) not null,
       sex   	nchar(2) not null default '男',
       birthday date not null,
       idcard 	char(18) not null,
       phone 	varchar(20),
       email 	varchar(20),

       check(phone is not null or email is not null),
       check(birthday < getdate()),
       primary key(sid));
       

-- ? 删除约束
