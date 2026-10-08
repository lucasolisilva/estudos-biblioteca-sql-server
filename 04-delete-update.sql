USE biblioteca

-- Deleção de registros com DELETE

SELECT id_assunto, nome_assunto
FROM assunto
WHERE id_assunto = 8;

DELETE FROM assunto
WHERE id_assunto = 8;

SELECT * FROM assunto;

-- Atualizando registros de uma tabela

SELECT * FROM livro;

SELECT id_livro, nome_livro
FROM livro
WHERE id_livro = 116;

UPDATE livro
SET nome_livro = 'Eu, Robô'
WHERE id_livro = 116;

SELECT id_livro, nome_livro, preco_livro, numero_paginas
FROM livro
WHERE id_livro = 105;

UPDATE livro
SET preco_livro = preco_livro * 1.2
WHERE id_livro = 105;

UPDATE livro
SET preco_livro = preco_livro * 0.8
WHERE id_livro = 105;

UPDATE livro
SET preco_livro = 60.00, numero_paginas = 320
WHERE id_livro = 105;

-- Utilizando AS para dar nomes alternativos temporários às consultas

SELECT nome_livro AS Livros
FROM livro;

SELECT nome_autor AS Nome, sobrenome_autor AS Sobrenome
FROM autor;

SELECT TOP(5) 
	nome_livro AS 'Livros mais caros', 
	preco_livro AS 'Preço dos livros'
FROM livro
ORDER BY 'Preço dos livros' DESC;

