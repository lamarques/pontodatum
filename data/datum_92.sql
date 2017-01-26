
-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.1
-- PostgreSQL version: 9.2
-- Project Site: pgmodeler.com.br
-- Model Author: Rogerio Lamarques


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: datum | type: DATABASE --
-- -- DROP DATABASE IF EXISTS datum;
-- CREATE DATABASE datum
-- 	TEMPLATE = datum
-- ;
-- -- ddl-end --
-- 

-- object: acessos | type: SCHEMA --
-- DROP SCHEMA IF EXISTS acessos CASCADE;
CREATE SCHEMA acessos;
-- ddl-end --
ALTER SCHEMA acessos OWNER TO postgres;
-- ddl-end --

-- object: cadastros | type: SCHEMA --
-- DROP SCHEMA IF EXISTS cadastros CASCADE;
CREATE SCHEMA cadastros;
-- ddl-end --
ALTER SCHEMA cadastros OWNER TO postgres;
-- ddl-end --

-- object: ponto | type: SCHEMA --
-- DROP SCHEMA IF EXISTS ponto CASCADE;
CREATE SCHEMA ponto;
-- ddl-end --
ALTER SCHEMA ponto OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,acessos,cadastros,ponto;
-- ddl-end --

-- object: acessos.seq_usuarios | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS acessos.seq_usuarios CASCADE;
CREATE SEQUENCE acessos.seq_usuarios
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE acessos.seq_usuarios OWNER TO postgres;
-- ddl-end --

-- object: acessos.usuarios | type: TABLE --
-- DROP TABLE IF EXISTS acessos.usuarios CASCADE;
CREATE TABLE acessos.usuarios(
	id_usuarios int4 NOT NULL DEFAULT nextval('acessos.seq_usuarios'::regclass),
	nome varchar(255) NOT NULL,
	login varchar(255) NOT NULL,
	senha varchar(255) NOT NULL,
	ativo bool DEFAULT TRUE,
	CONSTRAINT pri_usuarios PRIMARY KEY (id_usuarios)
	

);
-- ddl-end --
ALTER TABLE acessos.usuarios OWNER TO postgres;
-- ddl-end --

-- object: acessos.seq_grupos | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS acessos.seq_grupos CASCADE;
CREATE SEQUENCE acessos.seq_grupos
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE acessos.seq_grupos OWNER TO postgres;
-- ddl-end --

-- object: acessos.grupos | type: TABLE --
-- DROP TABLE IF EXISTS acessos.grupos CASCADE;
CREATE TABLE acessos.grupos(
	id_grupos int4 NOT NULL DEFAULT nextval('acessos.seq_grupos'::regclass),
	grupo varchar(255) NOT NULL,
	CONSTRAINT pri_grupos PRIMARY KEY (id_grupos)

);
-- ddl-end --
ALTER TABLE acessos.grupos OWNER TO postgres;
-- ddl-end --

-- object: acessos.usuarios_grupos | type: TABLE --
-- DROP TABLE IF EXISTS acessos.usuarios_grupos CASCADE;
CREATE TABLE acessos.usuarios_grupos(
	id_usuarios int4 NOT NULL,
	id_grupos int4 NOT NULL
);
-- ddl-end --
ALTER TABLE acessos.usuarios_grupos OWNER TO postgres;
-- ddl-end --

-- object: acessos.seq_permissoes | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS acessos.seq_permissoes CASCADE;
CREATE SEQUENCE acessos.seq_permissoes
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE acessos.seq_permissoes OWNER TO postgres;
-- ddl-end --

-- object: acessos.permissoes | type: TABLE --
-- DROP TABLE IF EXISTS acessos.permissoes CASCADE;
CREATE TABLE acessos.permissoes(
	id_permissoes int4 NOT NULL DEFAULT nextval('acessos.seq_permissoes'::regclass),
	controle varchar(255) NOT NULL,
	ver bool DEFAULT TRUE,
	modificar bool DEFAULT TRUE,
	administrar bool DEFAULT TRUE,
	CONSTRAINT id_permissoes PRIMARY KEY (id_permissoes)

);
-- ddl-end --
ALTER TABLE acessos.permissoes OWNER TO postgres;
-- ddl-end --

-- object: public.grupos_permissoes | type: TABLE --
-- DROP TABLE IF EXISTS public.grupos_permissoes CASCADE;
CREATE TABLE public.grupos_permissoes(
	id_grupos int4,
	id_permissoes int4,
	ver bool DEFAULT TRUE,
	modificar bool DEFAULT TRUE,
	administrar bool DEFAULT TRUE,
	root bool DEFAULT FALSE
);
-- ddl-end --
ALTER TABLE public.grupos_permissoes OWNER TO postgres;
-- ddl-end --

-- object: cadastros.seq_pessoas | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS cadastros.seq_pessoas CASCADE;
CREATE SEQUENCE cadastros.seq_pessoas
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE cadastros.seq_pessoas OWNER TO postgres;
-- ddl-end --

-- object: public.seq_cadastro_geral | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.seq_cadastro_geral CASCADE;
CREATE SEQUENCE public.seq_cadastro_geral
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.seq_cadastro_geral OWNER TO postgres;
-- ddl-end --

