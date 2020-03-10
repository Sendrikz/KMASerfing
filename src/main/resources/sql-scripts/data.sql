INSERT INTO role (id, name, description) VALUES (1, 'USER', 'User - Has no admin rights');
INSERT INTO role (id, name, description) VALUES (2, 'ADMIN', 'Admin - Has permission to perform admin tasks');

-- USER
-- non-encrypted password: jwtpass
INSERT INTO user (id, first_name, last_name, password, email) VALUES (1, 'Olha', 'Yurieva', '$2a$10$qtH0F1m488673KwgAfFXEOWxsoZSeHqqlB/8BTt3a6gsI5c2mdlfe', 'Olha_Yurieva@ukma.com');
INSERT INTO user (id, first_name, last_name, password, email) VALUES (2, 'Admin', 'Admin', '$2a$10$qtH0F1m488673KwgAfFXEOWxsoZSeHqqlB/8BTt3a6gsI5c2mdlfe', 'Admin_Admin@ukma.com');


INSERT INTO user_role(user_id, role_id) VALUES(1,1);
INSERT INTO user_role(user_id, role_id) VALUES(2,1);
INSERT INTO user_role(user_id, role_id) VALUES(2,2);


