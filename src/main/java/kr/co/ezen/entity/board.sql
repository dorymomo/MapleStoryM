create table mboard(
   idx int not null auto_increment,
   title varchar(100) not null,
   content varchar(2000) not null,
   writer varchar(30) not null,
   indate datetime default now(),
   count int default 0,
   primary key(idx)
);

insert into mboard(title,content,writer)
values('게시판1','게시판1','관리자1');

insert into mboard(title,content,writer)
values('게시판2','게시판2','관리자2');

insert into mboard(title,content,writer)
values('게시판3','게시판3','관리자3');

select *from mboard;
DELETE FROM mboard WHERE idx = 8;