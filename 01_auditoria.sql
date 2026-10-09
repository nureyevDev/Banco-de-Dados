CREATE DATABASE banco_v2_integridade;

USE banco_v2_integridade;


CREATE TABLE IF NOT EXISTS banco_v2_integridade.categorias LIKE banco.categorias;
INSERT INTO banco_v2_integridade.categorias SELECT * FROM banco.categorias;

CREATE TABLE IF NOT EXISTS banco_v2_integridade.clientes LIKE banco.clientes;
INSERT INTO banco_v2_integridade.clientes SELECT * FROM banco.clientes;

CREATE TABLE IF NOT EXISTS banco_v2_integridade.locais LIKE banco.locais;
INSERT INTO banco_v2_integridade.locais SELECT * FROM banco.locais;

CREATE TABLE IF NOT EXISTS banco_v2_integridade.lojas LIKE banco.lojas;
INSERT INTO banco_v2_integridade.lojas SELECT * FROM banco.lojas;

CREATE TABLE IF NOT EXISTS banco_v2_integridade.pedidos LIKE banco.pedidos;
INSERT INTO banco_v2_integridade.pedidos SELECT * FROM banco.pedidos;

CREATE TABLE IF NOT EXISTS banco_v2_integridade.produtos LIKE banco.produtos;
INSERT INTO banco_v2_integridade.produtos SELECT * FROM banco.produtos;

CREATE TABLE IF NOT EXISTS banco_v2_integridade.vendedores LIKE banco.vendedores;
INSERT INTO banco_v2_integridade.vendedores SELECT * FROM banco.vendedores;



