CREATE DATABASE IF NOT EXISTS geodata;
USE geodata;

CREATE TABLE IF NOT EXISTS state(
  initial VARCHAR(3) NOT NULL,
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (initial));


CREATE TABLE IF NOT EXISTS city (
  idcity INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  geometry GEOMETRY NOT NULL,
  fk_city_state VARCHAR(3) NOT NULL,
  PRIMARY KEY (idcity),
  INDEX fk_city_state_idx (fk_city_state ASC) VISIBLE,
  CONSTRAINT fk_city_state
    FOREIGN KEY (fk_city_state)
    REFERENCES state (initial)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS point (
  idpoint INT NOT NULL AUTO_INCREMENT,
  code VARCHAR(45) NOT NULL,
  responsible VARCHAR(45) NOT NULL,
  water_body VARCHAR(45) NOT NULL,
  year INT NOT NULL,
  count INT NOT NULL,
  mean DOUBLE NOT NULL,
  min DOUBLE NOT NULL,
  max DOUBLE NOT NULL,
  stddev DOUBLE NOT NULL,
  variance DOUBLE NOT NULL,
  geometry GEOMETRY NOT NULL,
  state_initial VARCHAR(3) NOT NULL,
  PRIMARY KEY (idpoint),
  INDEX fk_point_state_idx (state_initial ASC) VISIBLE,
  CONSTRAINT fk_point_state
    FOREIGN KEY (state_initial)
    REFERENCES state (initial)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
/* ref: https://www.linhadecomando.com/php/php-mysql-tabela-de-state-brasileiros */

INSERT INTO state(initial,name) VALUES ('AC', 'Acre');
INSERT INTO state(initial,name) VALUES ('AL', 'Alagoas');
INSERT INTO state(initial,name) VALUES ('AP', 'Amapá');
INSERT INTO state(initial,name)  VALUES ('AM', 'Amazonas');
INSERT INTO state(initial,name)  VALUES ('BA', 'Bahia');
INSERT INTO state(initial,name)  VALUES ('CE', 'Ceará');
INSERT INTO state(initial,name)  VALUES ('DF', 'Distrito Federal');
INSERT INTO state(initial,name)  VALUES ('ES', 'Espírito Santo');
INSERT INTO state(initial,name)  VALUES ('GO', 'Goiás');
INSERT INTO state(initial,name)  VALUES ('MA', 'Maranhão');
INSERT INTO state(initial,name)  VALUES ('MT', 'Mato Grosso');
INSERT INTO state(initial,name)  VALUES ('MS', 'Mato Grosso do Sul');
INSERT INTO state(initial,name)  VALUES ('MG', 'Minas Gerais');
INSERT INTO state(initial,name)  VALUES ('PA', 'Pará');
INSERT INTO state(initial,name)  VALUES ('PB', 'Paraíba');
INSERT INTO state(initial,name)  VALUES ('PR', 'Paraná');
INSERT INTO state(initial,name)  VALUES ('PE', 'Pernambuco');
INSERT INTO state(initial,name)  VALUES ('PI', 'Piauí');
INSERT INTO state(initial,name)  VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO state(initial,name)  VALUES ('RN', 'Rio Grande do Norte');
INSERT INTO state(initial,name)  VALUES ('RS', 'Rio Grande do Sul');
INSERT INTO state(initial,name)  VALUES ('RO', 'Rondônia');
INSERT INTO state(initial,name)  VALUES ('RR', 'Roraima');
INSERT INTO state(initial,name)  VALUES ('SC', 'Santa Catarina');
INSERT INTO state(initial,name)  VALUES ('SP', 'São Paulo');
INSERT INTO state(initial,name)  VALUES ('SE', 'Sergipe');
INSERT INTO state(initial,name)  VALUES ('TO', 'Tocantins');

select * from city;
select count(*) from point where state_initial = "PR" ;

