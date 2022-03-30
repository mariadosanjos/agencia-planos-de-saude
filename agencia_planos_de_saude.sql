CREATE TABLE cliente (
	id_cliente int not null generated always as identity,
	nome varchar(255) not null,
	data_nascimento date not null,
	email varchar(100) not null,
	contrato_id int not null,
	constraint cliente_pk primary key(id_cliente)
);

CREATE TABLE dependente (
	cliente_id int not null,
	titular_id int not null,
	constraint dependente_pk primary key(cliente_id),
	constraint titular_fk foreign key (titular_id) references cliente(id_cliente)
);

CREATE TABLE produto (
	cod_ANS int not null generated always as identity,
	descricao varchar(100) not null,
	valor money not null,
	constraint produto_pk primary key(cod_ANS)
);

CREATE TABLE contrato (
	id_contrato int not null generated always as identity,
	cliente_id int not null,
	data_inicio_vigencia date not null,
	produto_id int not null,
	constraint contrato_pk primary key(id_contrato),
	constraint cliente_fk foreign key (cliente_id) references cliente(id_cliente),
	constraint produto_fk foreign key (produto_id) references produto(cod_ANS)
);

ALTER TABLE cliente ADD CONSTRAINT contrato_fk foreign key (contrato_id) references contrato(id_contrato);

CREATE TABLE contrato_produto (
	contrato_id int not null,
	produto_id int not null,
	constraint contrato_prduto_pk primary key (contrato_id, produto_id),
	constraint contrato_fk foreign key (contrato_id) references contrato(id_contrato),
	constraint produto_fk foreign key (produto_id) references produto(cod_ANS)
);