-- object: cadastros.pessoas | type: TABLE --
-- DROP TABLE IF EXISTS cadastros.pessoas CASCADE;
CREATE TABLE cadastros.pessoas(
	id_pessoas int4 NOT NULL DEFAULT nextval('cadastros.seq_pessoas'::regclass),
	nome varchar(255) NOT NULL,
	sobrenome varchar(255),
	documento varchar(20),
	tipo varchar NOT NULL,
	email varchar(255) NOT NULL,
	telefone varchar(255) NOT NULL,
	CONSTRAINT pri_pessoas PRIMARY KEY (id_pessoas)

);
-- ddl-end --
ALTER TABLE cadastros.pessoas OWNER TO postgres;
-- ddl-end --

-- object: cadastros.seq_funcionarios | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS cadastros.seq_funcionarios CASCADE;
CREATE SEQUENCE cadastros.seq_funcionarios
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE cadastros.seq_funcionarios OWNER TO postgres;
-- ddl-end --

-- object: cadastros.funcionarios | type: TABLE --
-- DROP TABLE IF EXISTS cadastros.funcionarios CASCADE;
CREATE TABLE cadastros.funcionarios(
	id_funcionarios int4 NOT NULL DEFAULT nextval('cadastros.seq_funcionarios'::regclass),
	id_pessoas int4,
	matricula varchar(255),
	CONSTRAINT pri_funcionarios PRIMARY KEY (id_funcionarios)

);
-- ddl-end --
ALTER TABLE cadastros.funcionarios OWNER TO postgres;
-- ddl-end --

-- object: cadastros.seq_clientes | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS cadastros.seq_clientes CASCADE;
CREATE SEQUENCE cadastros.seq_clientes
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE cadastros.seq_clientes OWNER TO postgres;
-- ddl-end --

-- object: cadastros.clientes | type: TABLE --
-- DROP TABLE IF EXISTS cadastros.clientes CASCADE;
CREATE TABLE cadastros.clientes(
	id_clientes int4 NOT NULL DEFAULT nextval('cadastros.seq_clientes'::regclass),
	id_pessoas int4 NOT NULL,
	projeto varchar(255),
	CONSTRAINT pri_clientes PRIMARY KEY (id_clientes)

);
-- ddl-end --
ALTER TABLE cadastros.clientes OWNER TO postgres;
-- ddl-end --

-- object: cadastros.clientes_funcionarios | type: TABLE --
-- DROP TABLE IF EXISTS cadastros.clientes_funcionarios CASCADE;
CREATE TABLE cadastros.clientes_funcionarios(
	id_clientes int4 NOT NULL,
	id_funcionarios int4 NOT NULL
);
-- ddl-end --
ALTER TABLE cadastros.clientes_funcionarios OWNER TO postgres;
-- ddl-end --

-- object: ponto.seq_frequencia | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS ponto.seq_frequencia CASCADE;
CREATE SEQUENCE ponto.seq_frequencia
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE ponto.seq_frequencia OWNER TO postgres;
-- ddl-end --

-- object: ponto.frequencia | type: TABLE --
-- DROP TABLE IF EXISTS ponto.frequencia CASCADE;
CREATE TABLE ponto.frequencia(
	id_frequencia int4 NOT NULL DEFAULT nextval('ponto.seq_frequencia'::regclass),
	id_funcionarios int4 NOT NULL,
	entrada1 timestamp,
	saida1 timestamp,
	entrada2 timestamp,
	saida2 timestamp,
	entrada3 timestamp,
	saida3 timestamp,
	entrada4 timestamp,
	saida4 timestamp,
	id_atividades int4,
	observacoes text,
	CONSTRAINT pri_frequencia PRIMARY KEY (id_frequencia)

);
-- ddl-end --
ALTER TABLE ponto.frequencia OWNER TO postgres;
-- ddl-end --

-- object: ponto.seq_atividades_detalhadas | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS ponto.seq_atividades_detalhadas CASCADE;
CREATE SEQUENCE ponto.seq_atividades_detalhadas
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE ponto.seq_atividades_detalhadas OWNER TO postgres;
-- ddl-end --

-- object: ponto.atividades_detalhadas | type: TABLE --
-- DROP TABLE IF EXISTS ponto.atividades_detalhadas CASCADE;
CREATE TABLE ponto.atividades_detalhadas(
	id_atividades_detalhadas int4 NOT NULL DEFAULT nextval('ponto.seq_atividades_detalhadas'::regclass),
	id_frequencia int4 NOT NULL,
	inicio timestamp,
	fim timestamp,
	atividade varchar(50),
	observacao text,
	CONSTRAINT pri_atividades_detalhadas PRIMARY KEY (id_atividades_detalhadas)

);
-- ddl-end --
ALTER TABLE ponto.atividades_detalhadas OWNER TO postgres;
-- ddl-end --

-- object: cadastros.seq_atividades | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS cadastros.seq_atividades CASCADE;
CREATE SEQUENCE cadastros.seq_atividades
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE cadastros.seq_atividades OWNER TO postgres;
-- ddl-end --

