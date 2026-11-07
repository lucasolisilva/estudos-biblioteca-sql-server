-- Funções UDF Escalares

CREATE FUNCTION fn_MediaAmostra (@inferior SMALLINT, @superior SMALLINT)
RETURNS REAL
AS
BEGIN
	RETURN 
	(
		SELECT AVG(preco_livro)
		FROM livro
		WHERE id_livro BETWEEN @inferior AND @superior
	)
END;

-- Funções UDF Tabulares (ITVF)

CREATE FUNCTION fn_LivrosPorEditora(@id_editora SMALLINT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
		l.nome_livro, 
		l.preco_livro,
		e.nome_editora
	FROM livro AS l
	INNER JOIN editora AS e
		ON l.id_editora = e.id_editora
	WHERE l.id_editora = @id_editora
);

-- Funções UDF Tabulares (MSTVF)

CREATE FUNCTION fn_LivrosCaros(@preco_minimo MONEY)
RETURNS @resultado TABLE
(
	id_livro SMALLINT,
	nome_livro VARCHAR(100),
	preco_livro MONEY
)
AS
BEGIN
	INSERT INTO @resultado
	SELECT
		id_livro,
		nome_livro,
		preco_livro
	FROM livro
	WHERE preco_livro >= @preco_minimo
	RETURN;
END;


-- Executando as funções escalares

SELECT dbo.fn_MediaAmostra(101, 107);


-- Executando funções tabulares

SELECT * 
FROM dbo.fn_LivrosPorEditora(4);

SELECT *
FROM dbo.fn_LivrosCaros(40.00);