-- Вставка в таблицу t_user, только если запись с id = 1 не существует
INSERT INTO t_user(id, c_username)
VALUES (1, 'dbuser')
ON CONFLICT (id) DO NOTHING;

-- Вставка в таблицу t_user_password, только если запись с id_user = 1 не существует
INSERT INTO t_user_password(id_user, c_password)
VALUES (1, '{noop}password')
ON CONFLICT (id_user) DO NOTHING;

-- Вставка в таблицу t_user_authority, только если запись с id_user = 1 не существует
INSERT INTO t_user_authority(id_user, c_authority)
VALUES (1, 'ROLE_DB_USER'), (1, 'ROLE_USER')
ON CONFLICT (id_user, c_authority) DO NOTHING;
