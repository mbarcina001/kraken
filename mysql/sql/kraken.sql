CREATE TABLE if not exists user(
    id int PRIMARY KEY AUTO_INCREMENT,
    email varchar(50),
    password varchar(60),
    name varchar(50),
    accountNonExpired TINYINT NOT NULL DEFAULT 1,
    accountNonLocked TINYINT NOT NULL DEFAULT 1,
    credentialsNonExpired TINYINT NOT NULL DEFAULT 1
);

CREATE TABLE if not exists role(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(20)
);

CREATE TABLE if not exists user_role(
    user_id int,
    role_id int,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (role_id) REFERENCES role (id)
);

CREATE TABLE if not exists meeting(
    id int PRIMARY KEY AUTO_INCREMENT,
    description varchar(50),
    organiser_id int,
    meeting_start_date DATETIME,
    meeting_end_date DATETIME,
    FOREIGN KEY (organiser_id) REFERENCES user (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE if not exists meeting_attendant(
    user_id int,
    meeting_id int,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (meeting_id) REFERENCES meeting (id)
);

CREATE TABLE oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
);

create table if not exists oauth_access_token (
  token_id VARCHAR(255),
  token BLOB,
  authentication_id VARCHAR(255) PRIMARY KEY,
  user_name VARCHAR(255),
  client_id VARCHAR(255),
  authentication BLOB,
  refresh_token VARCHAR(255)
);

create table if not exists oauth_refresh_token (
  token_id VARCHAR(255),
  token BLOB,
  authentication BLOB
);

create table if not exists oauth_client_token (
  token_id VARCHAR(255),
  token BLOB,
  authentication_id VARCHAR(255) PRIMARY KEY,
  user_name VARCHAR(255),
  client_id VARCHAR(255)
);

create table if not exists oauth_code (
  code VARCHAR(255), authentication BLOB
);  

create table if not exists oauth_approvals (
  userId VARCHAR(255),
  clientId VARCHAR(255),
  scope VARCHAR(255),
  status VARCHAR(10),
  expiresAt TIMESTAMP,
  lastModifiedAt TIMESTAMP
);  

create table if not exists ClientDetails (
  appId VARCHAR(255) PRIMARY KEY,
  resourceIds VARCHAR(255),
  appSecret VARCHAR(255),
  scope VARCHAR(255),
  grantTypes VARCHAR(255),
  redirectUrl VARCHAR(255),
  authorities VARCHAR(255),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additionalInformation VARCHAR(4096),
  autoApproveScopes VARCHAR(255)
);

INSERT INTO user (id, name, password, email) VALUES 
    (1, 'admin', '$2y$12$Y.sySM0y6PPPDz4918TOqOi6IHuOS9RNYpsZcX1HJz91mZV2y0GOe', 'admin@kraken.com'), 
    (2, 'userA', '$2y$12$5Obu2CgOvdAGk7aHChzvDOtMMk8ds10lTzLJxvXpiM7aJv39XQcgm', 'userA@kraken.com'),
    (3, 'userB', '$2y$12$5Obu2CgOvdAGk7aHChzvDOtMMk8ds10lTzLJxvXpiM7aJv39XQcgm', 'userB@kraken.com'),
    (4, 'userC', '$2y$12$5Obu2CgOvdAGk7aHChzvDOtMMk8ds10lTzLJxvXpiM7aJv39XQcgm', 'userC@kraken.com'),
    (5, 'userD', '$2y$12$5Obu2CgOvdAGk7aHChzvDOtMMk8ds10lTzLJxvXpiM7aJv39XQcgm', 'userD@kraken.com'),
    (6, 'userE', '$2y$12$5Obu2CgOvdAGk7aHChzvDOtMMk8ds10lTzLJxvXpiM7aJv39XQcgm', 'userE@kraken.com'),
    (7, 'userF', '$2y$12$5Obu2CgOvdAGk7aHChzvDOtMMk8ds10lTzLJxvXpiM7aJv39XQcgm', 'userF@kraken.com'),
    (8, 'userG', '$2y$12$5Obu2CgOvdAGk7aHChzvDOtMMk8ds10lTzLJxvXpiM7aJv39XQcgm', 'userG@kraken.com'),
    (9, 'userH', '$2y$12$5Obu2CgOvdAGk7aHChzvDOtMMk8ds10lTzLJxvXpiM7aJv39XQcgm', 'userH@kraken.com'),
    (10, 'userI', '$2y$12$5Obu2CgOvdAGk7aHChzvDOtMMk8ds10lTzLJxvXpiM7aJv39XQcgm', 'userI@kraken.com');

INSERT INTO role(id, name) VALUES
    (1, 'ROLE_ADMIN'),
    (2, 'ROLE_USER');

INSERT INTO user_role(user_id, role_id) VALUES
    (1, 1),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),
    (6, 2),
    (7, 2),
    (8, 2),
    (9, 2),
    (10, 2);

