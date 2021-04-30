-- 练习1
create database Studmanager
on
(name = Studmanager,
 filename = 'd:\\data\\Studmanager_Data.mdf',
 size = 25mb,
 maxsize = 100mb,
 filegrowth = 10)
log on 
(name = Studmanager_Log
 filename = 'd:\\data\\Studmanager_Log.ldf',
 size = 15mb,
 maxsize = 40mb,
 filegrowth = 10);

-- 练习2
alter database Studmanager
add file
(name = Studmanager_Data2,
filename = 'd:\\data\\Studmanager_Data2.ndf',
size = 30mb,);

-- 练习3
alter database Studmanager
modify file
(name = Studmanager_Log,
maxsize = 50mb);

dbcc shrinkfile (Studmanager_Data2, 10mb);


