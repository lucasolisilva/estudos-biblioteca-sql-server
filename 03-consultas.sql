USE biblioteca;

SELECT nome_livro FROM livro;

SELECT sobrenome_autor FROM autor;

SELECT * FROM autor;

SELECT nome_livro,numero_paginas, preco_livro
FROM livro;

SELECT DISTINCT id_editora
FROM livro;

-- Criação de nova tabela com SELECT INTO

SELECT nome_livro, isbn13
INTO livro_isbn
FROM livro;

SELECT * FROM livro_isbn;

-- Deleção da tabela criada para exemplificação

DROP TABLE livro_isbn;

-- Exercícios de fixação

SELECT nome_livro, preco_livro, data_pub
FROM livro
ORDER BY data_pub;

SELECT nome_assunto FROM assunto;

SELECT nome_editora, id_editora
FROM editora;

SELECT DISTINCT id_assunto
FROM livro;

SELECT *
INTO livro_ficcao
FROM livro
WHERE id_assunto = 1;

SELECT * FROM livro_ficcao;

DROP TABLE livro_ficcao;

SELECT AVG(preco_livro)
FROM livro;

-- Utilizando ORDER BY para ordenação nas querys

SELECT nome_livro
FROM livro
ORDER BY nome_livro;

SELECT nome_livro, id_editora
FROM livro
ORDER BY id_editora;

SELECT nome_livro, numero_paginas, preco_livro
FROM livro
ORDER BY preco_livro DESC;

SELECT nome_livro, preco_livro, id_editora
FROM livro
ORDER BY id_editora, preco_livro;

SELECT nome_livro, preco_livro, id_editora
FROM livro
ORDER BY id_editora ASC, preco_livro DESC;


-- Restrição de resultados com SELECT TOP

SELECT TOP(5) nome_livro
FROM livro
ORDER BY nome_livro;

SELECT TOP(25) PERCENT nome_livro, preco_livro
FROM livro
ORDER BY preco_livro DESC;

-- TOP com WITH TIES para valores empatados

SELECT TOP(5) WITH TIES
	nome_livro, preco_livro
FROM livro
ORDER BY preco_livro;