INSERT INTO meeting(id, description, organiser_id, meeting_start_date, meeting_end_date) VALUES
    (1, 'test meeting A', 1, '2020-09-01 10:10:10', '2020-09-01 11:10:10'),
    (2, 'test meeting B', 1, '2020-10-01 10:10:10', '2020-10-01 11:10:10'),
    (3, 'test meeting C', 1, '2020-11-01 10:10:10', '2020-11-01 11:10:10'),
    (4, 'test meeting D', 1, '2020-12-01 10:10:10', '2020-12-01 11:10:10'),
    (5, 'test meeting E', 1, '2021-01-01 10:10:10', '2021-01-01 11:10:10'),
    (6, 'test meeting F', 1, '2021-02-01 10:10:10', '2021-02-01 11:10:10'),
    (7, 'test meeting G', 1, '2021-03-01 10:10:10', '2021-03-01 11:10:10'),
    (8, 'test meeting H', 1, '2021-04-01 10:10:10', '2021-04-01 11:10:10'),
    (9, 'test meeting I', 1, '2021-05-01 10:10:10', '2021-05-01 11:10:10'),
    (10, 'test meeting J', 1, '2021-06-01 10:10:10', '2021-06-01 11:10:10'),
    (11, 'test meeting K', 1, '2021-07-01 10:10:10', '2021-07-01 11:10:10'),
    (12, 'test meeting L', 1, '2021-08-01 10:10:10', '2021-08-01 11:10:10'),
    (13, 'test meeting M', 1, '2021-09-01 10:10:10', '2021-09-01 11:10:10'),
    (14, 'test meeting N', 1, '2021-10-01 10:10:10', '2021-10-01 11:10:10'),
    (15, 'test meeting Ñ', 1, '2021-11-01 10:10:10', '2021-11-01 11:10:10'),
    (16, 'test meeting O', 1, '2021-12-01 10:10:10', '2021-12-01 11:10:10'),
    (17, 'test meeting P', 1, '2021-12-01 10:10:10', '2021-12-01 11:10:10'),
    (18, 'test meeting Q', 1, '2022-01-01 10:10:10', '2022-01-01 11:10:10'),
    (19, 'test meeting R', 1, '2022-02-01 10:10:10', '2022-02-01 11:10:10'),
    (20, 'test meeting S', 1, '2022-03-01 10:10:10', '2022-03-01 11:10:10'),
    (21, 'test meeting T', 1, '2022-04-01 10:10:10', '2022-04-01 11:10:10'),
    (22, 'test meeting U', 1, '2022-05-01 10:10:10', '2022-05-01 11:10:10'),
    (23, 'test meeting V', 1, '2022-06-01 10:10:10', '2022-06-01 11:10:10'),
    (24, 'test meeting W', 1, '2022-07-01 10:10:10', '2022-07-01 11:10:10'),
    (25, 'test meeting X', 1, '2022-08-01 10:10:10', '2022-08-01 11:10:10'),
    (26, 'test meeting Y', 1, '2022-09-01 10:10:10', '2022-09-01 11:10:10'),
    (27, 'test meeting Z', 1, '2022-10-01 10:10:10', '2022-10-01 11:10:10');

INSERT INTO meeting_attendant(user_id, meeting_id) VALUES
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (2, 2),
    (8, 2),
    (9, 2),
    (3, 3),
    (5, 3),
    (6, 3),
    (10, 3),
    (2, 4),
    (3, 4),
    (5, 4),
    (6, 4),
    (9, 4),
    (3, 5),
    (4, 5),
    (8, 5),
    (2, 6),
    (10, 6),
    (5, 7),
    (8, 7),
    (9, 7),
    (3, 8),
    (5, 8),
    (6, 8),
    (7, 8),
    (8, 8),
    (2, 9),
    (3, 9),
    (5, 9),
    (3, 10),
    (6, 10),
    (2, 11),
    (4, 11),
    (5, 11),
    (6, 11),
    (8, 11),
    (9, 11),
    (2, 12),
    (7, 12),
    (10, 12),
    (3, 13),
    (4, 13),
    (5, 13),
    (2, 14),
    (6, 14),
    (3, 15),
    (6, 15),
    (7, 15),
    (8, 15),
    (9, 15),
    (10, 15),
    (4, 15),
    (2, 16),
    (5, 16),
    (8, 16),
    (9, 16),
    (10, 16),
    (2, 17),
    (3, 17),
    (6, 17),
    (8, 17),
    (9, 17),
    (3, 18),
    (5, 18),
    (6, 18),
    (9, 18),
    (10, 18),
    (7, 18),
    (2, 19),
    (3, 19),
    (5, 19),
    (6, 19),
    (8, 19),
    (9, 19),
    (3, 20),
    (4, 20),
    (5, 20),
    (10, 20),
    (2, 21),
    (3, 21),
    (4, 21),
    (6, 21),
    (9, 21),
    (3, 22),
    (4, 22),
    (2, 23),
    (3, 23),
    (5, 23),
    (6, 23),
    (3, 24),
    (5, 24),
    (6, 24),
    (7, 24),
    (8, 24),
    (2, 25),
    (4, 25),
    (10, 25),
    (2, 26),
    (3, 26),
    (7, 27),
    (8, 27),
    (9, 27),
    (10, 27);

INSERT INTO oauth_client_details
    (client_id, client_secret, scope, authorized_grant_types,
        authorities, resource_ids)
VALUES
    ('krakenapp', '$2y$12$Ta4Fn9sgEMST/EL98Ujc/O5x35ip7hQUOzMECDEc4e5FLUrZj33cq', 'read,write', 'password,refresh_token,client_credentials,authorization_code', 
        'USER', 'krakenresource'); 