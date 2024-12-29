-- Удаление существующих таблиц с каскадным удалением зависимостей
drop table if exists t_user_authority cascade;
drop table if exists t_user_password cascade;
drop table if exists t_user cascade;

-- Создание новых таблиц
create table t_user (
    id bigserial primary key,
    c_username varchar(255) not null unique
);

create table t_user_password (
    id bigserial primary key,
    id_user int not null unique references t_user(id) on delete cascade,
    c_password text not null
);

create table t_user_authority (
    id bigserial primary key,
    id_user int not null references t_user(id) on delete cascade,
    c_authority varchar(50) not null,
    constraint unique_user_authority unique (id_user, c_authority)  -- добавлено уникальное ограничение
);
