-- Criando views

CREATE VIEW vw_livros_detalhados AS
SELECT
	l.nome_livro,
	a.nome_assunto,
	e.nome_editora
FROM livro AS l
INNER JOIN assunto AS a
	ON a.id_assunto = l.id_assunto
INNER JOIN editora AS e
	ON e.id_editora = l.id_editora;

CREATE VIEW vw_livros_mais_caros AS
SELECT TOP 7
	l.nome_livro AS 'Nome do livro',
	l.preco_livro AS Preço,
	a.nome_assunto AS Assunto
FROM livro AS l
INNER JOIN assunto AS a
	ON a.id_assunto = l.id_assunto
ORDER BY l.preco_livro DESC;


-- View com verificação

IF OBJECT_ID('vw_livro_assunto', 'view') IS NOT NULL
	DROP VIEW vw_livro_assunto;
GO
CREATE VIEW vw_livro_assunto AS
SELECT 
	l.nome_livro AS Livro,
	a.nome_assunto AS Assunto
FROM livro AS l
INNER JOIN assunto AS a
	ON a.id_assunto = l.id_assunto;
GO

-- Consultando código da view

EXEC sp_helptext vw_livros_mais_caros;
