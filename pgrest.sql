create schema api;

create table api.todos (
  id serial primary key,
  done boolean not null default false,
  task text not null,
  due timestamptz
);

insert into api.todos (task) values
  ('finish tutorial 0'), ('pat self on back');

-- create role app_user nologin;

grant usage on schema api to app_user;
grant select on api.todos to app_user;

create role authenticator noinherit login password 'password';
grant app_user to authenticator;
