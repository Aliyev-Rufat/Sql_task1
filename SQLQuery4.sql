create database lib

use lib

create table Books
(
Id int primary key identity,
Name nvarchar(100) not null,
AuthorId int foreign key references Books(Id) ,
PageCount int
)

create table Authors
(
Id int primary key identity,
Name nvarchar(100) not null,
Surname nvarchar(100) not null
)


create view get_authors
as
select b.Name, MAX(b.PageCount), a.Name, a.Surname from Books as b
inner join Authors as a
on
b.AuthorId = a.Id
group by b.PageCount
