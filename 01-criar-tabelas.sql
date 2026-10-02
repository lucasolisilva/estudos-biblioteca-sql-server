USE biblioteca;

CREATE TABLE autor (
	id_autor SMALLINT IDENTITY,
	nome_autor VARCHAR(50) NOT NULL,
	sobrenome_autor VARCHAR(60) NOT NULL,

	CONSTRAINT pk_id_autor PRIMARY KEY(id_autor)
);

CREATE TABLE editora (
	id_editora SMALLINT IDENTITY PRIMARY KEY,
	nome_editora VARCHAR(50) NOT NULL
);

CREATE TABLE assunto (
	id_assunto TINYINT IDENTITY PRIMARY KEY,
	nome_assunto VARCHAR(50)
);

CREATE TABLE livro (
	id_livro SMALLINT IDENTITY(100,1) PRIMARY KEY,
	nome_livro VARCHAR(70) NOT NULL,
	isbn13 CHAR(13) UNIQUE NOT NULL,
	data_pub DATE,
	preco_livro MONEY NOT NULL,
	numero_paginas SMALLINT NOT NULL,
	id_editora SMALLINT NOT NULL,
	id_assunto TINYINT NOT NULL,

	CONSTRAINT fk_id_editora FOREIGN KEY(id_editora)
		REFERENCES editora(id_editora) ON DELETE CASCADE,

	CONSTRAINT fk_id_assunto FOREIGN KEY(id_assunto)
		REFERENCES assunto(id_assunto) ON DELETE CASCADE,

	CONSTRAINT verifica_preco CHECK(preco_livro >= 0)
);

-- Tabela associativa com livros e autores

CREATE TABLE livro_autor (
	id_livro SMALLINT NOT NULL,
	id_autor SMALLINT NOT NULL,

	CONSTRAINT fk_id_livro FOREIGN KEY(id_livro)
		REFERENCES livro(id_livro),

	CONSTRAINT fk_id_autor FOREIGN KEY(id_autor)
		REFERENCES autor(id_autor),
		
	CONSTRAINT pk_livro_autor PRIMARY KEY(id_livro, id_autor)
);

