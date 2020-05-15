DROP DATABASE IF EXISTS hangout;
DROP USER IF EXISTS hangout_user@localhost;
CREATE DATABASE hangout CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE USER hangout_user@localhost IDENTIFIED BY 'lovemarie4';

GRANT ALL PRIVILEGES ON hangout.* TO hangout_user@localhost;