-- object: cadastros.atividades | type: TABLE --
-- DROP TABLE IF EXISTS cadastros.atividades CASCADE;
CREATE TABLE cadastros.atividades(
	id_atividades int4 NOT NULL DEFAULT nextval('cadastros.seq_atividades'::regclass),
	id_cliente int4,
	descricao varchar(180),
	CONSTRAINT pri_atividades PRIMARY KEY (id_atividades)

);
-- ddl-end --
ALTER TABLE cadastros.atividades OWNER TO postgres;
-- ddl-end --

-- object: id_usuarios | type: CONSTRAINT --
-- ALTER TABLE acessos.usuarios_grupos DROP CONSTRAINT IF EXISTS id_usuarios CASCADE;
ALTER TABLE acessos.usuarios_grupos ADD CONSTRAINT id_usuarios FOREIGN KEY (id_usuarios)
REFERENCES acessos.usuarios (id_usuarios) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_grupos | type: CONSTRAINT --
-- ALTER TABLE acessos.usuarios_grupos DROP CONSTRAINT IF EXISTS id_grupos CASCADE;
ALTER TABLE acessos.usuarios_grupos ADD CONSTRAINT id_grupos FOREIGN KEY (id_grupos)
REFERENCES acessos.grupos (grupo) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_grupos | type: CONSTRAINT --
-- ALTER TABLE public.grupos_permissoes DROP CONSTRAINT IF EXISTS id_grupos CASCADE;
ALTER TABLE public.grupos_permissoes ADD CONSTRAINT id_grupos FOREIGN KEY (id_grupos)
REFERENCES acessos.grupos (id_grupos) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: id_permissoes | type: CONSTRAINT --
-- ALTER TABLE public.grupos_permissoes DROP CONSTRAINT IF EXISTS id_permissoes CASCADE;
ALTER TABLE public.grupos_permissoes ADD CONSTRAINT id_permissoes FOREIGN KEY (id_permissoes)
REFERENCES acessos.permissoes (id_permissoes) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_pessoas_funcionarios | type: CONSTRAINT --
-- ALTER TABLE cadastros.funcionarios DROP CONSTRAINT IF EXISTS fk_pessoas_funcionarios CASCADE;
ALTER TABLE cadastros.funcionarios ADD CONSTRAINT fk_pessoas_funcionarios FOREIGN KEY (id_pessoas)
REFERENCES cadastros.pessoas (id_pessoas) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_pessoas_clientes | type: CONSTRAINT --
-- ALTER TABLE cadastros.clientes DROP CONSTRAINT IF EXISTS fk_pessoas_clientes CASCADE;
ALTER TABLE cadastros.clientes ADD CONSTRAINT fk_pessoas_clientes FOREIGN KEY (id_pessoas)
REFERENCES cadastros.pessoas (id_pessoas) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_clientes | type: CONSTRAINT --
-- ALTER TABLE cadastros.clientes_funcionarios DROP CONSTRAINT IF EXISTS fk_clientes CASCADE;
ALTER TABLE cadastros.clientes_funcionarios ADD CONSTRAINT fk_clientes FOREIGN KEY (id_clientes)
REFERENCES cadastros.clientes (id_clientes) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_funcionarios | type: CONSTRAINT --
-- ALTER TABLE cadastros.clientes_funcionarios DROP CONSTRAINT IF EXISTS fk_funcionarios CASCADE;
ALTER TABLE cadastros.clientes_funcionarios ADD CONSTRAINT fk_funcionarios FOREIGN KEY (id_funcionarios)
REFERENCES cadastros.funcionarios (id_funcionarios) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_funcionarios | type: CONSTRAINT --
-- ALTER TABLE ponto.frequencia DROP CONSTRAINT IF EXISTS fk_funcionarios CASCADE;
ALTER TABLE ponto.frequencia ADD CONSTRAINT fk_funcionarios FOREIGN KEY (id_funcionarios)
REFERENCES cadastros.funcionarios (id_funcionarios) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_atividades | type: CONSTRAINT --
-- ALTER TABLE ponto.frequencia DROP CONSTRAINT IF EXISTS fk_atividades CASCADE;
ALTER TABLE ponto.frequencia ADD CONSTRAINT fk_atividades FOREIGN KEY (id_atividades)
REFERENCES cadastros.atividades (id_atividades) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_frequencia | type: CONSTRAINT --
-- ALTER TABLE ponto.atividades_detalhadas DROP CONSTRAINT IF EXISTS fk_frequencia CASCADE;
ALTER TABLE ponto.atividades_detalhadas ADD CONSTRAINT fk_frequencia FOREIGN KEY (id_atividades_detalhadas)
REFERENCES ponto.frequencia (id_frequencia) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_clientes | type: CONSTRAINT --
-- ALTER TABLE cadastros.atividades DROP CONSTRAINT IF EXISTS fk_clientes CASCADE;
ALTER TABLE cadastros.atividades ADD CONSTRAINT fk_clientes FOREIGN KEY (id_cliente)
REFERENCES cadastros.clientes (id_clientes) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


