\c testdb testusr

create table account_master(id integer generated by default as identity, name varchar (255), password varchar (255), primary key (id));
create table account_master_authorities(account_master_id integer not null, authorities_id integer not null);
create table authority_master(id integer generated by default as identity, authority varchar (255), primary key (id));
create table book(id integer generated by default as identity, isbn varchar (255), title varchar (255), category_id integer, format_id integer, primary key (id));
create table category_master(id integer generated by default as identity, name varchar (255), primary key (id));
create table format_master(id integer generated by default as identity, name varchar (255), primary key (id));

alter table account_master_authorities add constraint UK_p5hevk1suyxhwdjkfbo964k63 unique (authorities_id);
alter table account_master_authorities add constraint FKcwryllprbodmvtrl3ttxfyblc foreign key (authorities_id) references authority_master;
alter table account_master_authorities add constraint FKp4ma8bnxc4ho21qho63kifbv6 foreign key (account_master_id) references account_master;
alter table book add constraint FKpl6tm7wssv8rcu50kxv7xy6aj foreign key (category_id) references category_master;
alter table book add constraint FK8p0xjh0oro1bd7yf7da51fntn foreign key (format_id) references format_master;

