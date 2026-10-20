-- Criando procedures

CREATE PROCEDURE usp_PrecoLivro
AS
BEGIN
	SELECT nome_livro, preco_livro
	FROM livro
	ORDER BY preco_livro;
END;

CREATE PROCEDURE usp_PrecoLivroPorEditora
	(@id_editora INT)
AS
BEGIN
	SELECT 
		l.nome_livro, 
		l.preco_livro, 
		e.nome_editora
	FROM livro AS l
	INNER JOIN editora AS e
		ON e.id_editora = l.id_editora
	WHERE l.id_editora = @id_editora
	ORDER BY preco_livro DESC;
END;

ALTER PROCEDURE usp_PrecoLivroPorEditora
	(@id_editora SMALLINT)
AS
BEGIN
	SELECT 
		l.nome_livro, 
		l.preco_livro, 
		e.nome_editora
	FROM livro AS l
	INNER JOIN editora AS e
		ON e.id_editora = l.id_editora
	WHERE l.id_editora = @id_editora
	ORDER BY preco_livro DESC;
END;

CREATE PROCEDURE usp_PrecoTotalLivro
	(@id_livro SMALLINT, @quantidade SMALLINT)
AS
BEGIN
	SELECT 
		nome_livro AS Livro,
		@quantidade AS Quantidade,
		preco_livro * @quantidade AS 'Valor total'
	FROM livro
	WHERE id_livro = @id_livro;
END;

CREATE PROCEDURE usp_CadastroEditoras
	(@nome VARCHAR(50))
AS
BEGIN
	INSERT INTO editora(nome_editora)
	VALUES (@nome);
END;


-- Criando procedure criptografada

CREATE PROCEDURE usp_LivroISBN
WITH ENCRYPTION
AS
BEGIN
	SELECT nome_livro, isbn13
	FROM livro;
END;

EXEC usp_PrecoLivro;

EXEC sp_helptext usp_LivroISBN;

EXEC usp_PrecoLivroPorEditora 3;

EXEC usp_PrecoTotalLivro 104, 5;

EXEC usp_CadastroEditoras 'Círculo do Livro'