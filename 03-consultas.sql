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


-- Filtrando registros com WHERE

SELECT *
FROM livro
WHERE id_editora = 3;

SELECT id_autor, nome_autor
FROM autor
WHERE sobrenome_autor = 'Verne';

SELECT nome_livro, preco_livro
FROM livro
WHERE preco_livro > 100
ORDER BY preco_livro DESC;

SELECT *
FROM livro
WHERE id_editora IN (3,4,7);

SELECT *
FROM livro
WHERE preco_livro BETWEEN 40 AND 90;

SELECT *
FROM livro
WHERE nome_livro LIKE 'O%';

SELECT *
FROM autor
WHERE nome_autor IS NOT NULL;

-- % significa qualquer conjunto de caracteres

-- Concatenação de consultas com WHERE

SELECT nome_livro, data_pub
FROM livro
WHERE id_editora = (
	SELECT id_editora
	FROM editora
	WHERE nome_editora = 'Aleph'
)
ORDER BY nome_livro;


-- Filtros combinados com operaores lógicos

SELECT * FROM livro
WHERE id_livro > 102 AND id_editora < 4;

SELECT * FROM livro
WHERE id_livro > 110 OR id_editora < 4;

SELECT * FROM livro
WHERE id_livro > 112 OR NOT id_editora < 4;

SELECT * FROM livro
WHERE data_pub BETWEEN '20040613' AND '20140507';

SELECT id_livro, nome_livro, preco_livro
FROM livro
WHERE preco_livro BETWEEN 50 AND 100;

SELECT nome_livro, preco_livro, data_pub
FROM livro
WHERE preco_livro >= 25.00
AND data_pub BETWEEN '20050610' AND '20160708'
OR data_pub BETWEEN '19900101' AND '20040613'
ORDER BY data_pub;


-- Combinando consultas com UNION

SELECT nome_autor AS Nome, 'autor' AS Tipo
FROM autor
UNION
SELECT nome_editora AS Nome, 'editora' AS Tipo
FROM editora;


SELECT nome_livro AS Nome, 'Livro' AS Tipo
FROM livro
UNION
SELECT nome_assunto AS Nome, 'Assunto' AS Tipo
FROM assunto;

SELECT nome_autor AS nome, 'Autor' AS Tipo
FROM autor
UNION
SELECT nome_editora AS nome, 'Editora' AS Tipo
FROM editora
UNION
SELECT nome_assunto AS Nome, 'Assunto' AS Tipo
FROM assunto
UNION
SELECT nome_livro AS Nome, 'Livro' AS Tipo
FROM livro
ORDER BY Tipo;

-- Explorando funções por agregação

SELECT COUNT(*) AS total
FROM autor;

SELECT MAX(preco_livro) AS maior_preco
FROM livro;

SELECT MIN(numero_paginas) AS menor_numero
FROM livro;

SELECT MAX(numero_paginas) AS menor_numero
FROM livro;

SELECT (preco_livro) AS media_preco
FROM livro;

SELECT SUM(preco_livro) AS valor_total
FROM livro
WHERE id_editora = 3;

SELECT AVG(preco_livro) AS 'Média dos preços'
FROM livro;

SELECT SUM(preco_livro) AS valor_total
FROM livro;

SELECT COUNT(*) AS total
FROM livro
WHERE id_assunto = 1;

SELECT SUM(preco_livro) / COUNT(*) AS 'Preço médio'
FROM livro;

SELECT nome_livro, preco_livro
FROM livro
WHERE preco_livro = (
	SELECT MAX(preco_livro)
	FROM livro
);

SELECT id_editora, COUNT(*) AS 'Quantidade de livros por editora'
FROM livro
GROUP BY id_editora;

SELECT 
	id_editora, 
	AVG(preco_livro) AS 'Preço médio'
FROM livro
GROUP BY id_editora;