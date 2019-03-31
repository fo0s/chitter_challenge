## Chitter database recreation

- Create database
  - CREATE DATABASE chitter_users;
  - \c chitter_users
  - CREATE TABLE chitterusers(id SERIAL PRIMARY KEY, fullname VARCHAR(40), email VARCHAR(60), username VARCHAR(20), password VARCHAR(30));
  - \ds
