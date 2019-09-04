create table notice(
n_num int primary key auto_increment,
n_writer varchar(100) not null,
n_title varchar(200) not null,
n_content varchar(16384) not null,
#n_flag varchar(2) not null, # 1이면 회사 공지사항, 2면 회원 공지사항
#n_ip varchar(60) not null, 
#n_status varchar(2) not null, # 1이면 일반글, 2이면 삭제글 1만 select해서 보여주고 db에는 모두 저장한다.
n_regdate datetime not null
);

