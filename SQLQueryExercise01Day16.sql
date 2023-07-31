create database Day16ExerciseDb
create table Student
(Sid int primary key,
SName nvarchar(50) not null,
SEmail nvarchar(50) not null unique,
SContatct nvarchar(10) unique)
insert into Student values(12,'Rinkal','rink@gmail.com','9922672354')
insert into Student values(13,'Sam','sam@gmail.com','9915672367')
insert into Student values(14,'Ankita','ankita@gmail.com','9342672356')
insert into Student values(15,'Raju','raju@gmail.com','9456672345')
create table Fee
(Sid int foreign key references Student(Sid),
SFee float,
SMonth int,
SYear int)
insert into Fee values(12,56000,2,2002)
insert into Fee values(14,45000,7,2002)
insert into Fee values(15,45600,8,2003)
create table PayConfirmation
(Sid int,
Name nvarchar(50),
Email nvarchar(50),
Fee float,
PaidOnDate date,
ActiontTaken nvarchar(50),
ActionTime datetime)
create trigger trgFeePayConfirmation
on Fee
after insert 
as 
declare @id int
declare @name nvarchar(50)
declare @email nvarchar(50)
declare @fee float
select @id=Sid from inserted
select @name=SName from Student where Sid=@id
select @email=SEmail from Student where Sid=@id
select @fee=SFee from inserted
insert into PayConfirmation(Sid,Name,Email,Fee,PaidOnDate)
values(@id,@name,@email,@fee,getdate())
print 'Trigger Fired Action Cpatured!!!'

select* from PayConfirmation