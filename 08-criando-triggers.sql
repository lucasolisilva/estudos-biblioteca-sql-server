-- Criando Triggers

CREATE OR ALTER TRIGGER trg_ContadorEditora
ON editora
AFTER INSERT
AS
BEGIN
	SELECT 
		CONCAT('Há ',  COUNT(*), ' editoras cadastradas') AS Cadastro
	FROM editora;
END;

INSERT INTO editora (nome_editora)
VALUES ('Nova Editora');

CREATE OR ALTER TRIGGER trg_BloqueiaAutor
ON autor
INSTEAD OF INSERT
AS
BEGIN
	PRINT 'Cadastro de autores bloqueado no momento';
END;

CREATE OR ALTER TRIGGER trg_ConsultaAutor
ON autor
AFTER INSERT
AS
BEGIN
	EXEC usp_ConsultaAutor;
END;

INSERT INTO autor (nome_autor, sobrenome_autor)
VALUES ('Clarice', 'Lispector');

-- Desabilitando e habilitando Trigger 

ALTER TABLE autor
DISABLE TRIGGER trg_bloqueio_autor;

ALTER TABLE autor
ENABLE TRIGGER trg_bloqueio_autor;

DROP TRIGGER trg_bloqueio_autor;

-- Visualização de triggers

EXEC sp_helptrigger @tabname = editora;

SELECT * FROM sys.triggers
WHERE is_disabled = 1 OR is_disabled = 0