CREATE SCHEMA IF NOT EXISTS apilogin;

SET search_path TO apilogin;

CREATE TABLE IF NOT EXISTS privilege(
    id uuid not null,
	"name" varchar(100) not null,
	constraint privilege_pkey primary key (id)
);

CREATE TABLE IF NOT EXISTS users(
    id uuid NOT NULL,
	"name" varchar(100) NOT NULL,
	login varchar(100) NOT NULL,
	"password" varchar(255) NOT NULL,
	fone varchar(255) NULL,
	privilege_id uuid not null,
	createdat timestamp NOT NULL DEFAULT CURRENT_DATE,
	updatedat timestamp NOT NULL DEFAULT CURRENT_DATE,
	CONSTRAINT users_login_key UNIQUE (login),
	CONSTRAINT users_pkey PRIMARY KEY (id),
	foreign key (privilege_id) references privilege(id)
);


insert into apilogin.privilege (id,name) values ('7637319e-07a9-4fb3-b9da-823080e29dd4','admin');

insert into apilogin.users (id, name, login, "password", privilege_id) 
values('73d04928-baa1-463e-bfc0-d00365091957', 'admin', 'admin','admin','7637319e-07a9-4fb3-b9da-823080e29dd4' );